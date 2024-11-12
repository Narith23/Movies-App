import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieTitle;
  final String moviePoster;
  final String movieDescription;
  final double movieRating;

  // Constructor to pass the movie details
  const MovieDetailScreen({
    super.key,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieDescription,
    required this.movieRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Poster
              Center(
                child: Image.asset(
                  moviePoster,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Movie Title
              Text(
                movieTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Movie Rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  Text(
                    '$movieRating/10',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Movie Description
              Text(
                movieDescription,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Additional Details (optional)
              // You can add cast, director, or other info here
              const Text(
                'Cast: Actor 1, Actor 2, Actor 3',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
