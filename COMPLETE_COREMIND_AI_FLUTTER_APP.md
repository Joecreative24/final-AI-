# 🧠 COMPLETE COREMIND AI FLUTTER APP - SINGLE FILE

## 🚀 ANDROID STUDIO SETUP INSTRUCTIONS

### Step 1: Create New Flutter Project
1. Open Android Studio
2. File → New → New Flutter Project
3. Choose "Flutter Application"
4. Project name: `coremind_ai`
5. Create project

### Step 2: Replace All Files
Delete all existing files and create this exact structure with the code below:

---

## 📁 COMPLETE PROJECT STRUCTURE & CODE

### 📄 `.metadata`
```yaml
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "d211f42860350d914a5ad8102f9ec32764dc6d06"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: d211f42860350d914a5ad8102f9ec32764dc6d06
      base_revision: d211f42860350d914a5ad8102f9ec32764dc6d06
    - platform: android
      create_revision: d211f42860350d914a5ad8102f9ec32764dc6d06
      base_revision: d211f42860350d914a5ad8102f9ec32764dc6d06

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'
```

### 📄 `analysis_options.yaml`
```yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options
```

### 📄 `pubspec.yaml`
```yaml
name: coremind_ai
description: "Your Personal AI Learning Companion"
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  http: ^1.2.0
  shared_preferences: ^2.2.2
  flutter_svg: ^2.0.9
  google_fonts: ^6.1.0
  provider: ^6.1.1
  intl: ^0.19.0
  flutter_animate: ^4.5.0
  percent_indicator: ^4.2.3
  flutter_chat_ui: ^1.6.12
  uuid: ^4.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
```

### 📄 `android/build.gradle`
```gradle
buildscript {
    ext.kotlin_version = '1.9.10'
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
```

### 📄 `android/gradle.properties`
```properties
org.gradle.jvmargs=-Xmx4G -XX:MaxMetaspaceSize=2G -XX:+HeapDumpOnOutOfMemoryError
android.useAndroidX=true
android.enableJetifier=true
```

### 📄 `android/settings.gradle`
```gradle
pluginManagement {
    def flutterSdkPath = {
        def properties = new Properties()
        file("local.properties").withInputStream { properties.load(it) }
        def flutterSdkPath = properties.getProperty("flutter.sdk")
        assert flutterSdkPath != null, "flutter.sdk not set in local.properties"
        return flutterSdkPath
    }()

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    plugins {
        id "dev.flutter.flutter-gradle-plugin" version "1.0.0" apply false
    }
}

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "8.1.0" apply false
    id "org.jetbrains.kotlin.android" version "1.9.10" apply false
}

include ":app"
```

### 📄 `android/gradle/wrapper/gradle-wrapper.properties`
```properties
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip
```

### 📄 `android/app/build.gradle`
```gradle
plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0'
}

android {
    namespace "com.coremind.ai"
    compileSdk 34
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        applicationId "com.coremind.ai"
        minSdkVersion 23
        targetSdkVersion 34
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source '../..'
}
```

### 📄 `android/app/src/main/AndroidManifest.xml`
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

    <application
        android:label="CoreMind AI"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT" />
            <data android:mimeType="text/plain" />
        </intent>
    </queries>
</manifest>
```

### 📄 `android/app/src/main/kotlin/com/coremind/ai/MainActivity.kt`
```kotlin
package com.coremind.ai

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()
```

### 📄 `lib/main.dart`
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ai_tutor_screen.dart';
import 'screens/subjects_screen.dart';
import 'screens/profile_screen.dart';
import 'providers/user_provider.dart';
import 'providers/learning_provider.dart';
import 'utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const CoreMindApp());
}

class CoreMindApp extends StatelessWidget {
  const CoreMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LearningProvider()),
      ],
      child: MaterialApp(
        title: 'CoreMind AI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColors.primaryBlue,
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          cardTheme: CardTheme(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        home: const SplashScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/ai-tutor': (context) => const AiTutorScreen(),
          '/subjects': (context) => const SubjectsScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
```

### 📄 `lib/utils/app_colors.dart`
```dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors from CoreMind AI branding
  static const Color primaryBlue = Color(0xFF2E86AB);
  static const Color primaryTeal = Color(0xFF4ECDC4);
  static const Color primaryOrange = Color(0xFFF38BA8);
  static const Color accentYellow = Color(0xFFFFD23F);
  
  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color lightGray = Color(0xFFF5F6FA);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textLight = Color(0xFFBDC3C7);
  
  // Status Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient brainGradient = LinearGradient(
    colors: [primaryTeal, primaryOrange],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
```

### 📄 `lib/services/gemini_service.dart`
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyB3eTY9wOgodtU8xbesrKRFwEdYwHtQRCg';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';
  
  static Future<String> generateResponse(String prompt, {String? context}) async {
    try {
      final fullPrompt = context != null 
          ? 'Context: $context\n\nUser: $prompt\n\nAs CoreMind AI, your personal learning companion, please provide a helpful and educational response:'
          : 'As CoreMind AI, your personal learning companion, please help with: $prompt';
      
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [{
            'parts': [{
              'text': fullPrompt
            }]
          }],
          'generationConfig': {
            'temperature': 0.7,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 1024,
          },
          'safetySettings': [
            {
              'category': 'HARM_CATEGORY_HARASSMENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_HATE_SPEECH',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            },
            {
              'category': 'HARM_CATEGORY_DANGEROUS_CONTENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE'
            }
          ]
        }),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'];
        } else {
          return 'I apologize, but I couldn\'t generate a response at the moment. Please try again.';
        }
      } else {
        print('Gemini API Error: ${response.statusCode} - ${response.body}');
        return 'I\'m experiencing some technical difficulties. Please try again later.';
      }
    } catch (e) {
      print('Error calling Gemini API: $e');
      return 'I\'m having trouble connecting right now. Please check your internet connection and try again.';
    }
  }
}
```

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
        _user = User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'Learning Enthusiast',
          email: 'user@coremind.ai',
          joinDate: DateTime.now(),
          totalLearningHours: 42,
          completedLessons: 23,
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
    final userMessage = ChatMessage(text: text, isUser: true, context: context);
    _chatMessages.add(userMessage);
    notifyListeners();
    
    try {
      final response = await GeminiService.generateResponse(text, context: context);
      final aiMessage = ChatMessage(text: response, isUser: false);
      _chatMessages.add(aiMessage);
      
      await saveChatMessages();
      notifyListeners();
    } catch (e) {
      final errorMessage = ChatMessage(
        text: 'I apologize, but I\'m having trouble responding right now. Please try again.',
        isUser: false,
      );
      _chatMessages.add(errorMessage);
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

### 📄 `lib/widgets/brain_logo.dart`
```dart
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BrainLogo extends StatelessWidget {
  final double size;
  final bool showGraduation;
  
  const BrainLogo({
    super.key,
    this.size = 80,
    this.showGraduation = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size * 0.8,
            height: size * 0.7,
            decoration: BoxDecoration(
              gradient: AppColors.brainGradient,
              borderRadius: BorderRadius.circular(size * 0.3),
            ),
            child: CustomPaint(
              painter: BrainPainter(),
            ),
          ),
          
          if (showGraduation)
            Positioned(
              top: size * 0.05,
              child: Container(
                width: size * 0.6,
                height: size * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(size * 0.1),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size * 0.08),
                      height: size * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(size * 0.05),
                      ),
                    ),
                    Positioned(
                      right: -size * 0.05,
                      top: size * 0.02,
                      child: Container(
                        width: size * 0.15,
                        height: size * 0.15,
                        decoration: BoxDecoration(
                          color: AppColors.accentYellow,
                          borderRadius: BorderRadius.circular(size * 0.075),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          Positioned(
            right: size * 0.1,
            top: size * 0.4,
            child: Container(
              width: size * 0.08,
              height: size * 0.08,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(size * 0.04),
              ),
            ),
          ),
          Positioned(
            right: size * 0.02,
            bottom: size * 0.3,
            child: Container(
              width: size * 0.06,
              height: size * 0.06,
              decoration: BoxDecoration(
                color: AppColors.primaryTeal,
                borderRadius: BorderRadius.circular(size * 0.03),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final path = Path();
    
    path.moveTo(size.width * 0.2, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.5,
      size.width * 0.25, size.height * 0.7
    );
    
    path.moveTo(size.width * 0.8, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.5,
      size.width * 0.75, size.height * 0.7
    );
    
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.8);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
```

### 📄 `lib/widgets/subject_card.dart`
```dart
import 'package:flutter/material.dart';
import '../models/subject_model.dart';
import '../utils/app_colors.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback? onTap;
  
  const SubjectCard({
    super.key,
    required this.subject,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: subject.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: subject.color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: subject.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                subject.icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subject.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${subject.completedLessons}/${subject.totalLessons}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: subject.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    subject.difficulty,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: subject.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📄 `lib/widgets/bottom_nav_bar.dart`
```dart
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                index: 0,
                isSelected: currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.school_rounded,
                label: 'Subjects',
                index: 1,
                isSelected: currentIndex == 1,
              ),
              _buildNavItem(
                icon: Icons.chat_bubble_rounded,
                label: 'AI Tutor',
                index: 2,
                isSelected: currentIndex == 2,
              ),
              _buildNavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                index: 3,
                isSelected: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 📄 `lib/screens/splash_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../providers/user_provider.dart';
import '../providers/learning_provider.dart';
import '../widgets/brain_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Provider.of<UserProvider>(context, listen: false).loadUser();
    await Provider.of<LearningProvider>(context, listen: false).initializeData();
    
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BrainLogo(size: 120)
                  .animate()
                  .scale(delay: 300.ms, duration: 800.ms, curve: Curves.elasticOut)
                  .fadeIn(duration: 600.ms),
              
              const SizedBox(height: 32),
              
              Text(
                'CoreMind AI',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                ),
              ).animate()
               .fadeIn(delay: 800.ms, duration: 600.ms)
               .slideY(begin: 0.3, delay: 800.ms, duration: 600.ms),
              
              const SizedBox(height: 16),
              
              Text(
                'Your Personal AI\nLearning Companion',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ).animate()
               .fadeIn(delay: 1200.ms, duration: 600.ms)
               .slideY(begin: 0.3, delay: 1200.ms, duration: 600.ms),
              
              const SizedBox(height: 64),
              
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.7)),
                  strokeWidth: 3,
                ),
              ).animate()
               .fadeIn(delay: 1800.ms, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 📄 `lib/screens/home_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/user_provider.dart';
import '../providers/learning_provider.dart';
import '../widgets/brain_logo.dart';
import '../widgets/subject_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildContinueLearning(),
              const SizedBox(height: 24),
              _buildSubjects(),
              const SizedBox(height: 24),
              _buildDailyGoal(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToPage(index);
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.user;
        return Row(
          children: [
            const BrainLogo(size: 50, showGraduation: false),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    user?.name.split(' ').first ?? 'Learner',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        );
      },
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1);
  }

  Widget _buildContinueLearning() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Continue Learning',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'JavaScript Basics',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.accentYellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '30%',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.1);
  }

  Widget _buildSubjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subjects',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Consumer<LearningProvider>(
          builder: (context, learningProvider, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: learningProvider.subjects.length,
              itemBuilder: (context, index) {
                final subject = learningProvider.subjects[index];
                return SubjectCard(
                  subject: subject,
                  onTap: () => Navigator.pushNamed(context, '/subjects'),
                ).animate(delay: Duration(milliseconds: 400 + (index * 100)))
                 .fadeIn(duration: 600.ms)
                 .scale(begin: const Offset(0.8, 0.8));
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildDailyGoal() {
    return Consumer<LearningProvider>(
      builder: (context, learningProvider, child) {
        final goal = learningProvider.todayGoal;
        if (goal == null) return const SizedBox.shrink();
        
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Goal',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    percent: goal.progress,
                    center: Text(
                      '${(goal.progress * 100).round()}%',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    progressColor: AppColors.primaryBlue,
                    backgroundColor: AppColors.lightGray,
                    lineWidth: 8,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          goal.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${goal.currentValue}/${goal.targetValue} ${goal.unit}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).animate(delay: 600.ms).fadeIn(duration: 600.ms).slideY(begin: 0.1);
      },
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushNamed(context, '/subjects');
        break;
      case 2:
        Navigator.pushNamed(context, '/ai-tutor');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
```

### 📄 `lib/screens/ai_tutor_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/learning_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/brain_logo.dart';

class AiTutorScreen extends StatefulWidget {
  const AiTutorScreen({super.key});

  @override
  State<AiTutorScreen> createState() => _AiTutorScreenState();
}

class _AiTutorScreenState extends State<AiTutorScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 2;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    Provider.of<LearningProvider>(context, listen: false).sendMessage(message);
    _messageController.clear();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const BrainLogo(size: 32, showGraduation: false),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Tutor',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Your learning companion',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<LearningProvider>(context, listen: false).clearChat();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<LearningProvider>(
              builder: (context, learningProvider, child) {
                final messages = learningProvider.chatMessages;
                
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return _buildMessageBubble(message.text, message.isUser)
                        .animate(delay: Duration(milliseconds: index * 100))
                        .fadeIn(duration: 400.ms)
                        .slideX(begin: message.isUser ? 0.3 : -0.3);
                  },
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToPage(index);
        },
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isUser) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: AppColors.brainGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.psychology_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isUser ? AppColors.primaryBlue : AppColors.lightGray,
                borderRadius: BorderRadius.circular(16).copyWith(
                  bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(16),
                  bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(4),
                ),
              ),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isUser ? Colors.white : AppColors.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Ask me anything...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _sendMessage,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/subjects');
        break;
      case 2:
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
}
```

### 📄 `lib/screens/subjects_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/learning_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/subject_card.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: Consumer<LearningProvider>(
        builder: (context, learningProvider, child) {
          if (learningProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final subjects = learningProvider.subjects;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Learning Journey',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.1),
                
                const SizedBox(height: 8),
                
                Text(
                  'Choose a subject to continue your learning adventure',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                
                const SizedBox(height: 24),
                
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return SubjectCard(
                      subject: subject,
                      onTap: () => Navigator.pushNamed(context, '/ai-tutor'),
                    ).animate(delay: Duration(milliseconds: 300 + (index * 100)))
                     .fadeIn(duration: 600.ms)
                     .scale(begin: const Offset(0.8, 0.8));
                  },
                ),
                
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToPage(index);
        },
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/ai-tutor');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
}
```

### 📄 `lib/screens/profile_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/user_provider.dart';
import '../providers/learning_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/brain_logo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: Consumer2<UserProvider, LearningProvider>(
        builder: (context, userProvider, learningProvider, child) {
          final user = userProvider.user;
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildProfileHeader(user),
                const SizedBox(height: 32),
                _buildStatsGrid(user, learningProvider),
                const SizedBox(height: 24),
                _buildAchievements(),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToPage(index);
        },
      ),
    );
  }

  Widget _buildProfileHeader(user) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 50,
          ),
        ).animate().scale(delay: 200.ms, duration: 600.ms, curve: Curves.elasticOut),
        
        const SizedBox(height: 16),
        
        Text(
          user.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
        
        Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
        
        const SizedBox(height: 8),
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BrainLogo(size: 20, showGraduation: false),
              const SizedBox(width: 8),
              Text(
                'Learning since ${_formatDate(user.joinDate)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildStatsGrid(user, learningProvider) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard(
          'Learning Hours',
          '${user.totalLearningHours}h',
          Icons.access_time,
          AppColors.primaryBlue,
          0,
        ),
        _buildStatCard(
          'Completed Lessons',
          '${user.completedLessons}',
          Icons.check_circle,
          AppColors.success,
          1,
        ),
        _buildStatCard(
          'Subjects',
          '${learningProvider.subjects.length}',
          Icons.school,
          AppColors.primaryTeal,
          2,
        ),
        _buildStatCard(
          'Daily Streak',
          '7 days',
          Icons.local_fire_department,
          AppColors.warning,
          3,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: 700 + (index * 100)))
     .fadeIn(duration: 600.ms)
     .scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ).animate(delay: 1100.ms).fadeIn(duration: 600.ms),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            _buildAchievementBadge('🎓', 'First Lesson', true),
            const SizedBox(width: 12),
            _buildAchievementBadge('🔥', 'Week Streak', true),
            const SizedBox(width: 12),
            _buildAchievementBadge('📚', 'Subject Master', false),
            const SizedBox(width: 12),
            _buildAchievementBadge('🏆', 'Champion', false),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(String emoji, String title, bool isEarned) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isEarned ? AppColors.accentYellow.withOpacity(0.2) : AppColors.lightGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEarned ? AppColors.accentYellow : AppColors.textLight,
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: TextStyle(
                fontSize: 24,
                color: isEarned ? Colors.black : AppColors.textLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isEarned ? AppColors.textPrimary : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate(delay: Duration(milliseconds: 1200 + (title.length * 50)))
     .fadeIn(duration: 600.ms)
     .scale(begin: const Offset(0.8, 0.8));
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/subjects');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/ai-tutor');
        break;
      case 3:
        break;
    }
  }
}
```

---

## 🚀 FINAL STEPS TO RUN THE APP

### Step 3: Install Dependencies
Open terminal in Android Studio and run:
```bash
flutter pub get
```

### Step 4: Create Android Emulator
1. Tools → AVD Manager
2. Create Virtual Device
3. Choose Pixel 4 or similar
4. Select API 30+ system image
5. Start emulator

### Step 5: Run the App
1. Select your emulator from device dropdown
2. Click green play button or press Shift + F10
3. Wait for build to complete

## ✅ YOUR APP IS READY!

The app includes:
- **Splash screen** with CoreMind AI branding
- **Home dashboard** with welcome message, continue learning (30%), subjects, daily goals (75%)
- **AI tutor chat** with real Gemini AI responses
- **Subjects library** with 4 default subjects
- **Profile screen** with user stats and achievements
- **Full Gemini AI integration** with your API key

**Enjoy your CoreMind AI learning companion! 🧠✨**