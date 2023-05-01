//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'LogIn.dart';
// import 'authenticate.dart';
// import 'main1.dart';
//
// class SignupPage extends StatefulWidget {
//   final String title;
//   const SignupPage({required this.title});
//
//   @override
//   State<SignupPage> createState() => _MySignupPageState();
// }
//
// class _MySignupPageState extends State<SignupPage> {
//   late String _username;
//   late String _password;
//   AuthenticationHelper AHelper=AuthenticationHelper();
//   final _formKey=GlobalKey<FormState>();
//   @override
//   void initstate() {
//     _username='';
//     _password='';
//     super.initState();
//   }
//   void _signupClick() async {
//     print('register-cthis->');
//     print(_formKey);
//     var valid= _formKey!.currentState!.validate();
//     if(!valid) {
//       return;
//     }
//     print('signup-clicked');
//     print(_username);
//     print(_password);
//     await AHelper
//         .signup(email: _username, password: _password)
//         .then((result) {
//       print('Result:->');
//       print(result);
//       if(result==null) {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute (builder: (context) =>
//                 MyHomePage(title: 'PayG-VMS-created!')));
//       }
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//             'Registered user successfully!',
//             style: TextStyle(fontSize: 16),
//           ),
//         ));
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) =>
//                 LoginPage(title:'PayG-VMS!')));
//       }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('SignUp Page',style: Theme
//             .of(context)
//             .textTheme
//             .headline6,),
//         brightness: Brightness.light,
//         leading:
//         IconButton(onPressed: () {
//           Navigator.pop(context);
//         },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
//       ),
//       body: Form(
//           key: _formKey,
//           child:
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text("Sign up",style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                             ),),
//                             SizedBox(height: 20,),
//                             Text("Create an Account,Its free",style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.grey,
//                             ),),
//                             SizedBox(height: 30,)
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 40
//                           ),
//                           child: Column(
//                             children: [
//                               makeInput(label:"Email"),
//                               makeInput(label:"Password",obsureText:true),
//                               makeInput(label:"Confirm Password",obsureText:true),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 40),
//                           child: Container(
//                             padding: EdgeInsets.only(top:3,left: 3),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(40),
//                                 border: Border(
//                                   bottom: BorderSide(color: Colors.black),
//                                   top: BorderSide(color: Colors.black),
//                                   right: BorderSide(color: Colors.black),
//                                   left: BorderSide(color: Colors.black),
//                                 )
//                             ),
//                             child: MaterialButton(
//                               minWidth: double.infinity,
//                               height: 60,
//                               onPressed:  _signupClick,
//                               color: Colors.deepOrange,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(40)
//                               ),
//                               child: Text("Sign-Up",style: TextStyle(
//                                 fontWeight: FontWeight.w600,fontSize: 16,
//                               ),),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Already have an account?"),
//                             Text("Login",style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 18
//                             ),),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//       ),
//     );
//   }
//   Widget makeInput({label,obsureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,style:TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color: Colors.black87
//         ),),
//         SizedBox(height: 5,),
//         TextFormField(
//           validator: (value) {
//             if(value!.isEmpty) {
//               return 'Please enter an value.';
//             }
//             return null;
//           },
//           onChanged: (text) {
//             if(label=='Email') {
//               setState(() {
//                 _username=text;
//               });
//             }
//             else if(label=='Password') {
//               setState(() {
//                 _password=text;
//               });
//             }
//           },
//           obscureText: obsureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
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
