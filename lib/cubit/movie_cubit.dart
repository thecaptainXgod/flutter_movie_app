import 'package:bloc/bloc.dart';
import 'package:flutter_course/models/movie_data.dart';
import 'package:flutter_course/requests/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieCubit(this._movieRepository) : super(MovieInitial());

  Future<void> getMovies(String searchQuery) async {
    try {
      emit(MovieIsLoading());
      final movies = await _movieRepository.getMovies(searchQuery);
      emit(MovieLoaded(movies: movies));
    } on NetworkException {
      emit(MovieError("Please Check your internet"));
    }
  }
}
