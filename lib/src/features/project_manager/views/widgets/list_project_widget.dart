import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> projectRealizator = ["milie@gmail.com", "rachelle@gmail.com"];
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
                          showModalBottomSheet(
                              barrierColor: Colors.black.withOpacity(0.5),
                              isScrollControlled: true,
                              elevation: 12,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 300,
                                  padding: EdgeInsets.all(pad),
                                  width: MediaQuery.of(context).size.width,
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
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 22),
                                            )),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: projectRealizator.length,
                                            itemBuilder: (context, idx) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
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
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    mainColor,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Text(
                                                          projectRealizator[idx]
                                                                  [0]
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 18,
                                                                  color:
                                                                      whiteColor),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        projectRealizator[idx],
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 22),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: pad,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: ProjectWidget(allProjects: ProjectModel.fromMap(projectsDocuments[val].data() as Map<String, dynamic>))),
                  );
                }),
          );
        });
  }
}
