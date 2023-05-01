import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag Gesture Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0;
  double _left = 0;
  double _topp = 0;
  double _leftt = 0;
  double _toppp = 0;
  double _lefttt = 0;
  double _topppp = 0;
  double _leftttt= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Draggable Program'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _top += details.delta.dy;
                  _left += details.delta.dx;
                });
              },
              child: Container(
                width: 100,
                height: 30,
                color: Colors.blue,
                child: Text('Draggable text'),
              ),
            ),
          ),
          Positioned(
            top: _topp,
            left: _leftt,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _topp += details.delta.dy;
                  _leftt += details.delta.dx;
                });
              },
              child: Container(
                width: 100,
                height: 30,
                color: Colors.deepOrange,
                child: Text('kumar_asapu'),
              ),
            ),
          ),
          Positioned(
            top: _toppp,
            left: _lefttt,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _toppp += details.delta.dy;
                  _lefttt += details.delta.dx;
                });
              },
              child: Container(
                width: 300,
                height: 400,
                child: Column(
                  children: [
                    Image(image:NetworkImage("https://getwallpapers.com/wallpaper/full/5/a/7/795479-download-cool-sunset-backgrounds-2560x1600-photo.jpg")),
                    SizedBox(height:1,),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: _topppp,
            left: _leftttt,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _topppp += details.delta.dy;
                  _leftttt += details.delta.dx;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                child: Column(
                  children: [
                    Image(image:NetworkImage("https://www.thewowstyle.com/wp-content/uploads/2015/01/nature-wallpaper-27.jpg")),
                    SizedBox(height:1,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
