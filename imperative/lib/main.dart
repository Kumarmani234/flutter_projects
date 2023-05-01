import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),


      // home: const MyHomePage(title: 'Flutter Demo Home Page'),


      //    routes: {      //using routes
      //   '/':(context)=>MyHomePage(title: 'Flutter Demo Home Page'),
      //      '/screen2':(context)=>AnotherScreen(title:"go back"),
      //    },


      onGenerateRoute: (x) {

        if (x.name == '/') {
          return MaterialPageRoute (builder: (context) => MyHomePage(title: "Flutter Demo --Home Page"));

        } else if (x.name == '/screen2') {
          return MaterialPageRoute(
              builder: (context) => AnotherScreen(title: x.arguments as String));
        }
      },


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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text("Next Screen"),
              onPressed: ()async{
                bool? outcome=await
                // Navigator.of(context).pushNamed("screen2",arguments: "from HP-go back");
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context){
                    return AnotherScreen(title:"go back");
                  }),
                );

              },
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

// class firstscreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("page"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () { Navigator.pop(context); },
//           child:Text("go back"),
//
//         ),
//       ),
//     );
// }}

class AnotherScreen extends StatelessWidget {
  AnotherScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
                children: <Widget>[ElevatedButton(
                  child: Text("go back"),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context){
                        return AnotherScreen(title:"go back");
                      }),
                    );

                    Navigator.of(context).pop(true);
                  },

                ),
                  ElevatedButton(
                    child:Text("cancel"),
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },

                  ),
                  ElevatedButton(
                    child:Text("Back"),
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },

                  ),

                ]
            ),
            ),
        );
    }}
