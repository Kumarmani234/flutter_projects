import 'package:flutter/material.dart';
import 'FirstScreen.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      title:"Flutter",

      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body:Center(
        child:ElevatedButton(
          child: Text("Go to next page",),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen()));
          },
        ),
      ),
    );
  }
}
