import 'dart:async';

import 'package:flutter_movies_app/models/MoviesListModel.dart';
import 'package:flutter_movies_app/models/TrailerModel.dart';
import 'dart:convert';

import 'package:http/http.dart' show Client;

class MoviesApi{
  Client client = Client();
  final _apiKey = "d83ecbd1d03d04b976fc7bca2c8d288b";
  final _baseURL = "http://api.themoviedb.org/3/movie";

  Future<MoviesListModel> fetchMovieList() async{
    final response = await client
        .get("$_baseURL/now_playing?api_key=$_apiKey&language=en-US&page=1");

    if(response.statusCode == 200){
      return MoviesListModel.fromJSON(json.decode(response.body));
    }
    else{
      throw Exception('failed to laod data');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response = await client
        .get("$_baseURL/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

}