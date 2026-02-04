import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color prasmulBlue = Color(0xFF0D326E);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Bagian Header Profil
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              color: prasmulBlue.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: prasmulBlue,
                  child: Icon(Icons.person, size: 70, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Student Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: prasmulBlue),
                ),
                Text(
                  'student@prasetiyamulya.ac.id',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // Bagian Detail Info
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildInfoTile(Icons.badge, 'Student ID', '2021012345'),
                _buildInfoTile(Icons.school, 'Major', 'Computer Science'),
                _buildInfoTile(Icons.calendar_today, 'Semester', '6'),
                _buildInfoTile(Icons.location_on, 'Campus', 'BSD City'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi pembantu untuk baris informasi
  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF0D326E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF0D326E)),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}