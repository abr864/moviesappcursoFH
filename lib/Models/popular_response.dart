// To parse this JSON data, do
//
//     final popularmovie = popularmovieFromMap(jsonString);

import 'dart:convert';
import 'package:movapp/Models/movie.dart';

class Popularmovie {
  String titlesecction = "";

  Popularmovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    required this.titlesecction,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;
  String titlesection = "";

  factory Popularmovie.fromJson(String str) =>
      Popularmovie.fromMap(json.decode(str));

  factory Popularmovie.fromMap(Map<String, dynamic> json) => Popularmovie(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        titlesecction: "Populares",
      );
}
