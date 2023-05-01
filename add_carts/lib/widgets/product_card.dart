import 'package:add_carts/widgets/star_rating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../Data/cart_provider.dart';
import '../model/product.dart';
class ProductCard extends StatelessWidget {

  ProductCard({
    required this.product,
    required ProductPressedCallback onProductPressed,

  }):_onPressed= onProductPressed;

  final  Product product;
  final ProductPressedCallback _onPressed;
  FirestoreCartProvider _firestoreCartProvider= FirestoreCartProvider();
  late  String uid;
  var uuid= Uuid();
  late String cartId= uuid.v4();


  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(user == null){
        print('Prod_card user is currently signed out');
      }   else{
        late final un= user.email;
        late final UID =user.uid;
        uid=user.uid;
      }
    });

    return Card(
        child: InkWell(
            onTap: ()=>_onPressed(product),
            splashColor: Colors.blue.withAlpha(30),
            child: Container(
              height: 250,
              child: Column(
                children:<Widget> [
                  Expanded(
                    child: Hero(
                      tag: 'restaurent-image-${product.productId}',
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            image:DecorationImage(
                              image: NetworkImage(product.productImageName!),
                              fit:BoxFit.cover,)


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
                          children:<Widget> [
                            Expanded(
                              child: Text(
                                (product.productName),style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              product.unitPrice.toString()+'\$',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, (kIsWeb?0:2), 0, 4),
                          alignment: Alignment.bottomLeft,
                          child: StaticStarRating(
                            rating:double.parse(product.productRating.toString()),

                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${product.unitPrice}${product.inStock}',style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 100,
                          child: ElevatedButton(style: ElevatedButton.styleFrom(
                            primary: Colors.cyan.shade400,
                          ),
                              onPressed:(){
                                _firestoreCartProvider.AddCartItems(product.productId,uid,cartId);
                              },
                              child: const Text("Add To Cart",
                                style: TextStyle(
                                    fontSize: 10
                                ),)
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
