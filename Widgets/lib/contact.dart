import 'package:flutter/material.dart';

class contact extends StatelessWidget {
  const contact({Key? key,required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style:TextStyle(backgroundColor: Colors.pink, height:2));
  }
}
