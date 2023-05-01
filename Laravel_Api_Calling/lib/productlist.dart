import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:laravel_api_calling/authenticate.dart';
import 'package:laravel_api_calling/model/Product.dart';
import 'main.dart';
class ProductListPage extends StatefulWidget {
  final String title;
  const ProductListPage({super.key, required this.title});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _isLoading = true;
  final Authentication _authentication=Authentication();
  @override
  void initState(){
    _authentication.getProductDetails();
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
    return StreamBuilder<List<Product>>(
        stream: _authentication.allProducts,
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot)
        {
          final _products =snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title:  Text(widget.title),
              bottom: const PreferredSize(
                preferredSize: Size(320,48),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
                  child: Text('Products List Appear Here'
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
                    title: const Text('Products List'),
                    onTap: ()async{
                      await _authentication.getProductDetails();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Shopping Home Page')));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('products list appere here! ',
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
                          MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Shopping Home Page')));
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
