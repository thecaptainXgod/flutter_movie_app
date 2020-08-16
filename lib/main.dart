import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/movie_cubit.dart';
import 'package:flutter_course/requests/movie_repository.dart';
import 'package:flutter_course/screens/landing_page.dart';
import 'package:flutter_course/services/auth.dart';

void main() => runApp(MovieApp());

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(MovieRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 17,
              wordSpacing: 0,
            ),
            button: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 0.2,
            ),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: LandingPage(
          auth: Auth(),
        ),
      ),
    );
  }
}
