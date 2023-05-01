import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  get user=>_auth.currentUser;


  Future signup({required String email,required String password})async{

    try{
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return _auth;

    }
    on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future signin({required String email,required String password})async{

    try{
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return 'ok';

    }
    on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future signout()async{
    await _auth.signOut();
    }


}
