import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

//-----------end class ----------------
}
