// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/profil_manager/controllers/profil_controller.dart';

// ignore: must_be_immutable
class ProfilPage extends StatefulWidget {
  ProfilPage({super.key, required this.showBar});
  bool showBar;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  ProfilController profilController = ProfilController();

  bool isLoading = true;

  var user;

  void initData() async {
    user = await profilController.getUserInformation();
    if (user != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.showBar)
          ? AppBar(
              iconTheme: IconThemeData(color: whiteColor),
              backgroundColor: mainColor,
              title: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Informations",
                  style: GoogleFonts.comfortaa(fontSize: 24, color: whiteColor),
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: mainColor,
                )),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: pad),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: mainColor,
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 2),
                            left: BorderSide(color: Colors.black, width: 2),
                            bottom: BorderSide(color: Colors.black, width: 2),
                            right: BorderSide(color: Colors.black, width: 2),
                          )),
                      child: Text(
                        "${user.nom[0].toUpperCase()}",
                        style: GoogleFonts.montserrat(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: whiteColor),
                      ),
                    ),
                    Text(
                      "${user.nom} ${user.prenom}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${user.email}",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: mainColor300,
                              shape: BoxShape.circle,
                              border: Border(
                                top: BorderSide(color: mainColor, width: 1.5),
                                left: BorderSide(color: mainColor, width: 1.5),
                                bottom:
                                    BorderSide(color: mainColor, width: 1.5),
                                right: BorderSide(color: mainColor, width: 1.5),
                              )),
                          child: Icon(Icons.person, color: mainColor, size: 32),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Modifier mes informations",
                          style: TextStyle(fontSize: 22, color: mainColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: pad,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: mainColor300,
                              shape: BoxShape.circle,
                              border: Border(
                                top: BorderSide(color: mainColor, width: 1.5),
                                left: BorderSide(color: mainColor, width: 1.5),
                                bottom:
                                    BorderSide(color: mainColor, width: 1.5),
                                right: BorderSide(color: mainColor, width: 1.5),
                              )),
                          child: Icon(Icons.view_column,
                              color: mainColor, size: 32),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text("Mon historique",
                            style: TextStyle(fontSize: 22, color: mainColor))
                      ],
                    ),
                    SizedBox(
                      height: pad,
                    ),
                    GestureDetector(
                      // onTap: NavigationPage.changePage(context, SigninPage()),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(85, 244, 67, 54),
                                shape: BoxShape.circle,
                                border: Border(
                                  top:
                                      BorderSide(color: Colors.red, width: 1.5),
                                  left:
                                      BorderSide(color: Colors.red, width: 1.5),
                                  bottom:
                                      BorderSide(color: Colors.red, width: 1.5),
                                  right:
                                      BorderSide(color: Colors.red, width: 1.5),
                                )),
                            child:
                                Icon(Icons.logout, color: Colors.red, size: 32),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Deconnexion",
                            style: TextStyle(fontSize: 22, color: Colors.red),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
