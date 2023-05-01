import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    print('kumarrrr');
    return Scaffold(
      appBar: AppBar(title: Text("Cart Screen")),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
        ],
      ),
    );
  }
}