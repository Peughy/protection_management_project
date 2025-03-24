import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.allProjects,
  });

  final ProjectModel allProjects;

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
                  allProjects.nomProjet,
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
                  child: Text("Du ${allProjects.dateDebut}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Au ${allProjects.dateDebut}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
                          const SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("~ ${allProjects.descriptionProjet}",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
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
              )
            ],
          ),
        );
      },
    );
  }
}
