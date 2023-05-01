import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/Guest.dart';


class Authentication {
  get allProducts => null;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }



  Future<Map<String, dynamic>> login(String email, String password,String role) async {
    print('i am login page');
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/login');
    final response = await http.post(apiUrl, body: {
      'email': email,
      'password': password,
      'role':role ,
    });
    final parsedResponse = jsonDecode(response.body);
    print('i am response :'+parsedResponse['status']);
    //print('i am token :'+parsedResponse['authorisation']['token']);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', parsedResponse['authorisation']['token']);
    return parsedResponse;
  }



  Future<Map<String, dynamic>> signUp(String name, String email,
      String password,String role) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/register');
    final response = await http.post(apiUrl, body: {
      'name': name,
      'email': email,
      'password': password,
      'role':role,

    });
    final parsedResponse = jsonDecode(response.body);
    print('I am register response:$parsedResponse');
    print(parsedResponse['status']);

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    localStorage.setString('token', parsedResponse['authorisation']['token']);

    localStorage.setString('status', parsedResponse['status']);

    return parsedResponse;
  }



  Future<Map<String, dynamic>> Addguest(String guestName, String purpose_of_visit,
      String address,String image,String assigned_to) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print('mytoken:$token');
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/Guests');
    final response = await http.post(apiUrl,
      body: {
      'guestName': guestName,
      'purpose_of_visit': purpose_of_visit,
      'address': address,
      'image':image,
      'assigned_to':assigned_to,
      },
    headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    },
    );
    final parsedResponse = jsonDecode(response.body);
    print('I am register response:$parsedResponse');
    print(parsedResponse['status']);

    return parsedResponse;
  }




  Future<Map> getGuestToken(token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print('i am in get guests details');
    print('i am the token: '+ token.toString());
    final apiUrl = Uri.parse('http://10.0.2.2:8000/api/Guests');
    final response = await http.get(apiUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'});
    print('I am in guests:$response');
    print('i am in response'+response.statusCode.toString());
    if (response.statusCode == 200) {
      print('i am in response'+response.statusCode.toString());
      final Map<dynamic,dynamic> guestsJson = jsonDecode(response.body);
      print('i am guestjson'+guestsJson.toString());
      return guestsJson;
    } else {
      throw Exception('Failed to fetch guests');
    }
  }

  void dispose() {}

  Future<Map> getGuestDetails() async{
    var token=await _getToken();
    final guests = await getGuestToken(token);
    print('get details:$guests');
    return guests;
  }

}