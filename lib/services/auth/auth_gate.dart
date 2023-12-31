import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/pages/home_page.dart';
import 'package:messenger/services/auth/login_ou_inscription.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: ( context, snapshot) { 
          //user is logged
          if(snapshot.hasData){
            return const HomePage();
          }
          //user is NOT logged in
          else{
            return const LoginOuInscription();
          }
         },
      ),
    );
  }
}