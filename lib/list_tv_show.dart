import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie_detail.dart';


class TvShowList extends StatefulWidget {
  @override
  TvListState createState() {
    return new TvListState();
  }
}

class TvListState extends State<TvShowList> {

  var movies;
  Color mainColor = const Color(0xffffffff);


  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                  itemCount: movies == null ? 0 : movies.length,
                  itemBuilder: (context, i) {
                    return  new FlatButton(

                      child: new MovieCell(movies,i),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context){
                          return new MovieDetail(movies[i]);
                        }));
                      },
                      color: Colors.black,
                    );

                  }),
            )
          ],
        ),
      ),
    );
  }
}

Future<Map> getJson() async {
  var url =
      'http://api.themoviedb.org/3/movie/top_rated?api_key=9d7de0489797bb083853f9751c0040cd';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class MovieCell extends StatelessWidget{

  final movies;
  final i;
  Color mainColor = const Color(0xffffffff);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies,this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(10.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  width: 120.0,
                  height: 120.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(2.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 2.0,
                        offset: new Offset(1.0, 2.0))
                  ],
                ),
              ),
            ),
            new Expanded(

                child: new Container(
                  margin: const EdgeInsets.fromLTRB(16.0,0.0,16.0,0.0),
                  child: new Column(children: [
                    new Text(
                      movies[i]['title'],
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Arvo',
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    new Padding(padding: const EdgeInsets.all(2.0)),
                    new Text(movies[i]['overview'],
                      maxLines: 3,
                      style: new TextStyle(
                          color: const Color(0xffffffffff),
                          fontFamily: 'Arvo'
                      ),)
                  ],
                    crossAxisAlignment: CrossAxisAlignment.start,),
                )
            ),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );

  }

}