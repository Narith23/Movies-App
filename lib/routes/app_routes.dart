import 'package:flutter/material.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/login/views/login_path.dart';
import '../modules/login/views/login_screen.dart';
import '../modules/login/views/signup_path.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/loginpath': (context) => const LoginPath(),
    '/signuppath': (context) => const SignUpPath(),
  };
}
