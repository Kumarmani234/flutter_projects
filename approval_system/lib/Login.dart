
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';


import 'Authantication.dart';
import 'Screens/SuperAdmin.dart';
import 'Screens/Admin.dart';



class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({required this.title});

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _formKey=GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _dropdownValue;

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
    final role = _dropdownValue;

    if(_formKey.currentState!.validate()){}

    final response = await Authentication().login(email, password,role);
    print('ytdcfuvyibunim');
    print(response['status']);
    // var Token=response['authorisation']['token'];
    // print('kumar:'+Token);
    setState(() {
      _isLoading = false;
    });
    // print("Kumar-"+response.containsKey('token').toString());
    // print(response['status']);
    if(response['status']=='success'){
      if (role=='admin') {
        print('hjbhbhjkbjnkl');
        Navigator.pushReplacement(context,
            MaterialPageRoute (builder: (context) =>
                Guest(title: 'Home Page')));
        // Authentication succeeded, save the token to your app's state or storage

      } else  if(role=='super_admin'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Login successfully!',
            style: TextStyle(fontSize: 16),
          ),
        ));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                SuperAdmin(title:(' Screen'))));
        // Authentication failed, show an error message
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login Failedd!',
          style: TextStyle(fontSize: 16),
        ),
      ));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(title:'Login Page',)));
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
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/login.png'),
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
                      Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', '  Password should contain Capital, small letter & Number & Special Characters')
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

                SizedBox(height: 10,),    const SizedBox(height: 16),
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
                  child: Text('Log-In'),
                ),
              ],
            ),
            ),
        );
    }
}