import 'package:flutter/material.dart';
import 'package:flutter_movies_app/ui/MovieList.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,

      theme: new ThemeData(
        primaryColor: Colors.black,

      ),
      home: new MovieList(),
    );
  }
}

