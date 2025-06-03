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