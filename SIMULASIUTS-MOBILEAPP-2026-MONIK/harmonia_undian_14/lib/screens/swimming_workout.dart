import 'package:flutter/material.dart';
import '../widgets/metric_tile.dart';

class SwimmingWorkout extends StatelessWidget {
  const SwimmingWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Row(
          children: [
            Icon(Icons.arrow_back, size: 18),
            SizedBox(width: 12),
            Text("Swimming", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Icon(Icons.pool, size: 18),
          ],
        ),
        const SizedBox(height: 30),
        
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
              colors: [Color(0xFFB4C5D6), Color(0xFFE2E9F0)]
            ),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 8))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("00:00:00", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSmallButton(Icons.flag),
                  const SizedBox(width: 20),
                  _buildGoButton(),
                  const SizedBox(width: 20),
                  _buildSmallButton(Icons.pause),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        
        // Metrics
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MetricTile(label: "Distance", value: "--"),
            MetricTile(label: "Cals Burned", value: "18 Kcal"),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MetricTile(label: "Average Speed", value: "--"),
            MetricTile(label: "Time", value: "00:14:05"),
          ],
        ),

        // Stuck to metrics
        const SizedBox(height: 30),
        
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.black, size: 24),
            SizedBox(width: 8), 
            Text("Heart Rate", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 2), 
        const Text("--", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildGoButton() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFC7D2E1).withOpacity(0.8), 
        shape: BoxShape.circle, 
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Text("GO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    );
  }

  Widget _buildSmallButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Color(0xFF5B6B7E), shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}