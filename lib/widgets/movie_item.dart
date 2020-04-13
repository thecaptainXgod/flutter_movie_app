import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_data_provider.dart';

class MovieItem extends StatelessWidget {
  
  final int index;
  MovieItem(this.index);

  @override
  Widget build(BuildContext context) {
    final checkProvider = Provider.of<MovieDataProvider>(context).items;
    final genresNames = Provider.of<MovieDataProvider>(context).getGenreList;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 140,
      width: width * .6,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 2.0),
            blurRadius: 20.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${checkProvider[index].title}",
              style: Theme.of(context).textTheme.headline6,
              softWrap: true,
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: 25,
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: genresNames[index].length,
                itemBuilder: (ctx, ind) {
                  return ind == genresNames[index].length - 1
                      ? Text(
                          "${genresNames[index][ind]}",
                          softWrap: false,
                          overflow: TextOverflow.clip,
                        )
                      : Text("${genresNames[index][ind]}|",
                          softWrap: false, overflow: TextOverflow.clip);
                },
              ),
            ),
            Container(
              height: 35,
              width: 90,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "${checkProvider[index].rating} IMDB",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                color: double.parse(checkProvider[index].rating) <= 7
                    ? Colors.blue
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
