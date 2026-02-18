import 'package:flutter/material.dart';
import '../widgets/metric_tile.dart';

// Strongly-typed class for stability
class YogaPose {
  final String level;
  final String name;
  final String duration;

  YogaPose({
    required this.level,
    required this.name,
    required this.duration,
  });
}

class YogaWorkout extends StatefulWidget {
  const YogaWorkout({super.key});

  @override
  State<YogaWorkout> createState() => _YogaWorkoutState();
}

class _YogaWorkoutState extends State<YogaWorkout> {
  String selectedYogaDuration = "45 seconds";
  int? selectedPoseIndex;

  final List<YogaPose> poses = [
    YogaPose(level: "Intermediate", name: "Warrior Pose", duration: "30 seconds"),
    YogaPose(level: "Beginner", name: "Tree Pose", duration: "45 seconds"),
    YogaPose(level: "Beginner", name: "Child's Pose", duration: "45 seconds"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Reduced from 24 to help centering
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Ensures everything is centered horizontally
        children: [
          const SizedBox(height: 80),

          /// 1. HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (selectedPoseIndex != null) {
                    setState(() => selectedPoseIndex = null);
                  } else if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.arrow_back, size: 18),
              ),
              const SizedBox(width: 12),
              const Text(
                "Yoga",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.self_improvement, size: 18),
            ],
          ),

          const SizedBox(height: 30),

          /// 2. POSE SECTION
          selectedPoseIndex == null
              ? SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: poses.length,
                    itemBuilder: (context, index) => _buildYogaPoseCard(
                      poses[index].level,
                      poses[index].name,
                      poses[index].duration,
                      index,
                    ),
                  ),
                )
              : _buildSelectedPoseCard(selectedPoseIndex!),

          const Spacer(flex: 3),

          /// 3. TIMER SELECTION
          const Text(
            "Choose Your Yoga Timer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDurationPill("30 seconds"),
              const SizedBox(width: 8),
              _buildDurationPill("45 seconds"),
              const SizedBox(width: 8),
              _buildDurationPill("1 minute"),
            ],
          ),

          const SizedBox(height: 15),

          /// 4. ACTION BUTTONS (Slimmed Down)
          _buildActionButton("Reset", false),
          const SizedBox(height: 6), 
          _buildActionButton("Skip", false),
          const SizedBox(height: 6), 
          _buildActionButton("Start Timer", true),

          const Spacer(flex: 2),

          /// 5. METRICS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MetricTile(label: "Total Sessions", value: "--"),
              MetricTile(label: "Cals Burned", value: "18 Kcal"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MetricTile(label: "Recovery Time", value: "--"),
              MetricTile(label: "Average Time", value: "00:14:05"),
            ],
          ),

          // Spacer removed here to keep Heart Rate close to metrics
          const SizedBox(height: 30),

          /// 6. HEART RATE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.favorite, color: Colors.black, size: 24), // Sized down icon
              SizedBox(width: 8),
              Text(
                "Heart Rate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text("--", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 60), // Reduced bottom gap to fit on one screen
        ],
      ),
    );
  }

  Widget _buildYogaPoseCard(
      String level, String pose, String duration, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedPoseIndex = index),
      child: Container(
        width: 140, // Slightly reduced to fit better
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFB4C5D6),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                level,
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pose,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(duration,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedPoseCard(int index) {
    final pose = poses[index];
    return GestureDetector(
      onTap: () => setState(() => selectedPoseIndex = null),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFB4C5D6),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'img/image.png', // Using your local asset
                height: 140,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                top: 12,
                left: 12,
                child: Text(pose.level,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54))),
            Positioned(
                bottom: 12,
                left: 12,
                child: Text(pose.name,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87))),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationPill(String text) {
    bool isSelected = selectedYogaDuration == text;
    return GestureDetector(
      onTap: () => setState(() => selectedYogaDuration = text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7D8FA4) : const Color(0xFFE2E9F0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, bool isPrimary) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFFA1B39F) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isPrimary ? null : Border.all(color: Colors.black54, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color: isPrimary ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
    );
  }
}