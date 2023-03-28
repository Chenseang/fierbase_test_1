import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_1/home/home_screen.dart';
import 'package:firebase_test_1/home/login_screen.dart';
import 'package:flutter/material.dart';

class AuthService {
  //1.handleAuthState()

  //2.siginWithGoogle()
  //3.signOut()

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }


  //3.signOut

  signOut(){
    FirebaseAuth.instance.signOut();
  }
}
