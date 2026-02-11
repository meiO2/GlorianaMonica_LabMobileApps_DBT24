import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // Deep black background
        primaryColor: const Color(0xFF3797EF), // Blue button color
      ),
      home: const LoginScreen(),
    );
  }
}