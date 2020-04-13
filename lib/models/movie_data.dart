import 'package:flutter/foundation.dart';

class MovieData {
  final String id;
  final String title;
  final String rating;
  final List<dynamic> genreID;
  final String imageUrl;

  MovieData({
    @required this.title,
    this.id,
    this.genreID,
    this.imageUrl,
    this.rating,
  });
}
