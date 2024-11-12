import 'dart:convert';
import 'package:flutter/services.dart';

class MovieService {
  Future<Map<String, dynamic>> loadMovies() async {
    // Load the movie.json file from assets
    final String response = await rootBundle.loadString('assets/data/models/movies/movies.json');
    final data = json.decode(response);
    return data;
  }
}
