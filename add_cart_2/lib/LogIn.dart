//
// import 'package:add_cart_2/screens/catalog_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'authenticate.dart';
// import 'main1.dart';
// import 'models/product_model.dart';
//
//
//
// class LoginPage extends StatefulWidget {
//   final String title;
//   const LoginPage({required this.title});
//   @override
//   State<LoginPage> createState() => _MyLoginPageState();
//
//
//
// }
//
// class _MyLoginPageState  extends State<LoginPage> {
//   late String _username;
//   final _formKey = GlobalKey<FormState>();
//   late String _password;
//   AuthenticationHelper AHelper = AuthenticationHelper();
//
//   @override
//   void initState() {
//     _username='';
//     _password = '';
//   }
//   void _loginClick() async {
//     print("login-cthis->");
//     print(_formKey);
//     var valid = _formKey.currentState!.validate();
//     if (!valid) {
//       return;
//     }
//     await AHelper
//         .signin(email: _username, password: _password)
//         .then((result) {
//       print('Check-Result:');
//       print(_username);
//       print(_password);
//       print(result);
//       if (result == null) {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => MyHomePage(title: "ScoriaIT - VMS - created!")));
//
//       } else {
//         print('fff');
//         print(_username);
//         SessionManager().set("UserName", _username);
//         SessionManager().set("IsLoggedIN", true);
//         dynamic uname = SessionManager().get("UserName");
//         uname!.then((r) {
//           if (r != null) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//                 'Helo! welcome ' + r,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ));
//             if ((result == 'ok')) {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) =>
//                       CatalogScreen()));
//             }
//           }
//         });
//       }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text('LogIn Page', style: Theme
//               .of(context)
//               .textTheme
//               .headline6),
//           elevation: 0,
//           brightness: Brightness.light,
//           leading:
//           IconButton(onPressed: () {
//             Navigator.pop(context);
//           }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Container(
//             height: MediaQuery
//                 .of(context)
//                 .size
//                 .height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Text("Login", style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),),
//                         SizedBox(height: 20,),
//                         Text("Welcome back ! Login with your credentials", style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.grey[700],
//                         ),),
//                         SizedBox(height: 30,)
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 40
//                       ),
//                       child: Column(
//                         children: [
//                           makeInput(label: "Email"),
//                           makeInput(label: "Password", obsureText: true),
//                           // makeInput(label: "Confirm Password", obsureText: true)
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Container(
//                         padding: EdgeInsets.only(top: 3, left: 3),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(40),
//                             border: Border(
//                               bottom: BorderSide(color: Colors.black),
//                               top: BorderSide(color: Colors.black),
//                               right: BorderSide(color: Colors.black),
//                               left: BorderSide(color: Colors.black),
//                             )
//                         ),
//                         child: MaterialButton(
//                           minWidth: double.infinity,
//                           height: 60,
//                           onPressed: _loginClick,
//                           color: Colors.tealAccent,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40)
//                           ),
//                           child: Text("Login", style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54
//                           ),),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Don't have an account? "),
//                         Text("Sign Up", style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18
//                         ),),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//
//
//           ),
//         )
//     );
//
//   }
//
//   Widget makeInput({label, obsureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color: Colors.black87
//         ),),
//         SizedBox(height: 5,),
//         TextFormField(
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'Please enter an value.';
//             }
//             return null;
//           },
//           onChanged: (text) {
//             if (label == 'Email') {
//               setState(() {
//                 _username = text;
//               });
//             }
//             else if(label == 'Password') {
//               setState(() {
//                 _password = text;
//               });
//             }
//           },
//           obscureText: obsureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.grey,
//               ),
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey)
//             ),
//           ),
//         ),
//         SizedBox(height: 30,)
//       ],
//     );
//   }
// }
//
