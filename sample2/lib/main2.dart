import 'package:flutter/material.dart';
//Sample program
// void main() {
//   print("Hi kumar");
// }



//Even number
// void main() {
//   var num=10;
//   if(num%2==0) {
//     print("$num is a even number");
//   }
//   else {
//     print("$num is not a even number");
//   }
// }



//Odd number
// void main() {
//   var num=5;
//   if(num%2!=0) {
//     print("$num is a odd number");
//   }
//   else {
//     print("$num is not a odd number");
//   }
// }



//Addition of numbers
// void main() {
//   int a=10,b=20,c;
//   c=a+b;
//   print("Total sum : $c");
// }



//Prime number
// void main() {
//   int num = 7;
//   for (int i = num; i>=1; i--) {
//
//     if (num%i!= 0 || num % 2 != 0) {
//       print("$num is  prime number ");
//     } else {
//       print("$num is not a prime number");
//     }
//     num=num-1;
//   }
// }



//
void main() {
  print("line1");
  display();
  print("line2");
}
Future<void>display() async{
  Future.delayed(Duration(seconds: 2),()=>print("print3"));
}
