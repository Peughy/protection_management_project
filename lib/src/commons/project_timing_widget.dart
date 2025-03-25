import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class ProjectTimingWidget extends StatelessWidget {
   ProjectTimingWidget({
    super.key,
    required this.projects,
  });

  final ProjectModel projects;
  final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'fr_FR');

  String dateCounters(DateTime dateDebut, DateTime dateFin){

    // 🔹 Calcul de la différence
    Duration difference = dateFin.difference(dateDebut);

    // 🔹 Extraction des valeurs
    int days = difference.inDays; // Nombre de jours
    int hours = difference.inHours % 24; // Heures restantes
    int minutes = difference.inMinutes % 60; // Minutes restantes
    int seconds = difference.inSeconds % 60; // Secondes restantes

    // 🔹 Affichage du résultat
    return "$days jours, $hours h, $minutes mm, $seconds s";
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
              Text(
                projects.nomProjet,
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
                  child: Text("Du ${formatter.format(projects.dateDebut)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color.fromARGB(255, 55, 54, 54)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Au ${formatter.format(projects.dateFin)}",
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
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
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
                    dateCounters(projects.dateDebut, projects.dateFin),
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
