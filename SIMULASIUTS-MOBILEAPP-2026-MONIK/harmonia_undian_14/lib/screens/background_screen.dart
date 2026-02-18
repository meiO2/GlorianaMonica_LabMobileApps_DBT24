import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;

  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // The Top Header (With the "punched-in" middle S-Curve)
          Positioned.fill(
            child: CustomPaint(
              painter: HeaderFinalPainter(),
            ),
          ),
          // The Bottom "Hill" Footer 
          Positioned.fill(
            child: CustomPaint(
              painter: FooterFinalPainter(),
            ),
          ),
          // Your UI content goes here
          SafeArea(child: child),
        ],
      ),
    );
  }
}

class HeaderFinalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 0.3);
    
    // Rich gradient matching the exact cropped image
    Gradient gradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFE2E9F0), // Light silvery-blue on the left
        Color(0xFF7D8FA4), // Darker slate blue on the right
      ],
    );

    Paint paint = Paint()..shader = gradient.createShader(rect);

    Path path = Path();
    path.moveTo(0, 0);
    
    // Starts thin on the top left
    path.lineTo(0, size.height * 0); 
    
    // The "Punched In" S-Curve:
    path.cubicTo(
      size.width * 0.35, size.height * 0.12, // Was 0.22 -> Lifted up
      size.width * 0.60, size.height * 0.02, // Was 0.10 -> Punched higher up
      size.width, size.height * 0.15         // Was 0.26 -> Lifted the right side up
    );
    
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FooterFinalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2);
    
    // Bottom gradient (slightly darker overall)
    Gradient gradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF8092A5), 
        Color(0xFF5B6B7E), 
      ],
    );

    Paint paint = Paint()..shader = gradient.createShader(rect);

    Path path = Path();
    path.moveTo(0, size.height); 
    
    // Starts almost invisible at the bottom left
    path.lineTo(0, size.height * 0.98); 
    
    // Gentle upward "hill" that peaks near the right-middle
    path.quadraticBezierTo(
      size.width * 0.55, size.height * 0.90, // Peaks up to make the blue thicker
      size.width, size.height * 0.94         // Tapers down slightly on the right
    );
    
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}