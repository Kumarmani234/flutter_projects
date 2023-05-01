import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//List_program
// void main() {
//   //runApp(const MyApp());
//   List name = ['kumar', 'varun', 'om', 'kiran'];
//   name.forEach((number) => print('hello $number'));
// }



//Using Try_and_Catch
//   void main() {
//   String forecast=a.getForecast();
//   print(forecast);
//   try{
//     String forecast=a.getForecast();
//     print(forecast);
//   }
//   catch(reason,stack){
//     print('Exception thrown $reason');
//     print("call stack $stack");
//   }}
// class a {
//   static String getForecast() {
//     throw"Lost";
//     }
// }



//Functions_and_Methods
// void main() {
// var kumar=sayHello;
// String helloMessage=kumar();//object
//   print(helloMessage);
// }
// String sayHello()
// {
//   return "Hello world";
// }
//


//Local_and_Global functions (or) Lexical scope
// void main() {
//   simpleFunction();
//   globalFunction();
// }
// simpleFunction() {
//   print("SimpleFunction");
//   globalFunction() {
//     print("Nested globalfunction");
//   }
//   globalFunction();
// }
// globalFunction() {
//   print("Top-Level globalFunction");
// }



//named_parameters
// void main() {
//   String kumar=asapu("kumar",age:21);
//   print(kumar);
// }
// asapu(String name,{required int age}) {
//   return "Good morning $name! what's your age.I am $age years old";
// }



//optional_positional_parameter
// void main() {
//   var kumar=asapu('sri');
//   print(kumar);
// }
// asapu(String name,[int age=21]) {
//   return "My name is $name.I am $age years old";
// }



//positional_parameter
// void main() {
//   var sri=kumar('mani',18);
//   print(sri);
// }
// kumar(String name,int age) {
//   return "Name:$name.   Age:$age";
// }



//null_assertion_operator
// void main() {
//   String? name="kumar";
//   print(name?.length);
// }



//async_and_await program
// void main() async {
//   print("Start of long running operation");
//   longRunningOperation();
//   print("Continuing main body");
//   for(int i=10;i<=15;i++) {
//     await Future.delayed(Duration(seconds: 1));
//     print("index from main: $i");
//   }
//   print("end of main");
// }
// Future<void>longRunningOperation() async {
//   for(int i=0;i<=5;i++) {
//     await Future.delayed(Duration(seconds: 1));
//     print("index: $i");
//   }
// }



//class_inheritance program
// abstract class Person {
//   String firstName;
//   String lastName;
//   Person(this.firstName,this.lastName);
//   String get fullName;
// }
// class Student extends Person {
//   String nickName;
//   Student (String firstName,String lastName,this.nickName) : super(firstName,lastName);
//   String get fullName => "$firstName $lastName";
//   String toString() => "$fullName,$nickName";
// }
// main() {
//   Student student=Student("Kumar", "Manikanta", "Bhanu");
//   print(student);
// }



//class_structure
// class Person {
//   String? firstname;
//   String? lastname;
//   String getfullname() =>"$firstname $lastname";
// }
// main() {
//   Person p=Person();
//   p.firstname="sri kumar manikanta";
//   p.lastname="asapu";
//   print(p.getfullname());
// }



//Constructor using class_structure program
// class Person {
//   String firstname;
//   String lastname;
//   Person(this.firstname,this.lastname);
//   String getfullname() =>"$firstname $lastname";
// }
// main() {
//   Person p=Person("sri kumar manikanta","asapu");
//   print(p.getfullname());
// }



//enum_type program
// enum Persontype{student,employee}
// class Person {
//   String? firstname;
//   String? lastname;
//   late Persontype type;
//   String getfullname() => "$firstname $lastname";
// }
// main() {
//   print(Persontype.values);
//   Person P = Person();
//   P.type = Persontype.employee;
//   print(P.type);
//   print(P.type.index);
//   print(describeEnum(Persontype.employee));
// }



//nullable_generices
// main() {
//   var employee=<String,String?> {
//     "Name" : "Asapu sri kumar manikanta",
//     "Company" : "Xsilica software solutions",
//     "Age" :null,
//   };
//   print(employee);
// }



//statics
// class Person {
//   String? firstname;
//   String? lastname;
//   static String personlabel="Person name:";
//   String get fullname =>"$personlabel $firstname $lastname";
//   // set fullname(String fullname) {
//   //   var parts=fullname.split("");
//   //   this.firstname=parts.first;
//   //   this.lastname=parts.last;
//   // }
//   static void printsperson(Person person) {
//     print("$personlabel ${person.firstname} ${person.lastname}");
//   }
// }
// main() {
//   Person a=Person();
//   a.firstname="sri kumar manikanta";
//   a.lastname="asapu";
//   Person b=Person();
//   b.firstname="kiran kumar";
//   b.lastname="obula";
//   print(a.fullname);
//   print(b.fullname);
//   Person.personlabel="Name:";
//   print(a.fullname);
//   print(b.fullname);
// }











  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
