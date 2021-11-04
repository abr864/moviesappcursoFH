import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movapp/Models/movie.dart';
import 'package:movapp/widgets/widgets.dart';

class Detailscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          // Text('hola mundo'),
          _PosterAndTitle(movie),
          _Overview(movie),
          CastCard(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar(this.movie);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
          ),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
        ),
        background: FadeInImage(
          placeholder: NetworkImage('https://via.placeholder.com/500x300'),
          image: NetworkImage(movie.fullbackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/200x300'),
              image: NetworkImage(movie.fullposterMovie),
              height: 150,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: styleText.headline6,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: styleText.subtitle1,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline_outlined),
                  Text(
                    movie.voteAverage.toString(),
                    style: styleText.headline6,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
