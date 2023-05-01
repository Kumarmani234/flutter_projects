import 'package:flutter/material.dart';

class  FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: ElevatedButton(
          onPressed: () {
            List<String> playerNames=["Free fire","Candy crush","Pubge","Temple run"];
            displayResult(context,playerNames);
          },
          child: Text("Select your favourite game"),
        ),
      ),
    );
  }
  displayResult(BuildContext context,List<String>playerNames)async {
    final getSelectedPlayerName=await Navigator.pushNamed(context,"/SecondScreen",arguments:playerNames);
    print(getSelectedPlayerName.toString());
  }
}
