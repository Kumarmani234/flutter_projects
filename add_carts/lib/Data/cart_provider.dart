

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cart.dart';

abstract  class CartProvider {
  Stream<List<Cart>> get allCart;
  void getCartItemsByUID( String  userId);
  void AddCartItems(String prodId,String uid, String cId);
  void dispose();
}
class FirestoreCartProvider implements CartProvider{
   FirestoreCartProvider(){
     allCart= _allCartController.stream;
   }
   final StreamController<List<Cart>> _allCartController=StreamController();

   @override

   late final Stream<List<Cart>> allCart;
   @override
  Future <void> AddCartItems(String prodId,String uid,String cId){
     final _carts= FirebaseFirestore.instance.collection('CartList');
     print("omshankar this is AddCartItems" );

     return _carts.add({
       'UID':uid,
       'productId':prodId,
       'cartId':cId,
     });
   }
   @override
  void getCartItemsByUID(String userId){
      print(userId);
      final _queruSnapshot = FirebaseFirestore.instance
          .collection('CartList')
          .where('UID',isEqualTo:userId)
          .limit(100)
          .snapshots();

      _queruSnapshot.listen((event){
        final _cart = event.docs.map((DocumentSnapshot doc){
          print(doc);
          return Cart.fetchfirebaseCollectionAnyDocumentData(doc);
     }).toList();
        _allCartController.add(_cart);
     });
   }

   @override
   void dispose(){
     _allCartController.close();
   }


}