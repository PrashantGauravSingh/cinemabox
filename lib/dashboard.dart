import 'package:flutter/material.dart';

class dashboard extends StatefulWidget{
  @override
  _DashboardState createState()=> _DashboardState();

}

class _DashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 30.0,horizontal:10.0),
        child: GridView.count(
            crossAxisCount: 2,
    padding: EdgeInsets.all(3.0),
    children: <Widget>[
      makeDashboardItem("Popular", Icons.movie),
      makeDashboardItem("Upcoming", Icons.movie_creation),
      makeDashboardItem("Alphabet", Icons.movie_filter),
      makeDashboardItem("Tv Series", Icons.local_movies),
    ],
      ),
    )
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}