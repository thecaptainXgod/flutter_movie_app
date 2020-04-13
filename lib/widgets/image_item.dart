import 'package:flutter/material.dart';
import '../providers/movie_data_provider.dart';
import 'package:provider/provider.dart';

class ImageItem extends StatelessWidget {
  final int index;
  ImageItem(this.index);

 
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieDataProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
        // color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          height: 185,
          width: 135,
          image: movieProvider.items[index].imageUrl == null
              ? NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png")
              : NetworkImage(
                  "http://image.tmdb.org/t/p/w185/${movieProvider.items[index].imageUrl}",
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
