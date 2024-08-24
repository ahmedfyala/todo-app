import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  User? fireBaseAuthUser;
  UserModel? userModel;

  LoginProvider() {
    fireBaseAuthUser = FirebaseAuth.instance.currentUser;

    if (fireBaseAuthUser != null) {
      readUser();
    }
  }

  Future<void> readUser() async {
    await FirebaseFunctions.readUser();
    notifyListeners();
  }
}
