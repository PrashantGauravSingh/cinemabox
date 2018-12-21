import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewList extends StatefulWidget {
  @override
  NewListState createState() {
    return new NewListState();
  }
}

class NewListState extends State<NewList> {

  var news;
  Color mainColor = const Color(0xffffffff);


  void getData() async {
    var data = await getJson();
    setState(() {
      news = data['articles'];
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  itemCount: news == null ? 0 : news.length,
                  itemBuilder: (context, i) {
                    return  new FlatButton(

                      child: new NewsCell(news,i),
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.black,
                      onPressed: (){
                        //Navigator.push(context, new MaterialPageRoute(builder: (context){
                      //  return new MovieDetail(movies[i]);
                     // }));
                      },
                    );

                  }),
            )
          ],
        ),
      ),
    );
  }
  Future<Map> getJson() async {
    print('inside get json');
    var url =
        'https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=601b562237754c67999cf52bf7764dd0';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

}

class NewsCell extends StatelessWidget{

  final news;
  final i;
  Color mainColor = const Color(0xffffffff);
  NewsCell(this.news,this.i);

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
                      image: new NetworkImage(news[i]['urlToImage']),
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
                      news[i]['title'],
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Arvo',
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    new Padding(padding: const EdgeInsets.all(2.0)),
                    new Text(news[i]['description'],
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