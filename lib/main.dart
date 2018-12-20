import 'package:flutter/material.dart';
import 'list_movie.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  MovieList(),
    );
  }
}