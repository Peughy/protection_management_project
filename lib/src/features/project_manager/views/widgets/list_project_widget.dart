import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_widget.dart';
import 'package:protection_management_project/src/commons/snackbar_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/auth_manager/models/user_model_firestore.dart';
import 'package:protection_management_project/src/features/project_manager/controller/list_projet_controller.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    void showOk(String nomProjet, String nomUser) {
      Navigator.pop(context);
      showAboutDialog(context: context, useRootNavigator: false, children: [
        Text(
          "Le projet $nomProjet a bien ete assigne a $nomUser",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
      ]);
    }

    void showNonOk() {
      Navigator.pop(context);
      showAboutDialog(context: context, useRootNavigator: false, children: [
        Text(
          "Erreur lors de l'assignation du projet",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
      ]);
    }

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("projets").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: EdgeInsets.only(top: pad),
              child: Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(top: pad),
              child: Center(
                child: Text(
                  "Aucun projet",
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
              ),
            );
          }
          final projectsDocuments = snapshot.data!.docs;
          return Padding(
            padding: EdgeInsets.only(top: pad),
            child: ListView.builder(
                itemCount: projectsDocuments.length,
                itemBuilder: (BuildContext context, int val) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: pad, vertical: 12),
                    child: GestureDetector(
                        onLongPress: () {
                          Map<String, dynamic> projectClicked =
                              projectsDocuments[val].data()
                                  as Map<String, dynamic>;
                          showModalBottomSheet(
                              // ignore: deprecated_member_use
                              barrierColor: Colors.black.withOpacity(0.5),
                              isScrollControlled: true,
                              elevation: 12,
                              context: context,
                              builder: (context) {
                                return StreamBuilder(
                                    stream: db.collection("user").snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: Text(
                                          "Pas d'utilisateur",
                                          style:
                                              GoogleFonts.roboto(fontSize: 18),
                                        ));
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: mainColor,
                                          ),
                                        );
                                      }

                                      // filter user info
                                      List<Map<String, dynamic>> userDocuments =
                                          ListProjetController().filteredUser(
                                              snapshot.data!.docs);

                                      return Container(
                                        height: (userDocuments.length <= 2)
                                            ? 300
                                            : 500,
                                        padding: EdgeInsets.all(pad),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // color: whiteColor,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(pad),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Assigne a",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 22),
                                                  )),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  itemCount:
                                                      userDocuments.length,
                                                  itemBuilder: (context, idx) {
                                                    Map<String, dynamic>
                                                        userInfo =
                                                        userDocuments[idx];
                                                    UserModelFirestore
                                                        userModelFirestore =
                                                        UserModelFirestore
                                                            .fromMap(userInfo);
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Map<String, dynamic>
                                                            map = {
                                                          "num_projet":
                                                              projectClicked[
                                                                  "num"],
                                                          "uid_user":
                                                              userModelFirestore
                                                                  .uid
                                                        };
                                                        if (projectClicked[
                                                                "etat"] ==
                                                            "attente") {
                                                          db
                                                              .collection(
                                                                  "projectAffect")
                                                              .add(map)
                                                              .then((onValue) {
                                                            final projectRef = db
                                                                .collection(
                                                                    "projets")
                                                                .doc(
                                                                    projectClicked[
                                                                        "num"]);
                                                            projectRef.update({
                                                              "etat": "en cours"
                                                            }).then((value) {
                                                              showOk(projectClicked["nomProjet"], userModelFirestore.nom!);
                                                            }, onError: (e) {
                                                              showNonOk();
                                                            });
                                                          });
                                                        } else {
                                                          Navigator.pop(
                                                              context);
                                                          showAboutDialog(
                                                              context: context,
                                                              useRootNavigator:
                                                                  false,
                                                              children: [
                                                                Text(
                                                                  "Le projet ${projectClicked["nomProjet"]} ne peut etre assigne car il est deja en cours",
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                          fontSize:
                                                                              18),
                                                                ),
                                                              ]);
                                                        }
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        mainColor,
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child: Text(
                                                                  userModelFirestore
                                                                      .nom![0]
                                                                      .toUpperCase(),
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              whiteColor),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                "${userModelFirestore.nom} ${userModelFirestore.prenom}",
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                        fontSize:
                                                                            22),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: pad,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                        },
                        child: ProjectWidget(
                            allProjects: ProjectModel.fromMap(
                                projectsDocuments[val].data()
                                    as Map<String, dynamic>))),
                  );
                }),
          );
        });
  }
}
