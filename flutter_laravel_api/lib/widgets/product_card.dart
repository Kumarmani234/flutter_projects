import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';
import '../widgets/star_rating.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.product,
    required ProductPressedCallback onProductPressed,
  }) : _onPressed = onProductPressed;

  final Product product;

  final ProductPressedCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () => _onPressed(product),
      splashColor: Colors.blue.withAlpha(30),
      child: Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'restaurant-image-${product.id}',
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.productimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          (product.productname),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        '540.78' + ' \$',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, (kIsWeb ? 0 : 2), 0, 4),
                    alignment: Alignment.bottomLeft,
                    child: StaticStarRating(
                      rating: double.parse('4.6'
                          .toString()), /*product.productId),*/
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${540} ● ${87}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
