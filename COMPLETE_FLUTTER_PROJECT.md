# 🚀 COMPLETE COREMIND AI FLUTTER PROJECT

## 📁 DIRECTORY STRUCTURE
Create this exact folder structure in Android Studio:

```
coremind_ai/
├── .metadata
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
├── android/
│   ├── build.gradle
│   ├── gradle.properties
│   ├── settings.gradle
│   ├── gradle/wrapper/
│   │   └── gradle-wrapper.properties
│   └── app/
│       ├── build.gradle
│       └── src/main/
│           ├── AndroidManifest.xml
│           └── kotlin/com/coremind/ai/
│               └── MainActivity.kt
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── subject_model.dart
│   │   ├── chat_message.dart
│   │   └── daily_goal.dart
│   ├── providers/
│   │   ├── user_provider.dart
│   │   └── learning_provider.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── home_screen.dart
│   │   ├── ai_tutor_screen.dart
│   │   ├── subjects_screen.dart
│   │   └── profile_screen.dart
│   ├── widgets/
│   │   ├── brain_logo.dart
│   │   ├── subject_card.dart
│   │   └── bottom_nav_bar.dart
│   ├── services/
│   │   └── gemini_service.dart
│   └── utils/
│       └── app_colors.dart
└── web/
    ├── index.html
    └── manifest.json
```

---

## 📄 FILE CONTENTS

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
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600
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
  
  static Future<List<String>> generateLearningPlan(String subject, String level) async {
    final prompt = '''
    Create a structured learning plan for $subject at $level level. 
    Provide 5-7 key topics that should be covered, formatted as a simple list.
    Focus on practical, actionable learning objectives.
    ''';
    
    try {
      final response = await generateResponse(prompt);
      // Parse the response to extract topics
      final topics = response
          .split('\n')
          .where((line) => line.trim().isNotEmpty && (line.contains('•') || line.contains('-') || line.contains('.')))
          .map((line) => line.replaceAll(RegExp(r'^[•\-\d\.]\s*'), '').trim())
          .where((topic) => topic.isNotEmpty)
          .take(7)
          .toList();
      
      return topics.isNotEmpty ? topics : ['Introduction to $subject', 'Basic concepts', 'Practical applications'];
    } catch (e) {
      return ['Introduction to $subject', 'Basic concepts', 'Practical applications'];
    }
  }
}
```

**Continue Reading Part 2 Below ⬇️**

---

## 🚀 QUICK SETUP INSTRUCTIONS FOR ANDROID STUDIO

### Step 1: Create New Flutter Project
1. Open Android Studio
2. File → New → New Flutter Project
3. Choose "Flutter Application"
4. Name: `coremind_ai`
5. Create project

### Step 2: Replace All Files
1. Delete contents of the created project
2. Copy ALL the file contents above into their respective paths
3. Make sure the folder structure matches exactly

### Step 3: Install Dependencies
```bash
flutter pub get
```

### Step 4: Run the App
1. Start Android emulator
2. Click Run button
3. Enjoy your CoreMind AI app! 🎉

---

**This is Part 1 of 2. Continue to Part 2 for the remaining Dart files →**