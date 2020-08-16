import 'dart:convert';

import 'package:flutter_course/key.dart';
import 'package:flutter_course/models/movie_data.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<MovieData>> getMovies(String searchquery) async {
    final apiKey = ApiKey.apiKey;

    final url =
        "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchquery";

    try {
      final response = await http.get(
        Uri.encodeFull(url),
        headers: {"accept": 'application/json'},
      );

      List<MovieData> movies = [];
      final data = json.decode(response.body);
      final result = data["results"];

      result.forEach((map) {
        movies.add(MovieData.fromJson(map));
      });

      return movies;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw e;
    }
  }
}

//Exception Class
class NetworkException implements Exception {}
