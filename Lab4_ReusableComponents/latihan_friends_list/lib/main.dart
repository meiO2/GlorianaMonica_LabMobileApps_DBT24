import 'package:flutter/material.dart';
import 'screens/contact_screen.dart'; // Import the file where your UI lives

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Prototype',
      // Theme matching the purple header in your image
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC7B8F5)),
      ),
      // This is where you tell the app which page to show first
      home: const ContactScreen(), 
    );
  }
}