import 'package:flutter/material.dart';

import 'MoviesDetailBloc.dart';


class MoviesDetailBlocProvider extends InheritedWidget {
  final MoviesDetailBloc bloc;

  MoviesDetailBlocProvider({Key key, Widget child})
      : bloc = MoviesDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MoviesDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MoviesDetailBlocProvider)
    as MoviesDetailBlocProvider)
        .bloc;
  }
}