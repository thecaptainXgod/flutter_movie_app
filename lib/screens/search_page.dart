import 'package:flutter/material.dart';
import 'package:flutter_course/services/auth.dart';
import 'package:provider/provider.dart';
import '../providers/movie_data_provider.dart';
import '../widgets/search_bar.dart';
import '../widgets/movie_stack_item.dart';

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
    //Provider
    final movieProvider = Provider.of<MovieDataProvider>(context);

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
              child: movieProvider.items.isEmpty ||
                      movieProvider.isSearchKeyEmpty() == true
                  ? Center(
                      child: Text(
                      "No Reults Yet",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  : ListView.builder(
                      itemCount: movieProvider.items.length,
                      itemBuilder: (ctx, index) {
                        return MovieStackItem(index);
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
