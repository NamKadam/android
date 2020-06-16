import 'dart:async';
import 'package:flutter_movies_app/api/MoviesApi.dart';
import 'package:flutter_movies_app/models/MoviesListModel.dart';
import 'package:flutter_movies_app/models/TrailerModel.dart';

class MoviesRepo{
  final movieApiProvider = MoviesApi();

  Future<MoviesListModel> fetchAllMovies () => movieApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => movieApiProvider.fetchTrailer(movieId);


}