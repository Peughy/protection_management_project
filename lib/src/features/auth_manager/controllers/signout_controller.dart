import 'package:firebase_auth/firebase_auth.dart';

class SignoutController {

  void signout() async{
    await FirebaseAuth.instance.signOut();
  }

}
