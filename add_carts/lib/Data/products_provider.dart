import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product.dart';


abstract class ProductsProvider{
  Stream<List<Product>> get allProducts;
  void loadAllProducts();
  void dispose();
}
class FireStoreProductsProvider implements ProductsProvider{
  FireStoreProductsProvider(){
    allProducts=_allProductsController.stream;

  }
  final StreamController<List<Product>> _allProductsController=StreamController();
  @override
  late final Stream<List<Product>> allProducts;
  @override
  void loadAllProducts(){
    final _querySnapshot=FirebaseFirestore.instance.collection('Product').orderBy('productId',descending: true).limit(100).snapshots();
    _querySnapshot.listen((event) {
      final _products=event.docs.map((DocumentSnapshot doc)
      {
        return Product.fetchfirebaseCollectionAnyDocumentData(doc);
      }).toList();
      _allProductsController.add(_products);
    });
  }

  void dispose(){
    _allProductsController.close();
  }

}