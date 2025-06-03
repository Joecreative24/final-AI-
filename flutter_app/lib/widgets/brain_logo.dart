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
          // Brain shape with gradient
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
          
          // Graduation cap (if enabled)
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
                    // Cap base
                    Container(
                      margin: EdgeInsets.only(top: size * 0.08),
                      height: size * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(size * 0.05),
                      ),
                    ),
                    // Tassel
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
          
          // Connection nodes
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
    
    // Draw brain structure lines
    final path = Path();
    
    // Left hemisphere curves
    path.moveTo(size.width * 0.2, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.5,
      size.width * 0.25, size.height * 0.7
    );
    
    // Right hemisphere curves
    path.moveTo(size.width * 0.8, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.5,
      size.width * 0.75, size.height * 0.7
    );
    
    // Center division
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.8);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}