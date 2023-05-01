import 'package:flutter/material.dart';


import 'authentication.dart';
import 'login.dart';
import 'main.dart';


class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({ required this.title});

  @override
  State<SignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends  State<SignupPage> {



  late String _username;

  late String _password;


  // late   String _user;

  AuthenticationHelper AHelper = AuthenticationHelper();

  @override
  void initState() {
    ///// _firestoreProductsProvider.loadAllProducts();

    _username = '';
    _password = '';



    //  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //     setState(() {
    //       /*_user = FirebaseAuth.instance.currentUser!;*/
    //
    //       _username = user.email.toString();
    //       _password = 'XXX';
    //
    //     });
    //   } else {
    //     if (this.mounted) {
    //       setState(() {
    //
    //         _username = "";
    //         _password = '';
    //
    //
    //       });
    //     }
    //   }
    // });
    super.initState();
  }


  void _signupClick() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //----- _username = 'Test@scoriait.com';
      //------- _password = 'Test@12345';
    });
    print('singup-clickedddddd');

    print(_username);
    print(_password);



    await AHelper //AuthenticationHelper()
        .signUp( email: _username, password: _password)
        .then((result) {
      print('Result:-->');
      print(result);
      if (result == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
                MyHomePage(title: 'Shopping Home Page')));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            //result,
            'Registered User sucessfully!',
            style: TextStyle(fontSize: 16),
          ),
        ));

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
                LoginPage(title: 'LogIn Page')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        /*resizeToAvoidBottomPadding: false,*/
        /* backgroundColor: Colors.white,*/
        appBar: AppBar(
            elevation: 0,
            title: Text('SignUp Page'),

            brightness: Brightness.light,

            // backgroundColor: Colors.white
        leading:
        IconButton(onPressed: () {
    Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),
    ),
    body: SafeArea(
    child: SingleChildScrollView(
    child: Container(
    height: MediaQuery
        .of(context)
        .size
        .height,
    width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text("Sign up", style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),),
    SizedBox(height: 20,),
    Text("Create an Account,Its free", style: TextStyle(
    fontSize: 15,
    color: Colors.grey,
    ),),
    SizedBox(height: 30,)
    ],
    ),
    Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 40
    ),
    child: Column(
    children: [

    makeInput(label: "Email"),
    makeInput(label: "Password", obsureText: true),
    makeInput(label: "Confirm Pasword", obsureText: true)
    ],
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Container(
    padding: EdgeInsets.only(top: 3, left: 3),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    border: Border(
    bottom: BorderSide(color: Colors.black),
    top: BorderSide(color: Colors.black),
    right: BorderSide(color: Colors.black),
    left: BorderSide(color: Colors.black)
    )
    ),
    child: MaterialButton(
    minWidth: double.infinity,
    height: 60,
    onPressed: _signupClick,
    color: Colors.orange,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40)
    ),
    child: Text("Sign - Up", style: TextStyle(
    fontWeight: FontWeight.w600, fontSize: 16,

    ),),
    ),
    ),
    ),
    SizedBox(height: 20,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("Already have an account? "),
    Text("Login", style: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18
    ),),
    ],
    )
    ],

    ),
    ],
    ),
    ),
    ),
    ),
    );
  }


  Widget makeInput({label, obsureText = false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),),
          SizedBox(height: 5,),
          TextField(
            onChanged: (text) {
              if (label == 'Email') {
                setState(() {
                  // _user = null;
                  _username = text;

                });
              }
              else if(label == 'Password'){
                setState(() {
                  // _user = null;
                  _password = text;

                });
              }
            },
            obscureText: obsureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
            ),
          ),
          SizedBox(height: 30,)

          ],
        );
    }
}
