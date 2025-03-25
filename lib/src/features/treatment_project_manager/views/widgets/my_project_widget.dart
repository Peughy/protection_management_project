import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_timing_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';
import 'package:protection_management_project/src/features/treatment_project_manager/controllers/my_project_controller.dart';

class MyProjectWidget extends StatefulWidget {
  const MyProjectWidget({super.key});

  @override
  State<MyProjectWidget> createState() => _MyProjectWidgetState();
}

class _MyProjectWidgetState extends State<MyProjectWidget> {
  User? user;

  Future<void> initUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    initUser();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return Scaffold(
          body: Padding(
              padding: EdgeInsets.only(top: pad),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("projets")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshotProjets) {
                    if (snapshotProjets.connectionState ==
                        ConnectionState.waiting) {
                      return Padding(
                        padding: EdgeInsets.only(top: pad),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        ),
                      );
                    }

                    if (!snapshotProjets.hasData) {
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
                    final projectsDocuments = snapshotProjets.data!.docs;
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("projectAffect")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshotProjetAffect) {
                          if (snapshotProjetAffect.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding: EdgeInsets.only(top: pad),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              ),
                            );
                          }

                          if (!snapshotProjetAffect.hasData) {
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
                          final projectAffectDocuments =
                              snapshotProjetAffect.data!.docs;
                          List<Map<String, dynamic>> myProjects =
                              MyProjectController().filterMyProject(
                                  projectsDocuments,
                                  projectAffectDocuments,
                                  user!);
                          return (myProjects.isNotEmpty)
                              ? ListView.builder(
                                  itemCount: myProjects.length,
                                  itemBuilder: (BuildContext context, int val) {
                                    // convert type
                                    ProjectModel projectModel =
                                        ProjectModel.fromMap(myProjects[val]);
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: pad, vertical: 12),
                                      child: GestureDetector(
                                          onLongPress: () {
                                            showModalBottomSheet(
                                                barrierColor: Colors.black
                                                    .withOpacity(0.5),
                                                isScrollControlled: true,
                                                elevation: 12,
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.all(pad),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  pad),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Marquez comme",
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                        fontSize:
                                                                            22),
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: pad,
                                                        ),
                                                        SizedBox(
                                                          child: ElevatedButton
                                                              .icon(
                                                            style: ButtonStyle(
                                                                padding: WidgetStatePropertyAll(
                                                                    EdgeInsets
                                                                        .all(
                                                                            12)),
                                                                backgroundColor:
                                                                    WidgetStatePropertyAll(
                                                                        Colors
                                                                            .green),
                                                                shape: WidgetStatePropertyAll(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(radius)))),
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.check,
                                                              color: whiteColor,
                                                              size: 32,
                                                            ),
                                                            label: Text(
                                                              "TEMINE",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: pad,
                                                        ),
                                                        SizedBox(
                                                          child: ElevatedButton
                                                              .icon(
                                                            style: ButtonStyle(
                                                                padding: WidgetStatePropertyAll(
                                                                    EdgeInsets
                                                                        .all(
                                                                            12)),
                                                                backgroundColor:
                                                                    WidgetStatePropertyAll(
                                                                        Colors
                                                                            .red),
                                                                shape: WidgetStatePropertyAll(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(radius)))),
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: whiteColor,
                                                              size: 32,
                                                            ),
                                                            label: Text(
                                                              "DIFFICILE",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: ProjectTimingWidget(
                                              projects: projectModel)),
                                    );
                                  })
                              : Center(
                                  child: Text(
                                  "Vous n'avez aucun projet en cours",
                                  style: GoogleFonts.roboto(fontSize: 18),
                                ));
                        });
                  })),
        );
      },
    );
  }
}
