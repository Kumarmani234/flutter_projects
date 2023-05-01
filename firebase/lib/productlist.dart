import 'package:firebase/main.dart';
import 'package:firebase/model/product.dart';
import 'package:firebase/widgets/product_grid.dart';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'data/products_provider.dart';


// import 'authentication.dart';
// import 'main.dart';


class ProductListPage extends StatefulWidget {
  final String title;
  const ProductListPage({required this.title});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _isLoading = true;
  FirestoreProductsProvider _firebaseProductsProvider = FirestoreProductsProvider();
  @override
  void initState(){
    _firebaseProductsProvider.loadAllProducts();
    _isLoading = false;
    super.initState();
  }
  @override
  void dispose(){
    _firebaseProductsProvider.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: _firebaseProductsProvider.allProducts,
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot)
        {
          final _products =snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Pay-G E-commerce'),
              bottom: PreferredSize(
                preferredSize: Size(320,48),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
                  child: Text('Fliter widget appears here..'
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
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Products List'),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () async{
                      await SessionManager().destroy();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Pay-G VMS!')));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Logged out successfully! ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ));


                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: _isLoading
                      ?CircularProgressIndicator()
                      :_products.isNotEmpty
                      ?
                  ProductGrid(
                    products: _products,
                    onProductPressed: (product){
                      print('krjhfkrhfkjhfkeyhfi');
                    },
                  )
                      :Text('No data to display')
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
