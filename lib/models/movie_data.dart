class MovieData {
  final int id;
  final String title;
  final String rating;
  final List<dynamic> genreID;
  final String imageUrl;
  final String overview;
  final String trailerImage;
  final double popularity;
  final int voteCount;

  MovieData({
    this.title,
    this.id,
    this.genreID,
    this.imageUrl,
    this.rating,
    this.overview,
    this.trailerImage,
    this.popularity,
    this.voteCount,
  });

  factory MovieData.fromJson(Map<String, dynamic> parsedJson) {
    return MovieData(
      id: parsedJson["id"] ?? null,
      title: parsedJson["title"] ?? null,
      genreID: parsedJson["genre_ids"] ?? [],
      imageUrl: parsedJson['poster_path'] ?? null,
      rating: parsedJson['vote_average'].toString() ?? null,
      overview: parsedJson["overview"] ?? null,
      trailerImage: parsedJson["backdrop_path"] ?? null,
      popularity: parsedJson["popularity"] ?? null,
      voteCount: parsedJson["vote_count"] ?? null,
    );
  }
}

class GenreId {
  final String name;
  final int id;

  GenreId({
    this.name,
    this.id,
  });
}
