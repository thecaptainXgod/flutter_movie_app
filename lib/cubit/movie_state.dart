part of 'movie_cubit.dart';

@immutable
abstract class MovieState {
  MovieState();
}

class MovieInitial extends MovieState {
  MovieInitial();
}

class MovieIsLoading extends MovieState {
  MovieIsLoading();
}

class MovieLoaded extends MovieState {
  final List<MovieData> movies;
  MovieLoaded({this.movies});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieLoaded && o.movies == movies;
  }

  @override
  int get hashCode => movies.hashCode;
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
