import 'package:flutter/material.dart';

import 'SignUp.dart';
import 'login.dart';


void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<String> _listItem=[
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('SignUp & LogIn'),
            ),
            ListTile(
              title: const Text('Log-In'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return LoginPage(title:'LogIn Page');
                }
                ),);
              },
            ),
            ListTile(
              title: const Text('Sign-Up'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return SignUpPage(title:'SignUp Page');
                }
                ),);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/flutter.png',width: 450),
            Image.asset('assets/home.jpg',width: 450),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ), //
    );
  }
}