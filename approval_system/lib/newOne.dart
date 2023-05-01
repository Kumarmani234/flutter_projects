// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Models/newModel.dart';
//
// class Home extends StatefulWidget {
//   final String title;
//   const Home({super.key, required this.title});
//   @override
//   State<StatefulWidget> createState() {
//     return HomeState();
//   }
// }
//
// class HomeState extends State<Home> {
//   late Future<List<User>> listUsers;
//   @override
//   void initState() {
//     super.initState();
//     listUsers=fetchUsers();
//   }
//   Future<List<User>> fetchUsers() async {
//     final response=await http.get(Uri.parse('http://10.0.2.2:8000/api/Guests'));
//     print('i am respone'+response.toString());
//     print('i am respone'+response.statusCode.toString());
//     if(response.statusCode == 500) {
//       var getUserData=jsonDecode(response.body) as List;
//       print(getUserData);
//       var listUsers=getUserData.map((i)=>User.fromJSON(i)).toList();
//       return listUsers;
//     }
//     else {
//       throw Exception('Failed to load users');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder<List<User>> (
//           future: listUsers,
//           builder: (context,snapshot) {
//             if(snapshot.hasData) {
//               return ListView.separated(
//                   itemBuilder: (context, index) {
//                     var user = (snapshot.data as List<User>)[index];
//                     return Container(
//                       padding: EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             user.guestName,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 22),
//                           ),
//                           SizedBox(height: 5),
//                           Text(user.purpose_of_visit),
//                           SizedBox(height: 5),
//                           Text(user.address),
//                           SizedBox(height: 5),
//                           Text(user.image),
//                           SizedBox(height: 5),
//                           Text(user.assigned_to),
//                         ],
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider();
//                   },
//                   itemCount: (snapshot.data as List<User>).length);
//             }
//             else if (snapshot.hasError) {
//               return Center(
//                 child: Text("${snapshot.error}"),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.cyanAccent,
//               ),
//             );
//           },
//         )
//     );
//   }
// }
