import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protection_management_project/src/features/auth_manager/models/user_model.dart';

class ProfilController {
  final _auth = FirebaseAuth.instance;
  final _bd = FirebaseFirestore.instance;
  late UserModel _userModel;

  // verified user state
  Future<UserModel?> getUserInformation() async {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        String uid = user.uid;
        final userRef = _bd.collection("user").doc(uid);

        userRef.get().then((DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          _userModel = UserModel(
              uid: uid,
              email: user.email,
              compte: data['compte'],
              nom: data['nom'],
              prenom: data['prenom'],
              jokers: data['jokers']);

          return _userModel;

        }, onError: (e) {
          debugPrint("Erreur: ${e.toString()}");
        });
      }
    });

    return null;
  }
}
