import 'package:approval_system/Models/Guest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../Authantication.dart';
import '../main.dart';

class GuestListPage extends StatefulWidget {
  final String title;
  const GuestListPage({super.key, required this.title});

  @override
  State<GuestListPage> createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
  bool _isLoading = true;
  final Authentication _authentication=Authentication();
  @override
  void initState(){
    _authentication.getGuestDetails();
    _isLoading = false;
    super.initState();
  }
  @override
  void dispose(){
    _authentication.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Guest>>(
        stream: _authentication.allProducts,
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Guest>> snapshot)
        {
          final _products =snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title:  Text(widget.title),
              bottom: const PreferredSize(
                preferredSize: Size(320,48),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
                  child: Text('Guests List Appear Here'
                  ),
                ),
              ),
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
                    title: const Text('Guests List'),
                    onTap: ()async{
                      await _authentication.getGuestDetails();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Home Page')));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('guests list appere here! ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    },
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
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
