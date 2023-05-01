
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'Authantication.dart';
import 'Login.dart';
import 'main.dart';


class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({required this.title});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey=GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _dropdownValue ;



  Authentication authentication=Authentication();

  void _submit() async {

    setState(() {
    });

    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final role=_dropdownValue;


    if(_formKey.currentState!.validate()){}

    final response = await Authentication().signUp(name, email, password,role);
    print(response['status']);
    // setState(() {
    //
    //   _isLoading = false;
    //
    // });
    if(response['status']=='success') {

      setState(() {
        if(authentication==null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute (builder: (context) =>
                  MyHomePage(title: 'Home Page')));
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
                  LoginPage(title:'Log-In Page')));
        }
      });
    }
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),


        body: Form(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/signup.jpeg'),
                TextFormField(
                  validator: (value) {
                    // add your custom validation here.
                    if (value==null||value.isEmpty ) {
                      return 'Please enter name';
                    }
                    else if(value.length <4 ){
                      return 'Must be greater than 4 characters';
                    }else if(value.length >20){
                      return 'Must be less than 20 characters';
                    }
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                      ),
                      labelText: ' Name'),
                ),
                SizedBox(height: 10,),

                TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty  ){
                        return 'please enter email';
                      }//else if(!value.contains('@'||'.com')){
                      //   return 'please enter @';
                      // }
                      else if(!value.contains('@')){
                        return 'please enter @';
                      }
                      else if(!value.contains('.com')){
                        return 'please enter .com';
                      }
                      return null;
                    },
                    controller: _emailController,

                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                        ),
                        labelText: ' Email'),
                    ),

                SizedBox(height: 10,),
                TextFormField(
                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          'Password should contain Capital, small letter & Number & Special Characters')
                    ]),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      enabledBorder: OutlineInputBorder(
                      ),
                      labelText: 'Password',
                    ),
                ),


    const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'admin',
                      child: Text('admin'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'super_admin',
                      child: Text('super_admin'),
                    ),
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    labelText: 'Role',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your role';
                    }
                    return null;
                  },
                ),


                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                    _submit();
                  },
                  child: Text('Sign-In'),
                ),
              ],
            ),
            ),
        );

    }
}
