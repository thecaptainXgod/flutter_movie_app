import 'package:flutter/material.dart';
import 'package:flutter_course/models/movie_data.dart';

class DetailsScreen extends StatefulWidget {
  final Color color;
  final MovieData movie;

  const DetailsScreen({Key key, this.color, this.movie}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool readmore = false;

  void toggleRead() {
    setState(() {
      readmore = !readmore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: MediaQuery.of(context).size.height,
          color: widget.color,
          child: _buildChildren(context),
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArrows(context),
          SizedBox(height: 20),
          _buildTitle(context),
          SizedBox(height: 30),
          _buildTrailer(context),
          SizedBox(height: 30),
          _buildOverviewTitle(context),
          SizedBox(height: 20),
          _buildOverviewcontent(context),
          SizedBox(height: 30),
          _buildPopularity(context),
        ],
      ),
    );
  }

  Widget _buildArrows(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.star_border,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: widget.movie.imageUrl == null
                ? AssetImage(
                    "assets/No-Image-Available.png",
                  )
                : NetworkImage(
                    "http://image.tmdb.org/t/p/w185/${widget.movie.imageUrl}",
                  ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxHeight: 100),
              child: Text(
                widget.movie.title,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTrailer(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: widget.movie.trailerImage == null
                ? widget.movie.imageUrl == null
                    ? Image.asset(
                        "assets/No-Image-Available.png",
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "http://image.tmdb.org/t/p/w185/${widget.movie.imageUrl}",
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      )
                : Image.network(
                    "http://image.tmdb.org/t/p/w185/${widget.movie.trailerImage}",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
          ),
          Positioned(
            left: 130,
            top: 50,
            child: Icon(
              Icons.play_arrow,
              size: 80,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 100,
            bottom: 50,
            child: Text(
              "Watch Trailer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Overview",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 25,
          width: 80,
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 25,
                color: Colors.yellow[600],
              ),
              SizedBox(width: 2.0),
              Expanded(
                child: Text(
                  widget.movie.rating,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOverviewcontent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movie.overview,
          maxLines: readmore ? 18 : 7,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          softWrap: true,
        ),
        GestureDetector(
          onTap: () => toggleRead(),
          child: Text(
            readmore == false ? "...Read more" : "Read Less",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPopularity(BuildContext context) {
    return Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Popularity",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${widget.movie.popularity}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Vote Count",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${widget.movie.voteCount}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
