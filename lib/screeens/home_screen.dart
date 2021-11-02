import 'package:flutter/material.dart';
import 'package:movapp/providers/movies_provider.dart';
import 'package:movapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            Moviesslider(
              movies: moviesProvider.onDisplayPopular,
              title: "Populares",
              onNextPage: () => moviesProvider.getpopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
