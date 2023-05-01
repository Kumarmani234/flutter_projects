import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add Two Numbers';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: AddTwoNumbers(),
      ),
    );
  }
}
  class AddTwoNumbers extends StatefulWidget {
  @override
    _AddTwoNumbersState createState() => _AddTwoNumbersState();
  }


  class _AddTwoNumbersState extends State<AddTwoNumbers> {
   TextEditingController num1controller=new TextEditingController();
   TextEditingController num2controller=new TextEditingController();
   String result="0";
   @override
    Widget build(BuildContext context) {
     return Container(
       child: Column(
         children: <Widget>[
           Row(
             children: <Widget>[
               Text("Number 1:"),
               new Flexible(
                 child:TextField(
                   keyboardType: TextInputType.number,
                   controller: num1controller,
                 ),
               ),
             ],
           ),
           Row(
             children: <Widget>[
               Text("Number 2:"),
               new Flexible(
                 child:TextField(
                   keyboardType: TextInputType.number,
                   controller: num2controller,
                 ),
               ),
             ],
           ),
     Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
     child: Text("Add"),
     onPressed: () {
       setState(() {
         int sum=int.parse(num1controller.text)+int.parse(num2controller.text);
         result=sum.toString();
       });
     },
     )
     ],
     ),
     Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text("Result:",
       style: TextStyle(
       fontSize: 30,
     ),),
       Text(result,style: TextStyle(
         fontSize: 30,
       ),)
     ],
     ),
     ],
     ),
     );
   }
  }
