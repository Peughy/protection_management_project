import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class ProjectTimingWidget extends StatefulWidget {
  const ProjectTimingWidget({
    super.key,
    required this.projects,
  });

  final ProjectModel projects;

  @override
  State<ProjectTimingWidget> createState() => _ProjectTimingWidgetState();
}

class _ProjectTimingWidgetState extends State<ProjectTimingWidget> {
  final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'fr_FR');

   // ounters function
  DateTime toDay = DateTime.now();
  // Duration difference = widget.projects.dateFin.difference(toDay);

  // int days = difference.inDays;
  //   int hours = difference.inHours;
  //   int minutes = difference.inMinutes;
  //   int seconds = difference.inSeconds;
  int days = 3;
    int hours = 23;
    int minutes = 59;
    int seconds = 59;
    Timer? timer;

    void startTimer(){
      timer = Timer.periodic(Duration(seconds: 1), (timer){
        setState(() {
          if(seconds > 0){
            seconds--;
          }else if(minutes > 0){
              minutes--;
              seconds = 59;
            }
          else if(hours > 0){
            hours--;
            minutes = 59;
            seconds = 59;
          }
          else if(days > 0){
            days--;
            hours = 23;
            minutes = 59;
            seconds = 59;
          }
        });
      });
    }

    String formatNumber(int number){
      return number.toString().padLeft(2, '0');
    }

    @override
    void initState(){
      super.initState();
      startTimer();
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
                top: BorderSide(
                    color: (widget.projects.etat == "en cours")
                        ? mainColor
                        : (widget.projects.etat == "annuler")
                            ? Colors.red
                            : Colors.green,
                    width: 2),
                bottom: BorderSide(
                    color: (widget.projects.etat == "en cours")
                        ? mainColor
                        : (widget.projects.etat == "annuler")
                            ? Colors.red
                            : Colors.green,
                    width: 2),
                left: BorderSide(
                    color: (widget.projects.etat == "en cours")
                        ? mainColor
                        : (widget.projects.etat == "annuler")
                            ? Colors.red
                            : Colors.green,
                    width: 2),
                right: BorderSide(
                    color: (widget.projects.etat == "en cours")
                        ? mainColor
                        : (widget.projects.etat == "annuler")
                            ? Colors.red
                            : Colors.green,
                    width: 2),
              )),
          child: Column(
            children: [
              Text(
                widget.projects.nomProjet,
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: (widget.projects.etat == "en cours")
                        ? mainColor
                        : (widget.projects.etat == "annuler")
                            ? Colors.red
                            : Colors.green,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Du ${formatter.format(widget.projects.dateDebut)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark
                              ? Colors.white
                              : const Color.fromARGB(255, 55, 54, 54)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Au ${formatter.format(widget.projects.dateFin)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: isDark
                              ? Colors.white
                              : const Color.fromARGB(255, 55, 54, 54)))),
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
                    (widget.projects.etat != "annuler")
                        ? "${formatNumber(days)} jour(s) - ${formatNumber(hours)}:${formatNumber(minutes)}:${formatNumber(seconds)}"
                        : "DIFFICILE",
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
