import 'package:flutter/material.dart';
import 'package:movies_app/modules/movie/service/movie_service.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<Map<String, dynamic>> _moviesData;
  late TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _moviesData = MovieService().loadMovies();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Function to handle search query update
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding to the body
        child: Column(
          children: [
            // Search box
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  labelText: 'Search Movies',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _moviesData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator with 0.8 opacity
                    return const Opacity(
                      opacity: 0.8, // Apply 0.8 opacity to the loading state
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    // Show error state with 0.8 opacity
                    return Opacity(
                      opacity: 0.8, // Apply 0.8 opacity to the error state
                      child: Center(child: Text('Error: ${snapshot.error}')),
                    );
                  } else if (snapshot.hasData) {
                    var movieCategories = snapshot.data?['result'] ?? [];

                    return ListView.builder(
                      itemCount: movieCategories.length,
                      itemBuilder: (context, index) {
                        var category = movieCategories[index];
                        var movies = category['movies'] ?? [];

                        // Filter movies based on search query
                        var filteredMovies = movies.where((dynamic movie) {
                          // Ensure that the movie is a Map and has the 'title' key
                          if (movie is Map && movie.containsKey('title')) {
                            var title = movie['title'].toString().toLowerCase();
                            return title.contains(_searchQuery.toLowerCase());
                          }
                          return false;
                        }).toList();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            // Display category name
                            Text(
                              category['category'],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Display filtered movie list for this category
                            SizedBox(
                              height: 200, // Adjust height as needed
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: filteredMovies.length,
                                itemBuilder: (context, movieIndex) {
                                  var movie = filteredMovies[movieIndex];
                                  return GestureDetector(
                                    onTap: () {
                                      // Optionally, navigate to a movie detail screen
                                    },
                                    child: _buildMovieCard(
                                      movie['image_path'],
                                      movie['title'],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
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
