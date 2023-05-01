import 'package:cloud_firestore/cloud_firestore.dart';

typedef ProductPressedCallback = void Function(Product prod);

typedef CloseProductPressedCallback = void Function();


 class Product {
   late final  String productId;
   late final  String productName;
   late final  int unitPrice;
   late final  int inStock;
   late final  String productshortDesc;
   late final  String productImageName;
   late final  int productRating;


   Product._({
     required this.productId,
  this.productName="",
     this.unitPrice=0,
      this.inStock=0,
      this.productshortDesc="",
      this.productImageName="",
      this.productRating=0,

 });
   factory Product.fetchfirebaseCollectionAnyDocumentData(DocumentSnapshot snapshot){
     final _snapshot=snapshot.data() as Map<String,dynamic>;
     return Product._(
       productId: snapshot.id,
       productName: _snapshot['productName'],
       productshortDesc: _snapshot['productshortDesc'],
       productImageName: _snapshot['productImageName'],
       unitPrice: _snapshot['unitPrice'],
       inStock: _snapshot['inStock'],
       productRating: _snapshot['productRating'],
     );
   }

 }