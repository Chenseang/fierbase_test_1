import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_1/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../local_storage/local_storage.dart';

class FirebaseAuthentication {
  final _localStorage = LocalStorage();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser {
    return _firebaseAuth.currentUser;
  }

  Future<void> createAccountWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint('-------Firebase SingIm Errore--${e.code}');
    } catch (e) {
      debugPrint('------Erorr$e');
    }
  }

  Future<bool> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('Sigin-------Erorre${e.code}');
    } catch (e) {
      debugPrint('--------Error Sign:$e');
    }
    return false;
  }

  Future<bool> verifyPhoneNumber({required String phonenumber}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+85511859533",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          debugPrint("completed");
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          debugPrint("error :$error");
        },
        codeSent: (verificationId, forceResendingToken) {
          debugPrint("code sent : $verificationId and $forceResendingToken");
        },
        codeAutoRetrievalTimeout: (verificationId) {
          debugPrint("timeout $verificationId");
        },
      );

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('Sigin-------Erorre${e.code}');
    } catch (e) {
      debugPrint('--------Error Sign:$e');
    }
    return false;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
    ).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
    // Once signed in, return the UserCredential
  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token??'');

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
//-----------end class ----------------
}
