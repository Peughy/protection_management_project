import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

// ignore: must_be_immutable
class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key,
    required this.allProjects,
  });

  final ProjectModel allProjects;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final DateFormat formater = DateFormat('EEEE, d MMMM y', 'fr_FR');

  // feth user connector
  User? user;

  Future<void> initUser() async{
    user =  FirebaseAuth.instance.currentUser;
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
      builder: (context, isDark, child) {
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border(
                top: BorderSide(color: mainColor, width: 2),
                bottom: BorderSide(color: mainColor, width: 2),
                left: BorderSide(color: mainColor, width: 2),
                right: BorderSide(color: mainColor, width: 2),
              )),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.allProjects.nomProjet,
                  style: GoogleFonts.montserrat(
                      fontSize: 22,
                      color: mainColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Du ${formater.format(widget.allProjects.dateDebut)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark
                              ? Colors.white
                              : const Color.fromARGB(255, 55, 54, 54)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Au ${formater.format(widget.allProjects.dateFin)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark
                              ? Colors.white
                              : const Color.fromARGB(255, 55, 54, 54)))),
              const SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("~ ${widget.allProjects.descriptionProjet}",
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.italic,
                          color: isDark
                              ? Colors.white
                              : const Color.fromARGB(255, 55, 54, 54)))),
              const SizedBox(
                height: 24,
              ),
              Divider(
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 22,
                    color: mainColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Aucun",
                    style: TextStyle(color: mainColor, fontSize: 16),
                  )
                ],
              ),
              (user != null && user!.email=="protector@manager.com") ? Column(
                children: [
                  SizedBox(height: 16,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            padding: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
                          ),
                          child: Text("MODIFIER",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
                          ),
                          child: Text("SUPPRIMER",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ): Column()
            ],
          ),
        );
      },
    );
  }
}
