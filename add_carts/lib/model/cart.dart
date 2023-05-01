import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

typedef CartPressedCallback= void Function (Cart cart);
typedef ClosePressedCallback= void Function ();

 class Cart{
   late final String productId;
   late final String UID;
   late final String cartId;


    Cart._({
      required  this.productId,
      required  this.UID,
      required  this.cartId,

 });
    factory Cart.fetchfirebaseCollectionAnyDocumentData(DocumentSnapshot snapshot){
      final _snapshot =snapshot.data() as  Map<String ,dynamic>;
      print(_snapshot);
      print(_snapshot['cartId']);
      return Cart._(
        productId: _snapshot['productId'],
        UID: _snapshot['UID'],
        cartId: _snapshot['cartId'],
      );
    }
 }