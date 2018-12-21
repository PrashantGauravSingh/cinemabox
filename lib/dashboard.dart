import 'package:cinemabox/list_movie.dart';
import 'package:cinemabox/list_tv_show.dart';
import 'package:cinemabox/news_details.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(centerTitle: true,
            backgroundColor: Colors.black87,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie_filter),text: "Latest Movies",),
                Tab(icon: Icon(Icons.local_movies),text: "Top Rated",),
                Tab(icon: Icon(Icons.update),text: "News",)
              ],
            ),
            title: Text('CinemaBox'),
          ),
          body: TabBarView(
            children: [
              MovieList(),
              TvShowList(),
              NewList(),
            ],
          ),
          ),
        ),
      );
  }
}

