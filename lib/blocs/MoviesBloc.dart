import 'package:flutter_movies_app/models/MoviesListModel.dart';
import 'package:flutter_movies_app/repo/MoviesRepo.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = MoviesRepo();
  final _moviesFetcher = PublishSubject<MoviesListModel>();

  Observable<MoviesListModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async{
    MoviesListModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }


}

final bloc = MoviesBloc();