import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top illustration
                Image.asset(
                  'assets/images/illustration-removebg-preview.png', // Replace with your image asset
                  height: 250,
                ),
                const SizedBox(height: 20),

                // "Hello" and welcome message
                const Text(
                  'Hola!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Welcome To Little Drop, where you manage your daily tasks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 30),

                // Login and Sign Up buttons
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                  height: 50, // Set the desired height
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the Login Page
                      Navigator.pushNamed(context, '/loginpath');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A3AFF), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                  height: 50, // Same height as the Login button
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the Sign Up Page
                      Navigator.pushNamed(context, '/signuppath');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF4A3AFF)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Color(0xFF4A3AFF)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
