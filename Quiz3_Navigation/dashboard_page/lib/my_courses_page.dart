import 'package:flutter/material.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color prasmulBlue = Color(0xFF0D326E);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Courses',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'You have 3 active courses this semester',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildMyCourseCard(context, 'Mobile Application Development', '80%', 0.8),
                _buildMyCourseCard(context, 'Data Structures & Algorithms', '45%', 0.45),
                _buildMyCourseCard(context, 'Software Engineering', '60%', 0.6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyCourseCard(BuildContext context, String title, String percent, double progressValue) {
    const Color prasmulBlue = Color(0xFF0D326E);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(percent, style: const TextStyle(color: prasmulBlue, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: prasmulBlue.withOpacity(0.1),
                valueColor: const AlwaysStoppedAnimation<Color>(prasmulBlue),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 12),
            const Text('Next Lecture: Monday, 08:00 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}