import 'package:flutter/material.dart';
import 'package:imperative/FirstScreen.dart';
import 'package:imperative/SecondScreen.dart';

class RouteGenerator {
  static Route<dynamic>generateRoute(RouteSettings settings) {
    final args=settings.arguments;
    switch(settings.name) {
      case '/FirstScreen':
        return MaterialPageRoute(builder:(_)=>FirstScreen());
      case '/SecondScreen':
        if(args is List<String>) {
          return MaterialPageRoute(
            builder: (_)=>SecoundScreen(
              listPlayerNames:args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder:(_) {
      return Scaffold(
      appBar:AppBar(
      title: Text('Error'),
      ),
    body:Center(
    child:Text('Error'),
    ),
      );
    });
  }
}