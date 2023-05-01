import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_laravel_api/productlist.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'authentication.dart';
import 'main.dart';



class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({ required this.title});

 //AuthenticationHelper AHelper = AuthenticationHelper();

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  late String _username;

  late String _password;
  AuthenticationHelper AHelper = AuthenticationHelper();


  @override
  void initState() {
    ///// _firestoreProductsProvider.loadAllProducts();
    ////_isLoading = false;
    _username = '';
    _password = '';
  }
    void _loginClick() async {
    await AHelper // AuthenticationHelper()
        .signIn(email: _username, password: _password)
        .then((result) {
      print('Check-Result:');
      print(_username);
      print(_password);
      print(result);

      if (result == null) {


        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Shopping Home Page')));
      }

      else {
print('fff');
print( result['user']['name']);
print(result['authorisation']['token']);
print(_username);
          SessionManager().set("UserName",result['user']['name']);//_username);
          SessionManager().set("IsLoggedIN",true);
SessionManager().set("Accesstoken",result['authorisation']['token']);


          dynamic uname = SessionManager().get("UserName");

          uname!.then((r) {

            if(r != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Hello! welcome ' + r,
                  style: TextStyle(fontSize: 16),
                ),
              ));
              if ((result != null )) {
                print('GO TO PL->');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>
                        ProductListPage(title: 'Products Screen')));
              }
            }

          });



      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /*backgroundColor: Colors.white,*/
      appBar: AppBar(
        title: Text('LogIn Page'),

        elevation: 0,
        brightness: Brightness.light,
        /*backgroundColor: Colors.white,*/
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Text ("Login", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 20,),
                    Text("Welcome back ! Login with your credentials",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
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
                      makeInput(label: "Password",obsureText: true),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3,left: 3),
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
                      height:60,
                      onPressed: _loginClick,
                      color: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Login",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black54
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?"),
                    Text("Sign Up",style: TextStyle(
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
    );
  }

  Widget makeInput({label,obsureText = false}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style:TextStyle(
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
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
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
