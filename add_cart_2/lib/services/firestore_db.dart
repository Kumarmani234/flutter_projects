
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';



class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('carts');

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addToCart(Product product) async {

    //print('I am in add to cart method');
    final snapshot = await cartCollection.doc(product.name).get();

    if (snapshot.exists) {
      await cartCollection
          .doc(product.name)
          .update({'quantity': FieldValue.increment(1)});
    } else {
      await cartCollection.doc(product.name).set({
      'name': product.name,
      'imageUrl': product.imageUrl,
      'price': product.price,
      'quantity': 1,
      });
    }
    }

}