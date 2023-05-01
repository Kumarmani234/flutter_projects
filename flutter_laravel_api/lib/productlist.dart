import 'package:flutter/material.dart';
import 'package:flutter_laravel_api/widgets/product_grid.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'data/products_provider.dart';
import 'main.dart';
import 'model/product.dart';



class ProductListPage extends StatefulWidget {
  final String title;
  const ProductListPage({ required this.title});

  //AuthenticationHelper AHelper = AuthenticationHelper();

  @override
  State<ProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<ProductListPage> {
  bool _isLoading = true;
  FirestoreProductsProvider _firestoreProductsProvider= FirestoreProductsProvider();
  late List<Product> _products;

  @override
  void initState() {
    _firestoreProductsProvider.loadAllProducts();
    _isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    _firestoreProductsProvider.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return StreamBuilder<List<Product>>  (
        stream: _firestoreProductsProvider.allProducts,
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          final _products = snapshot.data!;
          return Scaffold(
            appBar: AppBar(

              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              /*title: Text(widget.title),*/
              title: Text('Products Screen'),
              bottom: PreferredSize(
                preferredSize: Size(320, 48),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
                  child: Text('Products Appears Here....'

                  ),
                ),
              ),


            ),
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Products List'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () async {
                      // Update the state of the app.
                      await SessionManager().destroy();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyHomePage(title: 'ScoriaIT - VMS !')));


                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Logged Out Successfully! ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                      // ...
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Container(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                  constraints: BoxConstraints(maxWidth: 900),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : _products.isNotEmpty
                      ?
                  ProductGrid(
                    products: _products,
                    onProductPressed: (product) {
                      print('sdfsdfsdfdsfdsfsd');
                      /*Navigator.pushNamed(
                        context,
                        ProductPage.route,
                        arguments: ProductPageArguments(product),
                      );*/
                    },
                  )

                      :Text('No data to display..')
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
          });
    }


}
