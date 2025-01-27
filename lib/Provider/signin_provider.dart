import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Constant/firebas_const.dart';
import 'package:feedonations/Constant/snackbar.dart';
import 'package:feedonations/Routes/routes.dart';
import 'package:feedonations/screen/app_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/bottom_navigation.dart';

class SignInProviderAuth with ChangeNotifier {
  UserCredential? userCredential;
  bool loading = false;

  void signInValidation(
      {required TextEditingController email,
      required TextEditingController password,
      String? uid,
      required BuildContext context}) async {
    loading = true;
    notifyListeners();
    if (email.text.isEmpty || password.text.isEmpty) {
      AppSnackBar.snackBar(context, "Fill all the Details");
      loading = false;
      notifyListeners();
    } else {
      try {
        loading = true;
        notifyListeners();
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        FirebaseAuth.instance.currentUser;
        final userCollection = FirebaseFirestore.instance.collection(USERS);
        QuerySnapshot querySnapshot =
            await userCollection.where(UID, isEqualTo: uid).get();
        if (querySnapshot.docs.isEmpty) {
        } else if (querySnapshot.docs.isNotEmpty) {
          AppSnackBar.snackBar(context, "Welcome");
        }

        loading = false;
        notifyListeners();
        RoutingPage.gotoNextPageP(context: context, gotoNextPagep: AppNavBar());
      } on FirebaseException catch (e) {
        if (e.message != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
          ));
          loading = false;
          notifyListeners();
        }
      }
    }
  }
}
