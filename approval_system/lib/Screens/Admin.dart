
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../main.dart';
import 'AddGuest.dart';

class Guest extends StatefulWidget {
  const Guest({Key? key, required String title}) : super(key: key);

  @override
  State<Guest> createState() => _GuestState();
}


class _GuestState extends State<Guest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async{
                await SessionManager().destroy();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Home Page')));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Logged out successfully! ',
                    style: TextStyle(fontSize: 16),
                  ),
                ));


              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
             children: [
               Image.asset('assets/guest.jpeg'),
               ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGuestForm(title: "Add Guest Form",)));
                 },
                 child: Text('Add Guest'),
               ),
             ],
        ),
      ),
    );
  }
}

