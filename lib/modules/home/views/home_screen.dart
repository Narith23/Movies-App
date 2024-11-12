import 'package:flutter/material.dart';
import 'package:movies_app/modules/home/views/categories.dart';
import 'package:movies_app/modules/home/views/featured_movie.dart';
import 'movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Wrap the body content in a SingleChildScrollView for scrolling
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search movies...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onChanged: (value) {
                      // Add search logic here, if needed
                    },
                  ),
                ),
              ),

              // Featured Movie Section
              const FeaturedMovie(),

              const SizedBox(height: 20),

              // Categories Section
              const Categories(),

              const SizedBox(height: 20),

              // Movie List Section
              const MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}
