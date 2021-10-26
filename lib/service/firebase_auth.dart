import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> register(String userEmail, String userPassword) async {
    bool isDone = false;
    try {
      isDone = await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword)
          .then((value) async {
        return await value != null ? true : false;
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return isDone;
  }

  Future<bool> logIn(String userEmail, String userPassword) async {
    bool isDone = false;
    try {
      isDone = await _firebaseAuth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword)
          .then((value) async {
        return await value != null ? true : false;
        debugPrint("Giriş Yapıldı");
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return isDone;
  }
}
