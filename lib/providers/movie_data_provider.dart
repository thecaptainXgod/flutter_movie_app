import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_course/key.dart';
import '../models/movie_data.dart';
import 'package:http/http.dart' as http;

class MovieDataProvider with ChangeNotifier {
  List genreIdsList = const [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 14, "name": "Fantasy"},
    {"id": 36, "name": "History"},
    {"id": 27, "name": "Horror"},
    {"id": 10402, "name": "Music"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10749, "name": "Romance"},
    {"id": 878, "name": "Science Fiction"},
    {"id": 10770, "name": "TV Movie"},
    {"id": 53, "name": "Thriller"},
    {"id": 10752, "name": "War"},
    {"id": 37, "name": "Western"}
  ];

  String _searchkey;
  List _dataItems;
  List _genreNames = [];
  List<MovieData> _refinedItems = []; //Refined items from json response

  List temp = []; //List of Genre Id list

  List<MovieData> get items {
    return [..._refinedItems];
  }

  final apiKey = ApiKey.apiKey;

  void setSearchKey(String key) {
    _searchkey = key;
    // print(_searchkey);
    notifyListeners();
  }

  bool isSearchKeyEmpty() {
    if (_searchkey.isEmpty) {
      return true;
    } else
      return false;
  }

  Future<void> getData() async {
    final url =
        "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$_searchkey";
    try {
      final response = await http.get(
        Uri.encodeFull(url),
        headers: {"accept": 'application/json'},
      );

      final _convertToJson = json.decode(response.body);
      _dataItems = _convertToJson['results'];

      for (int i = 0; i < _dataItems.length; i++) {
        _refinedItems.add(MovieData(
          title: _dataItems[i]['title'],
          rating: _dataItems[i]['vote_average'].toString(),
          imageUrl: _dataItems[i]['poster_path'],
          genreID: _dataItems[i]['genre_ids'],
        ));
      }

      getGenres(); //getting genres.

    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

//Complex & Stupid, need optimistic solution
  Future<void> getGenres() async {
    List ids = [];

    for (int i = 0; i < _refinedItems.length; i++) {
      ids.addAll(_refinedItems[i].genreID);
      if (ids.length != null) {
        for (int j = 0; j < ids.length; j++) {
          for (int k = 0; k < genreIdsList.length; k++) {
            if (ids[j] == genreIdsList[k]['id']) {
              _genreNames.add(genreIdsList[k]['name']);
              break;
            }
          }
        }
        setGenreList([..._genreNames]);
        _genreNames.clear();
      }
      ids = [];
    }
    notifyListeners();
  }

  void clearList() {
    _dataItems = [];
    _refinedItems = [];
    _searchkey = null;
    notifyListeners();
  }

  void setGenreList(List genreName) {
    temp.add(genreName);
  }

  List get getGenreList {
    return [...temp];
  }
}
