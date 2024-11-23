import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieTitle;
  final String moviePoster;
  final String movieDescription;
  final double movieRating;

  const MovieDetailScreen({
    super.key,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieDescription,
    required this.movieRating,
  });

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingPlaceholder();
          } else {
            return _buildMovieDetails();
          }
        },
      ),
      // bottomNavigationBar: FutureBuilder(
      //   future: _loadData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return _buildLoadingButton();
      //     } else {
      //       return _buildWatchNowButton(context);
      //     }
      //   },
      // ),
    );
  }

  // Widget to show the actual content
  Widget _buildMovieDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  moviePoster,
                  height: 250,
                  fit: BoxFit.cover,
                ),
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

            // Button Watch Now
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: const Text(
                'Watch Now',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),

            // // Movie Rating
            // Row(
            //   children: [
            //     Icon(Icons.star, color: Colors.yellow[700]),
            //     const SizedBox(width: 4),
            //     Text(
            //       '$movieRating/10',
            //       style: const TextStyle(fontSize: 18),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16),

            // // Tags
            // Wrap(
            //   spacing: 8,
            //   children: [
            //     _buildTagChip('Action'),
            //     _buildTagChip('Adventure'),
            //     _buildTagChip('Fantasy'),
            //   ],
            // ),

            // const SizedBox(height: 16),

            // Movie Description
            Text(
              movieDescription,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to show loading placeholders
  Widget _buildLoadingPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for Movie Poster
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Placeholder for Movie Title
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 30,
              width: 200,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),

          // Placeholder for Movie Rating
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 50,
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Placeholder for Movie Description
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 100,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),

          // Placeholder for Additional Details
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: 150,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(String category) {
    return Chip(
      label: Text(
        category,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Actual Button after loading
  Widget _buildWatchNowButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Button action
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.black,
        ),
        child: const Text(
          'Watch Now',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  // Loading Button Placeholder
  Widget _buildLoadingButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: null, // Disabled during loading
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.grey[300], // Greyed out color for loading
        ),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
