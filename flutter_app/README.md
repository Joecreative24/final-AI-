# CoreMind AI - Your Personal AI Learning Companion

A beautiful Flutter app that provides personalized AI-powered learning experiences using Google's Gemini AI.

## Features

🧠 **AI-Powered Learning**: Chat with an intelligent tutor powered by Gemini AI
📚 **Subject Management**: Organize your learning across multiple subjects
🎯 **Daily Goals**: Track your learning progress with daily targets
📊 **Progress Analytics**: Visual progress tracking for all subjects
🎨 **Beautiful UI**: Modern, responsive design with smooth animations
🔄 **Offline Storage**: Local data persistence using SharedPreferences

## Screenshots

The app includes:
- **Splash Screen**: Animated CoreMind AI logo and branding
- **Home Dashboard**: Welcome message, continue learning, subjects grid, daily goals
- **AI Tutor Chat**: Real-time conversations with Gemini AI
- **Subjects Library**: Detailed subject cards with progress tracking
- **Profile Screen**: User stats, achievements, and settings

## Tech Stack

- **Frontend**: Flutter 3.2+ with Material Design
- **AI Integration**: Google Gemini AI API
- **State Management**: Provider pattern
- **Local Storage**: SharedPreferences
- **Animations**: flutter_animate package
- **UI Components**: Custom widgets with modern design

## Getting Started

### Prerequisites

1. **Flutter SDK**: Install Flutter 3.2.0 or higher
   - Download from: https://flutter.dev/docs/get-started/install
   
2. **Android Studio**: Latest version with Flutter plugin
   - Download from: https://developer.android.com/studio
   
3. **Gemini API Key**: Get your free API key
   - Visit: https://makersuite.google.com/app/apikey
   - Create a new API key
   - Copy the key for configuration

### Installation Steps

#### Step 1: Setup Android Studio

1. **Install Android Studio**
   - Download and install the latest version
   - Launch Android Studio

2. **Install Flutter Plugin**
   - Go to `File` → `Settings` (Windows/Linux) or `Android Studio` → `Preferences` (Mac)
   - Navigate to `Plugins`
   - Search for "Flutter" and install it
   - Restart Android Studio

3. **Configure Flutter SDK Path**
   - Go to `File` → `Settings` → `Languages & Frameworks` → `Flutter`
   - Set the Flutter SDK path to your Flutter installation directory

#### Step 2: Import the Project

1. **Open Android Studio**
2. **Select "Open an Existing Project"**
3. **Navigate to the `flutter_app` folder** and select it
4. **Wait for indexing** to complete

#### Step 3: Configure the Project

1. **Open `lib/services/gemini_service.dart`**
2. **Replace the API key** with your Gemini API key:
   ```dart
   static const String _apiKey = 'YOUR_GEMINI_API_KEY_HERE';
   ```

3. **Get Dependencies**
   - Open terminal in Android Studio
   - Run: `flutter pub get`

#### Step 4: Setup Android Emulator

1. **Open AVD Manager**
   - Go to `Tools` → `AVD Manager`
   
2. **Create Virtual Device**
   - Click "Create Virtual Device"
   - Choose a device (e.g., Pixel 4)
   - Select a system image (API 30+)
   - Click "Finish"

3. **Start Emulator**
   - Click the play button next to your AVD

#### Step 5: Run the App

1. **Select your device/emulator** from the device dropdown
2. **Click the green play button** or use `Shift + F10`
3. **Wait for build to complete**

The app will install and launch on your emulator/device!

### Alternative: Command Line Setup

If you prefer command line:

```bash
# Navigate to the project directory
cd flutter_app

# Get dependencies
flutter pub get

# Check for issues
flutter doctor

# Run on connected device/emulator
flutter run
```

## Project Structure

```
flutter_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   │   ├── user_model.dart
│   │   ├── subject_model.dart
│   │   ├── chat_message.dart
│   │   └── daily_goal.dart
│   ├── providers/                # State management
│   │   ├── user_provider.dart
│   │   └── learning_provider.dart
│   ├── screens/                  # App screens
│   │   ├── splash_screen.dart
│   │   ├── home_screen.dart
│   │   ├── ai_tutor_screen.dart
│   │   ├── subjects_screen.dart
│   │   └── profile_screen.dart
│   ├── widgets/                  # Reusable widgets
│   │   ├── brain_logo.dart
│   │   ├── subject_card.dart
│   │   └── bottom_nav_bar.dart
│   ├── services/                 # External services
│   │   └── gemini_service.dart
│   └── utils/                    # Utilities
│       └── app_colors.dart
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## Customization

### Changing the API Key

Update the API key in `lib/services/gemini_service.dart`:

```dart
static const String _apiKey = 'YOUR_NEW_API_KEY';
```

### Adding New Subjects

Modify the default subjects in `lib/providers/learning_provider.dart`:

```dart
_subjects = [
  Subject(
    id: '5',
    name: 'Your New Subject',
    description: 'Description here',
    icon: Icons.your_icon,
    color: const Color(0xFF123456),
    // ... other properties
  ),
];
```

### Customizing Colors

Update brand colors in `lib/utils/app_colors.dart`:

```dart
static const Color primaryBlue = Color(0xFF2E86AB);
static const Color primaryTeal = Color(0xFF4ECDC4);
// ... other colors
```

## Building for Production

### Android APK

```bash
flutter build apk --release
```

### Android App Bundle (recommended for Play Store)

```bash
flutter build appbundle --release
```

The built files will be in:
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AAB: `build/app/outputs/bundle/release/app-release.aab`

## Troubleshooting

### Common Issues

1. **"Flutter SDK not found"**
   - Ensure Flutter is properly installed and added to PATH
   - Restart Android Studio after installation

2. **"Gradle build failed"**
   - Check that Android SDK is properly configured
   - Try `flutter clean` then `flutter pub get`

3. **"API call failed"**
   - Verify your Gemini API key is correct
   - Check internet connection
   - Ensure API quota isn't exceeded

4. **"Emulator not starting"**
   - Enable Virtualization in BIOS
   - Allocate more RAM to AVD
   - Try a different system image

### Getting Help

- **Flutter Docs**: https://flutter.dev/docs
- **Android Studio Guide**: https://developer.android.com/studio/intro
- **Gemini AI Docs**: https://ai.google.dev/docs

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source and available under the MIT License.

---

**Happy Learning with CoreMind AI! 🧠✨**