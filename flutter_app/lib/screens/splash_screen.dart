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
    // Initialize providers
    await Provider.of<UserProvider>(context, listen: false).loadUser();
    await Provider.of<LearningProvider>(context, listen: false).initializeData();
    
    // Wait for animations
    await Future.delayed(const Duration(seconds: 3));
    
    // Navigate to home
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