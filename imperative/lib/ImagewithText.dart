import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Text Over Image"),
          ),
          body: Center(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child:Image(image: NetworkImage("https://www.pixelstalk.net/wp-content/uploads/2016/05/Sky-Desktop-Backgrounds-Hd-Images.jpg")
                    ,
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.cover,

                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'kumar_asapu',
                      style: TextStyle(color: Colors.black,

                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    )),
              ],
            ),
          ),
        ),
        );
    }
}
