import 'package:flutter/material.dart';

class SecoundScreen extends StatefulWidget {
  List <String> listPlayerNames;
  SecoundScreen({required this.listPlayerNames});
  @override
  State<StatefulWidget> createState() {
    return SecondScreenState(listPlayerNames);
  }
}

class SecondScreenState extends State<SecoundScreen> {
  List <String> listPlayerNames;
  SecondScreenState(this. listPlayerNames);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for(var games in listPlayerNames)
              Container(
                margin: EdgeInsets.only(top:15,bottom: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,games);
                  },
                  child: Text(games.toString()),
                ),
              )
          ],
        ),
      ),
    );
  }
}
