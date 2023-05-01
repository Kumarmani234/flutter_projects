import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Dynamic(),
    );
  }
}
class Dynamic extends StatelessWidget {
     Dynamic({Key? key}) : super(key: key);
  List<String> products =["Smartphone","Laptop","Smart Watch","Smart TV","Tablet","fan","Shoes","Shirt","Pant","T-shirt","Belt","bag"];
  List<String> productDetails=["Oppo","Lenovo","Noise","Mi","Samsung","Polar","Adidas","U.S Polo","Dennis lingo","Normal brand","NB","Lenovo"];
  List<String> price=["15000","45000","3500","75000","7000","3000","5000","2500","3500","500","400","2000"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scrollbar(
          child:ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context,int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:Colors.black,
                  child: Text(products[index][0]),
                ),
                title: Text(products[index]),
                subtitle: Text(productDetails[index]),
                trailing: Text(price[index].toString()),
                onTap: (){},
              );
            },
          ),
        ),
      ),
    );
  }
}

