import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product_card.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<dynamic> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    var response =
    await http.get(Uri.parse('http://10.0.2.2.8000/api/Products'));
    if (response.statusCode == 200) {
      setState(() {
        _products = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: _products[index]);
      },
    );
  }
}
