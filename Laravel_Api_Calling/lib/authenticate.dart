import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:laravel_api_calling/model/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authentication {
  get allProducts => null;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }




  Future<Map<String, dynamic>> login(String email, String password) async {
    print('i am login page');
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/login');
    final response = await http.post(apiUrl, body: {
      'email': email,
      'password': password,
    });

    final parsedResponse = jsonDecode(response.body);
    print('i am response :'+parsedResponse['status']);
    //print('i am token :'+parsedResponse['authorisation']['token']);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', parsedResponse['authorisation']['token']);
    return parsedResponse;
  }

  Future<Map<String, dynamic>> signUp(String name, String email,
      String password) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/register');
    final response = await http.post(apiUrl, body: {
      'name': name,
      'email': email,
      'password': password,
    });
    final parsedResponse = jsonDecode(response.body);
    print('I am register response:$parsedResponse');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', parsedResponse['authorisation']['token']);
    return parsedResponse;
  }





  Future<List<dynamic>> getProductToken(String token) async {
    print('i am in get products details');
    print('i am the token: '+ token);
    //var token=await _getToken();
    //var productUrl='https://10.0.2.2:8000/api/product';
    final response = await http.get(Uri.parse('https://10.0.2.2:8000/api/Products'),
        headers: {'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'});
    print('I am in products:$response');

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  void dispose() {}
  Future<List<Product>> getProductDetails() async{
    var token=await _getToken();
    final products = await getProductToken(token);
    final List<Product> parsedProducts = List<Product>.from(
        products.map((product) => Product.fromJson(product as Map<String, dynamic>)));
    return parsedProducts;
    }
  }
