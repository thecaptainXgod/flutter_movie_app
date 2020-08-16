import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/colors.dart';
import 'package:flutter_course/helpers/genre.dart';
import 'package:flutter_course/models/movie_data.dart';
import 'package:flutter_course/screens/details_screen.dart';

class MovieCard extends StatelessWidget {
  final MovieData movie;

  const MovieCard({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = KColors.getColor();

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            color: color,
            movie: movie,
          ),
        ),
      ),
      child: Container(
          height: 140,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Row(
            children: [
              _buildImagePoster(),
              SizedBox(width: 15),
              _buildColumnData(context),
            ],
          )),
    );
  }

  Widget _buildImagePoster() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: movie.imageUrl == null
          ? Image.asset(
              "assets/No-Image-Available.png",
              height: 120,
              width: 90,
            )
          : Image.network(
              "http://image.tmdb.org/t/p/w185/${movie.imageUrl}",
              height: 120,
              width: 90,
            ),
    );
  }

  Widget _buildColumnData(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              movie.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 140, maxHeight: 80),
                    child: Text(
                      "Genre: ${Genre.getGenre(movie.genreID[0])}",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.yellow[600],
                        ),
                        SizedBox(width: 2.0),
                        Expanded(
                          child: Text(
                            movie.rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
