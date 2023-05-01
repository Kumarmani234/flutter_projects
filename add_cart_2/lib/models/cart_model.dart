import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  // Product's variables: name, price, imageUrl. All required.
  final String name;
  final double price;
  final String imageUrl;

  const Cart({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static Cart fromSnapshot(DocumentSnapshot snap) {
    Cart cart = Cart(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return cart;
  }
}