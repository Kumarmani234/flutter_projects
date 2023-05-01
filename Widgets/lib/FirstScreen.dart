import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Center(
            child: ElevatedButton(
              child: Text("Go Back"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            ),
       );
   }
}
