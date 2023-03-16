import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
//import 'package:peliculas/models/now_plaing_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '66ceae06ba1b3ffcca3635d0d524e371';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};
  int _popularPage = 0;
  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),

    );

  final StreamController<List<Movie>> _suggestionStremController = new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStrem => this._suggestionStremController.stream;
  

  MoviesProvider() {
    //print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }
  Future<String> _getJsionData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsionData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
//https://api.themoviedb.org/3/movie/popular?api_key=66ceae06ba1b3ffcca3635d0d524e371&language=es-ES&page=1

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await this._getJsionData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies[0]);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    //recisar el mapa

   // print('pidiendo info al los actore');
    final jsonData =
        await this._getJsionData('3/movie/${movieId}/credits', _popularPage);
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {

     final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey,
         'language': _language,
        'query': query
        }
    );
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;


  }
  void getSuggestionByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue= (value)async {
     // print('tenemos vaores a buscar  : $value');

     final results = await this.searchMovie(value);
     this._suggestionStremController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value = searchTerm;
    });
    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());

  }
}
