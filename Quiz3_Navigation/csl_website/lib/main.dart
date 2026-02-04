import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Fungsi untuk memunculkan notifikasi (Alert Dialog)
  void _showNotification(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Informasi", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("$title clicked"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // Logo Putih di Kiri
        title: Image.asset('assets/images/logo_putih.png', height: 40),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: const Color.fromARGB(255, 43, 43, 43), 
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20), // Spasi atas (Teks MENU dihapus)
                          _buildMenuItem(context, 'PROGRAMS'),
                          _buildMenuItem(context, 'ADMISSION'),
                          _buildMenuItem(context, 'PEOPLE'),
                          _buildMenuItem(context, 'LABORATORY'),
                          _buildMenuItem(context, 'CAMPUS LIFE'),
                          _buildMenuItem(context, 'OFFICE & SERVICES'),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Image.asset('assets/images/logo_biru.png', height: 120),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('VISION', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(height: 10),
                  Text(
                    'A globally recognized School for STEMpreneur Education and Research',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  Text('MISSION', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(height: 10),
                  Text(
                    'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '1. Collaborative learning by enterprising involving interdisciplinary catalytic projects',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2. Innovative and impactful research to the society',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), 
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 43, 43, 43),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo_biru.png', height: 50,),
            SizedBox(height: 15,),
            Text('BSD City Kavling Edutown l.1', style: TextStyle(color: Colors.white, fontSize: 15)),
            Text('Jl. BSD Raya Utama, BSD City 15339', style: TextStyle(color: Colors.white, fontSize: 15)),
            Text('Kabupaten Tangerang, Indonesia', style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 15),
            Text('Tel. (021) 304-50-500', style: TextStyle(color: Colors.white, fontSize: 15)),
            Text('Hp. (+62) 81511662005', style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 15,),
            Text('info@prasetiyamulya.ac.id', style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk item menu
  Widget _buildMenuItem(BuildContext context, String text) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      onTap: () {
        Navigator.pop(context); // Tutup drawer
        _showNotification(context, text); // Munculkan notifikasi
      },
    );
  }
}