import 'package:flutter/material.dart';
import 'package:flutter_movies_app/blocs/MoviesBloc.dart';
import 'package:flutter_movies_app/blocs/MoviesDetailBlocProvider.dart';
import 'package:flutter_movies_app/models/MoviesListModel.dart';

import 'MoviesDetail.dart';


class MovieList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieListState();
  }

}
class MovieListState extends State<MovieList> {



  @override
  void initState(){
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose(){
//    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
      ),
      body:
      StreamBuilder(
              stream: bloc.allMovies,
              builder: (context, AsyncSnapshot<MoviesListModel> snapshot) {
                if (snapshot.hasData) {
                  return buildList(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },

        ),
      );



  }


  Widget buildList(AsyncSnapshot<MoviesListModel> snapshot) {
    return
      GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5.0,
            shape:RoundedRectangleBorder(
              side: new BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:
            Container(
              margin: EdgeInsets.all(6.0),

              child:  InkResponse(
                enableFeedback: true,
                child:
                Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data
                      .results[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              onTap: () =>
                  openDetailpage(snapshot.data, index),
              ),
            )

          );
        });
  }

  openDetailpage(MoviesListModel data, int index){
    final movie = data.results[index];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MoviesDetailBlocProvider(
          child: MoviesDetail(
            title: movie.title,
            posterUrl: movie.backdropPath,
            description: movie.overview,
            releaseDate: movie.releasDate,
            voteAverage: movie.voteAverage.toString(),
            movieId: movie.id,
          ),
        );
      }),
    );
  }
}