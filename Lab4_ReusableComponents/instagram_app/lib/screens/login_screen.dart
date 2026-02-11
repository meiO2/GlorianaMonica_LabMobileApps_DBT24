import 'package:flutter/material.dart';
import 'homepage_screen.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Language Selector at the Top Center
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'English (US)',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.6),
                    size: 18,
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Instagram Logo Placeholder
              Image.network(
                'https://static.xx.fbcdn.net/assets/?set=help_center_about_page_illustrations&name=desktop-instagram-gradient-logo&density=1',
                height: 50,
              ),
              const SizedBox(height: 80),

              // Username Field
              _buildTextField(
                hint: 'Username, email or mobile number',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 12),

              // Password Field
              _buildTextField(
                hint: 'Password',
                icon: Icons.visibility_off_outlined,
                isPassword: true,
              ),
              const SizedBox(height: 20),

              // Log In Button - Now with Navigation logic
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Homepage and remove Login from the backstack
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomepageScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3797EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16, 
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
              
              const Spacer(),

              // Create New Account Button
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: Color(0xFF3797EF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Create new account',
                  style: TextStyle(color: Color(0xFF3797EF), fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 12),

              // Meta Logo
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.all_inclusive, size: 16, color: Colors.white54),
                  SizedBox(width: 4),
                  Text('Meta', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
        suffixIcon: Icon(icon, color: Colors.white38),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white54),
        ),
      ),
    );
  }
}