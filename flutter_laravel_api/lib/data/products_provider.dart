
import 'dart:async';
import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

// import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product.dart';

abstract class ProductsProvider {
  Stream<List<Product>> get allProducts;

  void loadAllProducts();

  void dispose();
}

class FirestoreProductsProvider implements ProductsProvider {
  FirestoreProductsProvider() {
    allProducts = _allProductsController.stream;
  }

  final StreamController<List<Product>> _allProductsController =
      StreamController();

  @override
  late final Stream<List<Product>> allProducts;



  @override
  void loadAllProducts() async {


    dynamic _auth = SessionManager().get("Accesstoken");
print('Token pls->');

    _auth!.then( (r) async {
      if(r != null) {


    print(r);

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/Products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $r'
      },

    );


    print('pls check this-222>');
    print(json.decode(response.body));

    if (response.statusCode == 200) {
     final List<dynamic> _products =json.decode(response.body)['Products'] as List<dynamic>;//.toList();;

print(_products);


      final _prodList = _products.map((dynamic doc) {
        return Product.fetchProductData(doc);
      }).toList();

      _allProductsController.add(_prodList);

    }

      }
    });

  }
  void dispose() {
    _allProductsController.close();
  }


}
