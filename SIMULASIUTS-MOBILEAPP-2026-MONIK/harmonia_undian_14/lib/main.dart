import 'package:flutter/material.dart';
import 'screens/workout_screen.dart';
import 'models/workout_type.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker',
      theme: ThemeData(
        fontFamily: 'Sans-Serif',
      ),
      home: const WorkoutScreen(workoutType: WorkoutType.yoga), // Change this to test screens
    );
  }
}