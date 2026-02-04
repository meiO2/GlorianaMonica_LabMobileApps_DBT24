import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'my_courses_page.dart'; // Pastikan file ini sudah dibuat

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int _selectedIndex = 0;

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color prasmulBlue = Color(0xFF0D326E);

    final List<Widget> _pages = [
      // --- INDEX 0: HOME PAGE (Course Cards dari Sketsa) ---
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Courses',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: prasmulBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Course ${index + 1}',
                              style: const TextStyle(color: prasmulBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Introduction to Flutter Development',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const Text('School of Computer Science', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // --- INDEX 1: BOOKS PAGE (My Courses) ---
      const MyCoursesPage(),

      // --- INDEX 2: PROFILE PAGE ---
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Universitas Prasetiya Mulya'),
        backgroundColor: prasmulBlue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, 
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: prasmulBlue),
              accountName: const Text("Student Name"),
              accountEmail: const Text("student@prasetiyamulya.ac.id"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: prasmulBlue),
              ),
            ),
            _buildDrawerItem(Icons.school, 'PROGRAMS'),
            _buildDrawerItem(Icons.assignment, 'ADMISSION'),
            _buildDrawerItem(Icons.people, 'PEOPLE'),
            _buildDrawerItem(Icons.biotech, 'LABORATORY'),
            _buildDrawerItem(Icons.museum, 'CAMPUS LIFE'),
            const Divider(),
            _buildDrawerItem(Icons.settings, 'OFFICE & SERVICES'),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pop(context); 
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: prasmulBlue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}