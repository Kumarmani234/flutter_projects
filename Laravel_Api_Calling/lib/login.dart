import 'package:flutter/material.dart';
import 'package:laravel_api_calling/authenticate.dart';
import 'package:laravel_api_calling/main.dart';
import 'package:laravel_api_calling/productlist.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({required this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  Authentication authentication=Authentication();
  // authentication.kumar;
  void _submit() async {


    setState(() {
      //print('I am kumar:');
      //print(authentication);
      _isLoading = true;

    });
    final email = _emailController.text;
    final password = _passwordController.text;
    final response = await Authentication().login(email, password);
    // var Token=response['authorisation']['token'];
    // print('kumar:'+Token);
    setState(() {
      _isLoading = false;
    });
    // print("Kumar-"+response.containsKey('token').toString());
    // print(response['status']);
    if (response['status']!='success') {
      Navigator.pushReplacement(context,
          MaterialPageRoute (builder: (context) =>
              MyHomePage(title: 'Shopping Home Page')));
      // Authentication succeeded, save the token to your app's state or storage
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login successfully!',
          style: TextStyle(fontSize: 16),
        ),
      ));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>
              ProductListPage(title:('Products Screen'))));
      // Authentication failed, show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}