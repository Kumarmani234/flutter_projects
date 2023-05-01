import 'package:add_carts/productlist.dart';
import 'package:add_carts/widgets/Login.dart';
import 'package:add_carts/widgets/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'PayG pay as you '),
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
  @override
    void initState(){
     FirebaseAuth.instance.authStateChanges().listen((User ? user ) {
       if(user== null){
         print("mmp user currently signed out");
       }else{
         late final un= user.email;
         late final UID= user.uid;
         print("mmp user signed in");
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductListPage(title: "fm"+un.toString() ,useremail: un.toString(), UID: UID.toString())));

       }
     });
     super.initState();
  }

  final List<String> _listItem=[
    'assets/images/shoe.jpeg',
    'assets/images/pant.jpeg',
    'assets/images/shirt.jpeg',
    'assets/images/chair.jpeg',
    'assets/images/t-shirt.jpeg',
    'assets/images/watch.jpg',
    'assets/images/belt.jpeg',



  ];
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Log-in'),
              onTap: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return LoginPage(title:widget.title);
                }
                ),);
              },
            ),
            ListTile(
              title: const Text('Sign-Up'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return SignupPage(title:widget.title);
                }
                ));
              },
            )
          ],
        ),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:DecorationImage(
                      image: AssetImage('assets/images/home.jpg'),
                      fit:BoxFit.cover
                  )
              ),

              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.5),

                          Colors.black.withOpacity(.3),
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("home" ,style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,

              ),
              child: Center(child:  Text("Shop Now" ,style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),),
            )    ,
            SizedBox(height: 20,),
            Expanded(
                child: GridView.count(crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem.map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Transform.translate(offset: Offset(50,-50),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 65,vertical: 63),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Icon(Icons.bookmark_border,size: 15,),
                        ),

                      ),
                    ),
                  )).toList(),
                )
            )


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}