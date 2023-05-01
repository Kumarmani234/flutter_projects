import 'package:firebase/model/product.dart';
import 'package:firebase/widgets/star_rating.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.product,
    required ProductPressedCallBack onProductPressed
}) : _onPressed =onProductPressed;

  final Product product;
  final ProductPressedCallBack _onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: ()=> _onPressed(product),
        splashColor: Colors.blue.withAlpha(30),
        child: Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'restaurant-image-${product.productId}',
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.productImageName!),
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
                  children:<Widget>[
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            (product.productName),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        product.unitPrice.toString()+'\$',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0,(kIsWeb?0 :2),0,4),
                        alignment: Alignment.bottomLeft,
                        child:StaticStarRating(
                          rating:double.parse(product.productRating.toString()),
                        ),
                        ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,(kIsWeb?0 :2),0,4),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${product.unitPrice} ${product.inStock}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
