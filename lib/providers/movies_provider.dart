import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movapp/Models/movie.dart';
import 'package:movapp/Models/now_playing_response.dart';
import 'package:movapp/Models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '867debffa500b4acb2e4f0b321bc845b';
  String _urlBase = 'api.themoviedb.org';
  String _language = 'es-ES';
  var url = new Uri();

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopular = [];
  List<Movie> popularmovies = [];
  int _popularpage = 0;

  MoviesProvider() {
    print('se inicia el provider MoviesProvider');
    this.getHotMovies();
    this.getpopularMovies();
    print('se termina el provider MoviesProvider');
  }

  Future<String> _getUrlResult(String uri, [int page = 1]) async {
    url = Uri.https(_urlBase, uri, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getpopularMovies() async {
    if (_popularpage < 100) {
      _popularpage++;
      String body = await this._getUrlResult('3/movie/popular', _popularpage);
      final popularResponse = Popularmovie.fromJson(body).results;
      onDisplayPopular = [...onDisplayPopular, ...popularResponse];
    }
    notifyListeners();
  }

  getHotMovies() async {
    String body = await this._getUrlResult('3/movie/now_playing');
    onDisplayMovies = NowPlayingResponse.fromJson(body).results;
    notifyListeners();
  }
  // para notificar witgets que necesitan cargar info
}
