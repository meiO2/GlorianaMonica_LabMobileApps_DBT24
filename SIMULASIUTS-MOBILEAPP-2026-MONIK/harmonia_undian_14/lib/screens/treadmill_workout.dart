import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; 
import 'package:latlong2/latlong.dart'; 
import '../widgets/metric_tile.dart';

class TreadmillWorkout extends StatelessWidget {
  const TreadmillWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Row(
          children: [
            Icon(Icons.arrow_back, size: 18),
            SizedBox(width: 12),
            Text("Treadmill", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Icon(Icons.directions_run, size: 18),
          ],
        ),
        const SizedBox(height: 30),
        
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05), 
                blurRadius: 15, 
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(-6.2000, 106.8166), 
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    const MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(-6.2000, 106.8166),
                          child: Icon(Icons.location_on, color: Colors.red, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC7D2E1).withOpacity(0.9), 
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Time      00 : 00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSmallButton(Icons.flag),
                      const SizedBox(width: 20),
                      _buildGoButton(),
                      const SizedBox(width: 20),
                      _buildSmallButton(Icons.pause),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        
        // Metrics Group
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MetricTile(label: "Distance", value: "--"),
            MetricTile(label: "Calories", value: "18 Kcal"),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MetricTile(label: "Pace", value: "--"),
            MetricTile(label: "Time", value: "00:14:05"),
          ],
        ),
        
        // Stuck to metrics with a small fixed gap
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