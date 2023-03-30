import 'package:get/get.dart';
import 'package:flutter_pkm_sw/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices extends GetxController {
  final isLogged = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object Based on Firebase User
  UserData _userFromFirebaseUser(User user) {
    return UserData(uid: user.uid);
  }

  // Sign In Anonymous User
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      isLogged.value = true;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Sign Out User
  void logOut() {
    isLogged.value = false;
  }
}
