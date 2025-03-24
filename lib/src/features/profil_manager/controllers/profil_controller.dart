import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _bd = FirebaseFirestore.instance;

  var isLoading = true.obs;
  var userData = {}.obs;
  var userEmail = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    getUserEmail();
  }

  Future<void> fetchUserData() async {
    try {
      await Future.delayed(
          Duration(seconds: 2)); // Laisse Firebase se rafraîchir
      FirebaseAuth.instance.currentUser?.reload();
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _bd.collection('user').doc(user.uid).get();
        if (userDoc.exists) {
          userData.value = userDoc.data() as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getUserEmail() {
    User? user = _auth.currentUser;
    if (user != null) {
      userEmail.value = user.email ?? "Email non disponible";
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
    await Future.delayed(Duration(seconds: 1));
  }
}
