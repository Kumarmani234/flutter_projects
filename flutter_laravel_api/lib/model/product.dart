// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import './values.dart';

typedef ProductPressedCallback = void Function(Product prod);

typedef CloseProductPressedCallback = void Function();

class Product {
 late final int id;
 late  final String productname;
 late final String productdescription;
 late  final String productimage;
 late final String created_at;
 late final String updated_at;



  Product._({
    required this.id,
    this.productname='',
    this.productdescription='',
    this.productimage='',
    this.created_at='',
    this.updated_at = '',
   // this.productRating=0

  });


 factory Product.fetchProductData(dynamic snapshot ) {
   final _snapshot = snapshot as Map<String, dynamic>;
   return Product._(
       id: _snapshot['id'],
     productname: _snapshot['productname'],
     productdescription: _snapshot['productdescription'],
     productimage:  _snapshot['productimage'],
     created_at: _snapshot['created_at'],
     updated_at:  _snapshot['updated_at'],

   );
 }

}
