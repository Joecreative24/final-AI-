# 🚀 COMPLETE COREMIND AI FLUTTER PROJECT - PART 2

## 📄 DART FILES CONTINUED

### 📄 `lib/models/user_model.dart`
```dart
class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final int totalLearningHours;
  final int completedLessons;
  final Map<String, int> subjectProgress;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar = '',
    required this.joinDate,
    this.totalLearningHours = 0,
    this.completedLessons = 0,
    this.subjectProgress = const {},
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? 'User',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      joinDate: DateTime.parse(json['joinDate'] ?? DateTime.now().toIso8601String()),
      totalLearningHours: json['totalLearningHours'] ?? 0,
      completedLessons: json['completedLessons'] ?? 0,
      subjectProgress: Map<String, int>.from(json['subjectProgress'] ?? {}),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'joinDate': joinDate.toIso8601String(),
      'totalLearningHours': totalLearningHours,
      'completedLessons': completedLessons,
      'subjectProgress': subjectProgress,
    };
  }
}
```

### 📄 `lib/models/subject_model.dart`
```dart
import 'package:flutter/material.dart';

class Subject {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final int totalLessons;
  final int completedLessons;
  final List<String> topics;
  final String difficulty;
  
  Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.totalLessons = 0,
    this.completedLessons = 0,
    this.topics = const [],
    this.difficulty = 'Beginner',
  });
  
  double get progress => totalLessons > 0 ? completedLessons / totalLessons : 0.0;
  
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: IconData(json['iconCode'] ?? Icons.book.codePoint, fontFamily: 'MaterialIcons'),
      color: Color(json['colorValue'] ?? Colors.blue.value),
      totalLessons: json['totalLessons'] ?? 0,
      completedLessons: json['completedLessons'] ?? 0,
      topics: List<String>.from(json['topics'] ?? []),
      difficulty: json['difficulty'] ?? 'Beginner',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconCode': icon.codePoint,
      'colorValue': color.value,
      'totalLessons': totalLessons,
      'completedLessons': completedLessons,
      'topics': topics,
      'difficulty': difficulty,
    };
  }
}
```

### 📄 `lib/models/chat_message.dart`
```dart
import 'package:uuid/uuid.dart';

class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? context;
  
  ChatMessage({
    String? id,
    required this.text,
    required this.isUser,
    DateTime? timestamp,
    this.context,
  }) : id = id ?? const Uuid().v4(),
       timestamp = timestamp ?? DateTime.now();
  
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      text: json['text'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
      context: json['context'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'context': context,
    };
  }
}
```

### 📄 `lib/models/daily_goal.dart`
```dart
class DailyGoal {
  final String id;
  final String title;
  final String description;
  final int targetValue;
  final int currentValue;
  final String unit;
  final DateTime date;
  final bool isCompleted;
  
  DailyGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.targetValue,
    this.currentValue = 0,
    this.unit = 'minutes',
    required this.date,
    this.isCompleted = false,
  });
  
  double get progress => targetValue > 0 ? (currentValue / targetValue).clamp(0.0, 1.0) : 0.0;
  
  factory DailyGoal.fromJson(Map<String, dynamic> json) {
    return DailyGoal(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      targetValue: json['targetValue'] ?? 0,
      currentValue: json['currentValue'] ?? 0,
      unit: json['unit'] ?? 'minutes',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      isCompleted: json['isCompleted'] ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'unit': unit,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}
```

### 📄 `lib/providers/user_provider.dart`
```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  
  User? get user => _user;
  bool get isLoading => _isLoading;
  
  Future<void> loadUser() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('user_data');
      
      if (userData != null) {
        _user = User.fromJson(jsonDecode(userData));
      } else {
        // Create default user if none exists
        _user = User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'Learning Enthusiast',
          email: 'user@coremind.ai',
          joinDate: DateTime.now(),
          totalLearningHours: 0,
          completedLessons: 0,
          subjectProgress: {},
        );
        await saveUser();
      }
    } catch (e) {
      print('Error loading user: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> saveUser() async {
    if (_user == null) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_data', jsonEncode(_user!.toJson()));
    } catch (e) {
      print('Error saving user: $e');
    }
  }
  
  Future<void> updateUser(User updatedUser) async {
    _user = updatedUser;
    await saveUser();
    notifyListeners();
  }
  
  Future<void> updateProgress(String subject, int progress) async {
    if (_user == null) return;
    
    final updatedProgress = Map<String, int>.from(_user!.subjectProgress);
    updatedProgress[subject] = progress;
    
    _user = User(
      id: _user!.id,
      name: _user!.name,
      email: _user!.email,
      avatar: _user!.avatar,
      joinDate: _user!.joinDate,
      totalLearningHours: _user!.totalLearningHours,
      completedLessons: _user!.completedLessons + 1,
      subjectProgress: updatedProgress,
    );
    
    await saveUser();
    notifyListeners();
  }
  
  Future<void> addLearningTime(int minutes) async {
    if (_user == null) return;
    
    _user = User(
      id: _user!.id,
      name: _user!.name,
      email: _user!.email,
      avatar: _user!.avatar,
      joinDate: _user!.joinDate,
      totalLearningHours: _user!.totalLearningHours + (minutes / 60).round(),
      completedLessons: _user!.completedLessons,
      subjectProgress: _user!.subjectProgress,
    );
    
    await saveUser();
    notifyListeners();
  }
}
```

### 📄 `lib/providers/learning_provider.dart`
```dart
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
```

**Continue Reading Part 3 Below ⬇️**

---

## 🎯 THIS IS PART 2 OF 3

**Continue to Part 3 for the remaining screen files and setup instructions →**