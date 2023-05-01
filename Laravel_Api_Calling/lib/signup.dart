import 'package:flutter/material.dart';
import 'package:laravel_api_calling/authenticate.dart';
import 'package:laravel_api_calling/login.dart';
import 'package:laravel_api_calling/main.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({required this.title});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  Authentication authentication=Authentication();

  void _submit() async {

    setState(() {
        _isLoading = true;
      if(authentication==null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute (builder: (context) =>
                LoginPage(title: 'Login Page')));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Registered user successfully!',
            style: TextStyle(fontSize: 16),
          ),
        ));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
                MyHomePage(title:'Shopping Home Page')));
      }
    });
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final response = await Authentication().signUp(name, email, password);
    setState(() {
      _isLoading = false;
    });
    if (response.containsKey('token')) {
      // Authentication succeeded, save the token to your app's state or storage
    } else {
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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
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
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}


