

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/product.dart';

abstract class ProductsProvider {
  Stream<List<Product>> get allProducts;

  void loadAllProducts();
  void dispose();
}
class FirestoreProductsProvider implements ProductsProvider {
  FirestoreProductsProvider() {
    allProducts=_allProductsController.stream;
  }
final StreamController<List<Product>> _allProductsController=
    StreamController();
@override
late final Stream<List<Product>> allProducts;
@override
void loadAllProducts() {
  final _querySnapshot = FirebaseFirestore.instance
      .collection('Product')
      .orderBy('productId', descending: true)
      .limit(100)
      .snapshots();
  _querySnapshot.listen((event) {
    final _products = event.docs.map((DocumentSnapshot doc) {
      return Product.fetchfirebaseCollectionAnyDocumemtData(doc);
    }).toList();
    _allProductsController.add(_products);
  });
}
void dispose() {
  _allProductsController.close();
}
}
