import 'package:flutter/material.dart';
import 'background_screen.dart';
import '../models/workout_type.dart';
import 'treadmill_workout.dart';
import 'swimming_workout.dart';
import 'yoga_workout.dart';

class WorkoutScreen extends StatefulWidget {
  final WorkoutType workoutType;

  const WorkoutScreen({super.key, required this.workoutType});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Maps your enum to the correct starting page index (0 = Treadmill, 1 = Swim, 2 = Yoga)
    int initialIndex = widget.workoutType.index;
    _pageController = PageController(initialPage: initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      // PageView handles the left/right sliding gestures automatically
      child: PageView(
        controller: _pageController,
        // Using BouncingScrollPhysics gives it that smooth iOS-style rubber band effect
        physics: const BouncingScrollPhysics(),
        children: const [
          // Wrapping each in Padding ensures the text doesn't touch the screen edges
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: TreadmillWorkout(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SwimmingWorkout(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: YogaWorkout(),
          ),
        ],
      ),
    );
  }
}