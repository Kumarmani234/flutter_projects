import 'package:add_carts/widgets/authentication.dart';
import 'package:add_carts/widgets/cartlist.dart';
import 'package:add_carts/widgets/product_grid.dart';
import 'package:badges/badges.dart' as badges;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';



import 'data/products_provider.dart';
import 'data/cart_provider.dart';
import 'main.dart';
import 'model/product.dart';
import 'model/cart.dart';
import 'package:badges/badges.dart' as badges;


class ProductListPage extends StatefulWidget {
  late String title='';
  late String useremail='';
  late String UID='';
  var uuid = Uuid();
  ProductListPage({required this.title, required this.useremail, required this.UID});
  @override
  State<ProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState  extends State<ProductListPage> {
  bool _isLoading = true;
  FireStoreProductsProvider _firestoreProductsProvider = FireStoreProductsProvider();
  AuthenticationaHelper AHelper = AuthenticationaHelper();
  FirestoreCartProvider _firestoreCartProvider = FirestoreCartProvider();
  @override
  void initState() {
    _firestoreProductsProvider.loadAllProducts();
    _isLoading = false;
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('PL-User is currently signed out');
      } else{
        late final un=user.email;
        late final UID=user.uid;
        print('XXX-PL-User is signed in!');
        print(user.uid);
        _firestoreCartProvider.getCartItemsByUID(user.uid);
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _firestoreProductsProvider.dispose();
    super.dispose();
  }
  void _logout() async {
    await AHelper
        .signout()
        .then((result) {
      print(result);
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>> (
        stream: _firestoreProductsProvider.allProducts,
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          final _products = snapshot.data!;
          print('All IMP-1-->');
          print(_products);
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                badges.Badge(
                  badgeContent: StreamBuilder<List<Cart>>(
                    stream: _firestoreCartProvider.allCart,
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
                      final _carts = snapshot.data!;
                      print('All IMP-2-->');
                      print(_carts);
                      return Text(
                        _carts.length.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartPage(userId: widget.UID,)));
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(320, 48),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 4),
                  child: Text('Filter Widget Appears Here...'
                  ),
                ),
              ),
            ),
            body: Center(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : _products.isNotEmpty
                      ?
                  ProductGrid(
                    products: _products,
                    onProductPressed: (product) {
                      //print('sdffjfhlkjkhughfhj');
                    },
                  )
                      :Text('No data to display..')
              ),
            ),

            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      accountName: Text(
                        widget.useremail.split('@')[0].toString(),
                        style: TextStyle(fontSize: 10),
                      ),
                      accountEmail: Text(widget.useremail),
                      currentAccountPictureSize: Size.square(50),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 165, 255, 137),
                        child: Text(
                          widget.useremail.split('@')[0][0].toUpperCase(),
                          style: TextStyle(fontSize: 30.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('My Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('My Cart - 12'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text('Go Premium'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_label),
                    title: const Text('Saved Videos'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Edit Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      _logout();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              MyApp()));
                    },
                  ),
                ],
              ),
            ),

            // floatingActionButton: FloatingActionButton(
            // onPressed: (
            // }){},
            //   tooltip: 'Increment',
            //   child: const Icon(Icons.add),
            // ),
          );
          });
   }
}
