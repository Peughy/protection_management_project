// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:protection_management_project/src/commons/navigation_page.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/constants/string.dart';
import 'package:protection_management_project/src/features/auth_manager/controllers/signin_controller.dart';
import 'package:protection_management_project/src/features/project_manager/views/project_manager.dart';
import 'package:protection_management_project/src/features/validate_project/validate_project.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final SigninController _signinController = SigninController();

  void _connexionimplement() async {
    setState(() => _isLoading = true);

    var user = await _signinController.signIn(context);

    setState(() => _isLoading = false);

    if (user != null) {
      if (user.compte == "dev") {
        NavigationPage.changePage(context, ValidateProject());
      } else {
        NavigationPage.changePage(context, ProjectManager());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(pad),
              child: Center(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Image(
                      image: AssetImage(isDark ? protectWhite : protectMain),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      textSigninPage,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    SizedBox(
                      height: pad,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Veuillez completer ce champs";
                                  }
                                  return null;
                                },
                                style: TextStyle(),
                                controller: _signinController.emailController,
                                decoration: InputDecoration(
                                  hintText: "Entrez votre adresse mail",
                                  hintStyle: TextStyle(),
                                  prefixIcon: Icon(Icons.mail),
                                  labelText: "Entrez votre adresse mail",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius)),
                                )),
                            SizedBox(
                              height: pad,
                            ),
                            TextFormField(
                                controller: _signinController.mdpController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Veuillez completer ce champs";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  hintText: "Entrez votre mot de passe",
                                  hintStyle: TextStyle(),
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Entrez votre mot de passe",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius)),
                                )),
                            SizedBox(
                              height: pad,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(mainColor),
                                      padding: WidgetStatePropertyAll(
                                          const EdgeInsets.all(12)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      radius)))),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _connexionimplement();
                                    }
                                  },
                                  child: _isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "CONNEXION",
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontSize: btnStartPageText),
                                        )),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
