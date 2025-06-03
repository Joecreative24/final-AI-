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