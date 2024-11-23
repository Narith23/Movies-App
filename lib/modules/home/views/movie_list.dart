import 'package:flutter/material.dart';
import 'package:movies_app/modules/movie/views/detail_screen.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Movies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildMovieList([
            'assets/images/movie1.jpg',
            'assets/images/movie2.jpg',
            'assets/images/movie3.jpg',
            'assets/images/movie4.jpg',
          ], [
            'Movie 1', 'Movie 2', 'Movie 3','Movie 4'
          ], context),
        ],
      ),
    );
  }

  // Helper function to build movie list
  Widget _buildMovieList(List<String> images, List<String> titles, BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the movie detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(
                    movieTitle: titles[index],
                    moviePoster: images[index],
                    movieDescription: 'Placeholders can be used to enhance the experience of your application. They’re built only with HTML and CSS, meaning you don’t need any JavaScript to create them. You will, however, need some custom JavaScript to toggle their visibility. Their appearance, color, and sizing can be easily customized with our utility classes.',
                    movieRating: 8.5,
                  ),
                ),
              );
            },
            child: _buildMovieCard(images[index], titles[index]),
          );
        },
      ),
    );
  }

  // Movie card widget
  Widget _buildMovieCard(String image, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image), // Replace with your image
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
