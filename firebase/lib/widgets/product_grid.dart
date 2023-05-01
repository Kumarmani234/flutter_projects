import 'package:firebase/model/product.dart';
import 'package:firebase/widgets/product_card.dart';

import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({
    required ProductPressedCallBack onProductPressed,
    required List<Product> products,
}) : _onProductPressed=onProductPressed,
     _products=products;

  final ProductPressedCallBack _onProductPressed;
  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      children: _products
        .map((product) =>
          ProductCard(
        product:product,
        onProductPressed: _onProductPressed,
      )).toList(),
    );
  }
}
