import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_timing_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/my_project/my_project_class.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  List<MyProjectClass> projects = [
    MyProjectClass(
        nomProject: "Application de gestion des etudiants",
        dateDebut: "14 decembre 2024",
        dateFin: "25 decembre 2024",
        counter: "10 j: 00 h : 00 min : 00 sec",
        description:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus ipsa praesentium ad veniam quidem aut necessitatibus laudantium ullam soluta voluptates mollitia earum quos, at in, adipisci molestiae commodi facilis doloribus."),
    MyProjectClass(
        nomProject: "Application de gestion des notes",
        dateDebut: "14 decembre 2024",
        dateFin: "25 decembre 2024",
        counter: "10 j: 00 h : 00 min : 00 sec",
        description:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus ipsa praesentium ad veniam quidem aut necessitatibus laudantium ullam soluta voluptates mollitia earum quos, at in, adipisci molestiae commodi facilis doloribus."),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: pad),
            child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int val) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: pad, vertical: 12),
                    child: GestureDetector(
                        onLongPress: () {
                          showModalBottomSheet(
                              // ignore: deprecated_member_use
                              barrierColor: Colors.black.withOpacity(0.5),
                              isScrollControlled: true,
                              elevation: 12,
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(pad),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(pad),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Marquez comme",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 22),
                                            )),
                                      ),
                                      SizedBox(
                                        height: pad,
                                      ),
                                      SizedBox(
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                              padding: WidgetStatePropertyAll(
                                                  EdgeInsets.all(12)),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.green),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              radius)))),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.check,
                                            color: whiteColor,
                                            size: 32,
                                          ),
                                          label: Text(
                                            "TEMINE",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: pad,
                                      ),
                                      SizedBox(
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                              padding: WidgetStatePropertyAll(
                                                  EdgeInsets.all(12)),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.red),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              radius)))),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.close,
                                            color: whiteColor,
                                            size: 32,
                                          ),
                                          label: Text(
                                            "DIFFICILE",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: ProjectTimingWidget(projects: projects[val])),
                  );
                }),
          ),
        );
      },
    );
  }
}
