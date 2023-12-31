import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  //sign user 
  Future<UserCredential> signInWithEmailandPassword(String email, String password) async{
    try{
      UserCredential userCredential= 
      await _firebaseAuth.signInWithEmailAndPassword(
        email:email,
        password:password,
      );
      return userCredential;
    } on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }
  //create new user
  Future<UserCredential>signUpWithEmailandPassword(
    String email,password,
  ) async{
    try{
      UserCredential userCredential=
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseException catch (e){
      throw Exception(e.code);
    }
  }
  //deconnexion
  Future <void> signOut()async{
    return await FirebaseAuth.instance.signOut();
  }
}