import 'package:approval_system/newOne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GuestList.dart';

class SuperAdmin extends StatefulWidget {
  const SuperAdmin({Key? key, required String title}) : super(key: key);

  @override
  State<SuperAdmin> createState() => _SuperAdmin();
}


class _SuperAdmin extends State<SuperAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Admin Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/approve.jpeg'),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GuestListPage(title: "Approve Guest",)));
              },
              child: Text('Approve Guest'),
            ),
          ],
        ),
      ),
    );
  }
}

