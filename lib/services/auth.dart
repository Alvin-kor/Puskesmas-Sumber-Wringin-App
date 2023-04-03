import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pkm_sw/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices extends GetxController {
  final username = ''.obs;
  final password = ''.obs;
  final error = ''.obs;
  final switchField = false.obs;
  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  updateValue(type, value) {
    type == 'username' ? username(value) : password(value);
  }

  signIn(type) {
    if (type == 'Anonymous') {
      signInAnon();
    } else if (type == 'Next') {
      switchField.value = true;
    } else {
      username.toString() == 'pkmsw'
          ? username('$username@admin.com')
          : username('$username@gmail.com');
      signInEmailAndPassword();
    }
  }

  // Create User Object Based on Firebase User
  UserData? _userFromFirebaseUser(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  // Sign In Anonymous User
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      Get.snackbar('Login Success ', 'Login As Anonymous');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Sign In Email and Password
  Future signInEmailAndPassword() async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: username.toString(), password: password.toString());
      User user = result.user!;
      var nameUser = usernameEditController.text.split("@")[0] == 'pkmsw'
          ? 'Admin'
          : usernameEditController.text.split("@")[0];
      Get.snackbar('Login Success ', 'Login As $nameUser');
      switchField.value = false;
      usernameEditController.clear();
      passwordEditController.clear();
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
    }
  }

  Stream<UserData?> get userData {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign Out User
  Future logOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
