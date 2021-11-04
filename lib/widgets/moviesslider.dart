import 'package:flutter/material.dart';
import 'package:movapp/Models/movie.dart';
// import 'package:provider/provider.dart';

class Moviesslider extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final Function onNextPage;

  const Moviesslider(
      {Key? key,
      required this.movies,
      required this.title,
      required this.onNextPage})
      : super(key: key);

  @override
  _MoviessliderState createState() => _MoviessliderState();
}

class _MoviessliderState extends State<Moviesslider> {
  final ScrollController scrollcontroller = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels <=
          scrollcontroller.position.maxScrollExtent - 300) {
        // print(scrollcontroller.position.pixels); //2520.0877304781097
        // print(scrollcontroller.position.maxScrollExtent); //2607.272727272727
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: scrollcontroller,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) =>
                      _Movieposter(movie: widget.movies[index])))
        ],
      ),
    );
  }
}

class _Movieposter extends StatelessWidget {
  // _Movieposter(Movie movie);

  // final moviex = movie;

  final Movie movie;
  _Movieposter({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage(movie.fullposterMovie),
                width: 130,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
