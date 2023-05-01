
import 'package:flutter/material.dart';

import '../Data/cart_provider.dart';
import '../model/cart.dart';
class CartPage extends StatefulWidget {
  final String userId;
  const CartPage({required this.userId}) ;

  @override

  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirestoreCartProvider _firestoreCartProvider= FirestoreCartProvider();
  @override
  void initState(){
    print(widget.userId);
    print("omshankar is a good boy");
    _firestoreCartProvider.getCartItemsByUID(widget.userId);
    print("after id");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopping cart"),
      ),
      body:
      StreamBuilder<List<Cart>>(
        stream: _firestoreCartProvider.allCart,
        builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          print('okkkkk-1');
          print(snapshot);
          final List<Cart> cartList = snapshot.data ?? [];
          //print('iam cartList'+cartList.toString());
          if (cartList.isEmpty) {
            return Center(
              child: Text('No items in cart'),
            );
          }
          return ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              final cart = cartList[index];
              return ListTile(
                title: Text(cart.productId),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () async {

                  },
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:50.0 ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total \$50.00"),
              ElevatedButton(
                child:Text("checkout"),
                  onPressed:(){

                  }
              )
            ],
          ),

        ),
      ),
    );
  }
}
