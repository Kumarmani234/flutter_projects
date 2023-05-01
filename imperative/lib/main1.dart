import 'package:flutter/material.dart';
import 'package:imperative/FirstScreen.dart';
import 'package:imperative/RouteGenerator.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: FirstScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}