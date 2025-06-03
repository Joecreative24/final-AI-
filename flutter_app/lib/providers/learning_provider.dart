import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/subject_model.dart';
import '../models/daily_goal.dart';
import '../models/chat_message.dart';
import '../services/gemini_service.dart';

class LearningProvider with ChangeNotifier {
  List<Subject> _subjects = [];
  List<DailyGoal> _dailyGoals = [];
  List<ChatMessage> _chatMessages = [];
  bool _isLoading = false;
  
  List<Subject> get subjects => _subjects;
  List<DailyGoal> get dailyGoals => _dailyGoals;
  List<ChatMessage> get chatMessages => _chatMessages;
  bool get isLoading => _isLoading;
  
  DailyGoal? get todayGoal {
    final today = DateTime.now();
    return _dailyGoals.where((goal) => 
      goal.date.year == today.year &&
      goal.date.month == today.month &&
      goal.date.day == today.day
    ).isNotEmpty ? _dailyGoals.where((goal) => 
      goal.date.year == today.year &&
      goal.date.month == today.month &&
      goal.date.day == today.day
    ).first : null;
  }
  
  Future<void> initializeData() async {
    _isLoading = true;
    notifyListeners();
    
    await loadSubjects();
    await loadDailyGoals();
    await loadChatMessages();
    
    _isLoading = false;
    notifyListeners();
  }
  
  Future<void> loadSubjects() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final subjectsData = prefs.getStringList('subjects');
      
      if (subjectsData != null) {
        _subjects = subjectsData.map((data) => Subject.fromJson(jsonDecode(data))).toList();
      } else {
        // Initialize with default subjects
        _subjects = [
          Subject(
            id: '1',
            name: 'Data Science',
            description: 'Learn data analysis, visualization, and machine learning',
            icon: Icons.analytics,
            color: const Color(0xFF2E86AB),
            totalLessons: 20,
            completedLessons: 6,
            topics: ['Python Basics', 'Pandas', 'Matplotlib', 'Machine Learning'],
            difficulty: 'Intermediate',
          ),
          Subject(
            id: '2',
            name: 'Rituals & Habits',
            description: 'Build productive habits and daily rituals',
            icon: Icons.refresh,
            color: const Color(0xFF4ECDC4),
            totalLessons: 15,
            completedLessons: 11,
            topics: ['Morning Routines', 'Meditation', 'Exercise', 'Mindfulness'],
            difficulty: 'Beginner',
          ),
          Subject(
            id: '3',
            name: 'Programming',
            description: 'Master coding skills and software development',
            icon: Icons.code,
            color: const Color(0xFFF38BA8),
            totalLessons: 25,
            completedLessons: 8,
            topics: ['Algorithms', 'Data Structures', 'Web Development', 'Mobile Apps'],
            difficulty: 'Advanced',
          ),
          Subject(
            id: '4',
            name: 'Creative Writing',
            description: 'Improve your writing skills and creativity',
            icon: Icons.edit,
            color: const Color(0xFFFFD23F),
            totalLessons: 12,
            completedLessons: 3,
            topics: ['Storytelling', 'Character Development', 'Plot Structure', 'Poetry'],
            difficulty: 'Beginner',
          ),
        ];
        await saveSubjects();
      }
    } catch (e) {
      print('Error loading subjects: $e');
    }
  }
  
  Future<void> saveSubjects() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final subjectsData = _subjects.map((subject) => jsonEncode(subject.toJson())).toList();
      await prefs.setStringList('subjects', subjectsData);
    } catch (e) {
      print('Error saving subjects: $e');
    }
  }
  
  Future<void> loadDailyGoals() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final goalsData = prefs.getStringList('daily_goals');
      
      if (goalsData != null) {
        _dailyGoals = goalsData.map((data) => DailyGoal.fromJson(jsonDecode(data))).toList();
      } else {
        // Create today's goal if none exists
        final today = DateTime.now();
        _dailyGoals = [
          DailyGoal(
            id: today.millisecondsSinceEpoch.toString(),
            title: 'Daily Learning Goal',
            description: 'Complete your learning session',
            targetValue: 30,
            currentValue: 22,
            unit: 'minutes',
            date: today,
          ),
        ];
        await saveDailyGoals();
      }
    } catch (e) {
      print('Error loading daily goals: $e');
    }
  }
  
  Future<void> saveDailyGoals() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final goalsData = _dailyGoals.map((goal) => jsonEncode(goal.toJson())).toList();
      await prefs.setStringList('daily_goals', goalsData);
    } catch (e) {
      print('Error saving daily goals: $e');
    }
  }
  
  Future<void> loadChatMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesData = prefs.getStringList('chat_messages');
      
      if (messagesData != null) {
        _chatMessages = messagesData.map((data) => ChatMessage.fromJson(jsonDecode(data))).toList();
      } else {
        // Initialize with welcome message
        _chatMessages = [
          ChatMessage(
            text: 'Hello! I\'m your AI learning companion. How can I help you learn something new today?',
            isUser: false,
          ),
        ];
        await saveChatMessages();
      }
    } catch (e) {
      print('Error loading chat messages: $e');
    }
  }
  
  Future<void> saveChatMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesData = _chatMessages.map((message) => jsonEncode(message.toJson())).toList();
      await prefs.setStringList('chat_messages', messagesData);
    } catch (e) {
      print('Error saving chat messages: $e');
    }
  }
  
  Future<void> sendMessage(String text, {String? context}) async {
    // Add user message
    final userMessage = ChatMessage(text: text, isUser: true, context: context);
    _chatMessages.add(userMessage);
    notifyListeners();
    
    try {
      // Get AI response
      final response = await GeminiService.generateResponse(text, context: context);
      
      // Add AI response
      final aiMessage = ChatMessage(text: response, isUser: false);
      _chatMessages.add(aiMessage);
      
      await saveChatMessages();
      notifyListeners();
    } catch (e) {
      // Add error message
      final errorMessage = ChatMessage(
        text: 'I apologize, but I\'m having trouble responding right now. Please try again.',
        isUser: false,
      );
      _chatMessages.add(errorMessage);
      notifyListeners();
    }
  }
  
  Future<void> updateGoalProgress(String goalId, int progress) async {
    final goalIndex = _dailyGoals.indexWhere((goal) => goal.id == goalId);
    if (goalIndex != -1) {
      _dailyGoals[goalIndex] = DailyGoal(
        id: _dailyGoals[goalIndex].id,
        title: _dailyGoals[goalIndex].title,
        description: _dailyGoals[goalIndex].description,
        targetValue: _dailyGoals[goalIndex].targetValue,
        currentValue: progress,
        unit: _dailyGoals[goalIndex].unit,
        date: _dailyGoals[goalIndex].date,
        isCompleted: progress >= _dailyGoals[goalIndex].targetValue,
      );
      
      await saveDailyGoals();
      notifyListeners();
    }
  }
  
  void clearChat() {
    _chatMessages.clear();
    _chatMessages.add(
      ChatMessage(
        text: 'Hello! I\'m your AI learning companion. How can I help you learn something new today?',
        isUser: false,
      ),
    );
    saveChatMessages();
    notifyListeners();
  }
}