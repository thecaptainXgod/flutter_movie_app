import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/movie_cubit.dart';
import 'package:flutter_course/models/movie_data.dart';
import 'package:flutter_course/services/auth.dart';
import 'package:flutter_course/widgets/movie_card.dart';
import '../widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    @required this.onSignOut,
    @required this.auth,
  });

  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _signOut,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchBar(),
            Container(
              height: 600,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
              ),
              child: BlocConsumer<MovieCubit, MovieState>(
                listener: (context, state) {
                  if (state is MovieLoaded) {
                    if (state.movies == [])
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No Movie Entered"),
                        ),
                      );
                  }
                  if (state is MovieError) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is MovieInitial) {
                    return Center(
                      child: Text(
                        "No Result Yet",
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  } else if (state is MovieIsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MovieLoaded) {
                    return Center(child: _buildList(context, state.movies));
                  } else {
                    return Center(
                      child: Text(
                        "No Result Yet",
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<MovieData> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}
