import 'package:flutter/material.dart';

import '../widgets/movie_item.dart';
import '../widgets/image_item.dart';

class MovieStackItem extends StatelessWidget {
  final int index;
  MovieStackItem(this.index);

  @override
  Widget build(BuildContext context) {
    final newIndex = index;
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 20, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            offset: Offset(2.0, 2.0),
            blurRadius: 15.0,
          ),
        ],
        color: Colors.white10,
      ),
      child: Stack(
        children: <Widget>[
          // MOVIE DETAILS
          Positioned(
            child: MovieItem(newIndex),
            right: 2,
            top: 55,
          ),
          //ENDING MOVIE DETAILS

          //Image Here
          ImageItem(newIndex),
        ],
      ),
    );
  }
}
