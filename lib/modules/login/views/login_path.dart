import 'package:flutter/material.dart';

class LoginPath extends StatelessWidget {
  const LoginPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
            children: [
              // Top illustration
              Image.asset(
                'assets/images/illustration-removebg-preview.png', // Replace with your image asset
                height: 250,
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                height: 50, // Set height to 50
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Same as the Login button
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                height: 50, // Set height to 50
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Same as the Login button
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                height: 50, // Set height to 50
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A3AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
