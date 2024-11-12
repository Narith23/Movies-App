import 'package:flutter/material.dart';

class FeaturedMovie extends StatelessWidget {
  const FeaturedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/featured_movie.webp'), // Replace with your image
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              'Featured Movie',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
