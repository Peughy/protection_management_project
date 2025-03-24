import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/my_project/my_project_class.dart';

class ProjectTimingWidget extends StatelessWidget {
  const ProjectTimingWidget({
    super.key,
    required this.projects,
  });

  final MyProjectClass projects;

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
              Text(
                projects.nomProject,
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: mainColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Du ${projects.dateDebut}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Au ${projects.dateDebut}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
              const SizedBox(
                height: 12,
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
                    Icons.lock_clock_rounded,
                    size: 28,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    projects.counter,
                    style: TextStyle(color: Colors.red, fontSize: 20),
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
