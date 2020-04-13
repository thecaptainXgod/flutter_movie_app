import 'package:flutter/material.dart';
import '../providers/movie_data_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieProivder = Provider.of<MovieDataProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      child: TextField(
        cursorColor: Colors.black,
        autofocus: true,
        autocorrect: false,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          // alignLabelWithHint: true,
          hintText: 'Search for movies',
          hintStyle: Theme.of(context).textTheme.headline6,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              // if (_searchController.text == null){
              //Implementation
              //}
              // else {}
              movieProivder.clearList();
              movieProivder.setSearchKey(_searchController.text);
              movieProivder.getData(); //Testing
              movieProivder.getGenres();
            },
          ),
        ),
        controller: _searchController,
        onSubmitted: (_) {
          // if (_searchController.text == null)
          //   dialogBox(context);
          // else {}
          movieProivder.clearList();
          movieProivder.setSearchKey(_searchController.text);
          movieProivder.getData(); //Testing
          movieProivder.getGenres();
        },
      ),
    );
  }
}
