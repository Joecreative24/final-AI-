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