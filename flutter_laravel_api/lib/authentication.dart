import 'dart:convert';


import 'package:http/http.dart' as http;



class AuthenticationHelper {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp(
      {required String email, required String password}) async {
    try {
      // await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // return  _auth;

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'ommmmmmm',
          'email': email,
          'password': password
        }),
      );


      print('pls check this-111>');
      print(response);
      if (response.statusCode == 200) {
        //var res = json.decode(response.body) as Object;
        print('pls check this222->');
        print(json.decode(response.body)['status']);
        // jsonDecode(result.body)['results'];
        // var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
        //return listUsers;

        if(json.decode(response.body)['status'] == 'success') {
          return json.decode(response.body);
        }
        else
        {
          return null;
        }
      }
      else {
        throw Exception('Failed to load users');
      }
    }catch(e){
      return e;
    }
    // on FirebaseAuthException catch (e) {
    //   return e.message.toString();
    // }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      /* await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'OK'; //_auth.currentUser?.email;
   */


      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{

          'email': email,
          'password': password
        }),
      );

      /*final response =
      await http.post(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      */
      print('pls check this-frm api response>');
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        //var res = json.decode(response.body) as Object;
        print('pls check this222->');
        print(json.decode(response.body)['status']);
        // jsonDecode(result.body)['results'];
        // var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
        //return listUsers;

        if(json.decode(response.body)['status'] == 'success') {
          return json.decode(response.body);
        }
        else
        {
          return null;
        }
      }
      else {
        throw Exception('Failed to load users');
      }
    }catch(e){
      return e;
    }

    // on FirebaseAuthException catch (e) {
    //   return e.message;
    // }


    //SIGN OUT METHOD
    // Future signOut() async {
    //   await _auth.signOut();
    //
    //   print('signout');
    // }
  }

  Future signOut() async {
    //await _auth.signOut();

    print('signout');
    }

}
