// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protection_management_project/src/commons/snackbar_widget.dart';
import 'package:protection_management_project/src/features/auth_manager/models/user_model.dart';

class SigninController {
  // create auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _bd = FirebaseFirestore.instance;
  int _jokers = -1;
  String _compte = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController mdpController = TextEditingController();

  // connction method
  Future<UserModel?> signIn(BuildContext context) async {
    try {
      UserCredential usercredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: mdpController.text,
      );

      if (usercredential.user != null) {
        // create references document
        final userRef = _bd.collection("user").doc(usercredential.user!.uid);

        userRef.get().then((DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          _jokers = data['jokers'];
          _compte = data['compte'];
        }, onError: (e) {
          debugPrint("Erreur: ${e.toString()}");
        });

        if (_jokers > -1 && _compte != "") {
          return UserModel(
              uid: usercredential.user!.uid,
              email: usercredential.user!.email,
              compte: _compte,
              jokers: _jokers);
        }
        else{
          SnackbarWidget(text: "Nous avons rencontrez une erreur!\nveuillez reessayer!").snackbarWidget(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        SnackbarWidget(
          text: "L'adresse mail ne correspond pas!",
        ).snackbarWidget(context);
      } else if (e.code == "invalid-credential") {
        SnackbarWidget(
          text: "L'utlisateur n'as pas ete trouve!",
        ).snackbarWidget(context);
      } else if (e.code == "network-request-failed") {
        SnackbarWidget(
          text: "Veuillez vous connectez a internet",
        );
      } else if (e.code == "wrong-password") {
        SnackbarWidget(
          text: "Mot de passe incorect",
        ).snackbarWidget(context);
      } else {
        SnackbarWidget(
          text: "Erreur: ${e.message}",
        ).snackbarWidget(context);
      }
    }
    return null;
  }

  void dispose() {
    emailController.dispose();
    mdpController.dispose();
  }
}
