import 'package:flutter/material.dart';
import 'package:laravel_api_calling/model/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.productimage),
          Text(product.productname),
          Text(product.productdescription),
        ],
      ),
    );
  }
}
