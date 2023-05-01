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
        primarySwatch: Colors.pink,
      ),
      home: const Listview(),
    );
  }
}
class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          itemExtent: 100,
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.account_balance),
                backgroundColor: Colors.purple,),
              title: Text("Oppo a16 e"),
              subtitle: Text("Smartphone"),
              trailing: Text("10000"),
              onTap: () {},
              tileColor: Colors.amber,

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.account_balance),
                backgroundColor: Colors.green,),
              title: Text("Lenovo ideapad3"),
              subtitle: Text("Laptop"),
              trailing: Text("45000"),
              onTap: () {},
              tileColor: Colors.indigo,

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.account_balance),
                backgroundColor: Colors.yellow,),
              title: Text("Noise"),
              subtitle: Text("Smart watch"),
              trailing: Text("3500"),
              onTap: () {},
              tileColor: Colors.cyanAccent,

            ),
            const Padding(padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                child: Text('c'),

              ),
            ),
            const Divider(),
            const Padding(padding: EdgeInsets.all(5.0),
              child: Text(
                "Flutter is a frame work used to build mobile application",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],

        ),
      ),
    );
  }
}
