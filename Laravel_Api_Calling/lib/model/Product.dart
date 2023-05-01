class Product {
  final String productname;
  final String productdescription;
  final String productimage;

  Product({required this.productname, required this.productdescription,required this.productimage});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productname: json['productname'],
      productdescription: json['productdescription'],
      productimage: json['productimage'],
    );
  }
}
