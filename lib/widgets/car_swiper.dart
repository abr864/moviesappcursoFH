import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:movapp/Models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.1,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Container(
      width: double.infinity,
      height: 450,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage(movie.fullposterMovie),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
