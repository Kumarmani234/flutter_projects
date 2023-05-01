import 'package:flutter/material.dart';
import 'contact.dart';

void main() {
  runApp(
    MaterialApp(
      home:MyApp(),
    )
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Image(image:NetworkImage("http://ww1.prweb.com/prfiles/2016/01/13/13164456/twitter-post-image1.png")),
      ),
      backgroundColor: Colors.indigo,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("kumar_asapu",
            style: TextStyle(fontSize: 35,
            color:Colors.black,
            fontWeight:FontWeight.bold,
            ),),
            Image.asset('assets/images/kumar.jpg',
              height:400,
              width:400,
            ),
            myInternalWidget(),
            // Text("product 2"),
          ],
        ),
      ),
    );
  }

  Widget myInternalWidget() {
    return Column(
        children: <Widget>[
           // Text("Below color from external class"),
    Image(image:NetworkImage("https://getwallpapers.com/wallpaper/full/5/a/7/795479-download-cool-sunset-backgrounds-2560x1600-photo.jpg")),
          SizedBox(height: 1,),
          contact(title: 'Widgets are basic building blocks of user interface.It represents an element of UI such as text,images,buttons,layouts.........'),
        ]
    );
  }
}

