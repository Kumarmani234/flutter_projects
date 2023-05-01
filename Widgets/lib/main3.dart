import 'package:flutter/material.dart';

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
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("PayG Employee Details"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white30,
        body: Container(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:<Widget> [
                Image.asset('assets/images/kumar.jpg',
                  height:400,
                  width:400,
                ),
                Container(
                  color: Colors.white,
                  height: 30,

                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget> [
                      Text("Name : Asapu sri kumar manikanta")
                    ],
                  ),
                ),




                Card(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("ID : 1002")
                    ],
                  ),
                ),



                Container(
                  height: 40,
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height:30,
                        width: 90,
                        child: Text("Employee Address :"),
                      ),
                      Expanded(
                          child: Text("Ashok nagar,Amalapuram,533201.",maxLines: 2,))
                    ],
                  ),
                ),



                Card(
                  color:Colors.amberAccent,
                  child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:<Widget> [
                        Text("Mobile : 6305889568")
                      ]
                  ),
                ),


                Container(
                  color: Colors.purple,
                  height: 30,

                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget> [
                      Text("Email : kumarmanikanta376@gmail.com")
                    ],
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
