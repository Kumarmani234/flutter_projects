import 'dart:convert';
import 'package:api_calling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late Future<List<User>> listUsers;
  @override
  void initState() {
    super.initState();
    listUsers=fetchUsers();
  }
  Future<List<User>> fetchUsers() async {
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode == 200) {
      var getUserData=json.decode(response.body) as List;
      var listUsers=getUserData.map((i)=>User.fromJSON(i)).toList();
      return listUsers;
    }
    else {
      throw Exception('Failed to load users');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>> (
        future: listUsers,
        builder: (context,snapshot) {
          if(snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  var user = (snapshot.data as List<User>)[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(user.email),
                        SizedBox(height: 5),
                        Text(user.address.street +
                            " " +
                            user.address.suite +
                            " " +
                            user.address.city +
                            " " +
                            user.address.zipcode),
                        SizedBox(height: 5),
                        Text(user.phone),
                        SizedBox(height: 5),
                        Text(user.website),
                        SizedBox(height: 5),
                        Text(user.company.catchPhrase),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: (snapshot.data as List<User>).length);
          }
          else if (snapshot.hasError) {
            return Center(
            child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyanAccent,
            ),
          );
        },
      )
    );
  }
}
