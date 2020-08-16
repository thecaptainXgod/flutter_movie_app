import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/movie_cubit.dart';

class SearchBar extends StatelessWidget {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      child: TextField(
        cursorColor: Colors.black,
        autofocus: false,
        autocorrect: false,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15),
          border: InputBorder.none,
          isDense: true,
          alignLabelWithHint: true,
          hintText: 'Search for movies',
          hintStyle: Theme.of(context).textTheme.headline6,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () => _submitMovieName(context, _searchController.text),
          ),
        ),
        controller: _searchController,
        onSubmitted: (_) {
          _submitMovieName(context, _searchController.text);
        },
      ),
    );
  }

  void _submitMovieName(BuildContext context, String movieName) {
    final movieCubit = context.bloc<MovieCubit>();
    FocusScope.of(context).unfocus();
    TextEditingController().clear();

    if (movieName == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("No Movie Entered"),
        ),
      );
    }
    movieCubit.getMovies(movieName);
  }
}
