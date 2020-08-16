import 'package:flutter_course/models/movie_data.dart';

class Genre {
  Genre._();

  static List<GenreId> genreIdsList = [
    GenreId(
      id: 28,
      name: "Action",
    ),
    GenreId(
      id: 12,
      name: "Adventure",
    ),
    GenreId(
      id: 16,
      name: "Animation",
    ),
    GenreId(
      id: 35,
      name: "Comedy",
    ),
    GenreId(
      id: 80,
      name: "Crime",
    ),
    GenreId(
      id: 99,
      name: "Documentary",
    ),
    GenreId(
      id: 18,
      name: "Drama",
    ),
    GenreId(
      id: 10751,
      name: "Family",
    ),
    GenreId(
      id: 14,
      name: "Fantasy",
    ),
    GenreId(
      id: 36,
      name: "History",
    ),
    GenreId(
      id: 27,
      name: "Horror",
    ),
    GenreId(
      id: 10402,
      name: "Music",
    ),
    GenreId(
      id: 9648,
      name: "Mystery",
    ),
    GenreId(
      id: 10749,
      name: "Romance",
    ),
    GenreId(id: 878, name: "Science,), Fiction"),
    GenreId(id: 10770, name: "TV,), Movie"),
    GenreId(
      id: 53,
      name: "Thriller",
    ),
    GenreId(
      id: 10752,
      name: "War",
    ),
    GenreId(id: 37, name: "Western"),
  ];

  static String getGenre(int id) {
    final GenreId genre = genreIdsList.firstWhere((genre) => genre.id == id);
    return genre.name;
  }
}
