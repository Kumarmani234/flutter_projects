import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Appbar(title: 'Flutter Demo Home Page'),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({Key? key,required String title}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("you clicked menu functionality")),
          );
        },),
        title: Text('Scoria'),
        actions: [
          IconButton(onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("you clicked cart functionality")),
    );
    }, icon:Icon(Icons.shopping_cart)), //IconButton
        IconButton(onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you clicked search functionality")),
          );
        },icon:Icon(Icons.search)),
        ],//IconButton
    elevation: 10,  //appbar elevation
    titleSpacing: 30,  //for title positining
    centerTitle:true,  //to place title in center
    backgroundColor: Colors.redAccent.shade100,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    ),
    flexibleSpace:Image(image:NetworkImage("https://getwallpapers.com/wallpaper/full/5/a/7/795479-download-cool-sunset-backgrounds-2560x1600-photo.jpg"),
    fit:BoxFit.cover,
    ),
    ),
    );
    }
    }