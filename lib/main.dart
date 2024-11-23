import 'package:flutter/material.dart';
import 'package:movies_app/global/GlobalAppBar/global_app_bar.dart';
import 'package:movies_app/global/GlobalBottomNavigationBar/global_bottom_navigation_bar.dart';
import 'package:movies_app/modules/profile/views/profile_screen.dart';
import 'modules/home/views/home_screen.dart';
import 'modules/movie/views/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Disable debug banner for a cleaner look
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainScreen(),  // Set MainScreen as the home screen
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens to navigate between
  final List<Widget> _screens = [
    const HomeScreen(),
    const MoviesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'Movie App'),
      body: _screens[_currentIndex],
      bottomNavigationBar: GlobalBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
