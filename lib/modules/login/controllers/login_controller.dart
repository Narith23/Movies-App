import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Mock login function
  Future<void> login() async {
    // Add authentication logic here, e.g., call to an API
    print("Logging in with ${emailController.text}");
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

