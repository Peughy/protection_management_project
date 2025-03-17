import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/all_project/all_project_class.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    List<AllProjectClass> allProjects  = [
    AllProjectClass(nomProject: "Application de gestion des etudiants", dateDebut: "14 decembre 2024", dateFin: "25 decembre 2024",  author: "rachelle@gmail.com"),
    AllProjectClass(nomProject: "Application de gestion des notes", dateDebut: "14 decembre 2024", dateFin: "25 decembre 2024",author: "milie@gmail.com"),
    AllProjectClass(nomProject: "Application de gestion des notes", dateDebut: "14 decembre 2024", dateFin: "25 decembre 2024",author: "Aucun"),
  ];

  List<String> projectRealizator = ["milie@gmail.com", "rachelle@gmail.com"];
    return Padding(
        padding:  EdgeInsets.only(top: pad),
        child: ListView.builder(itemCount: allProjects.length, itemBuilder: (BuildContext context, int val){
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: pad, vertical: 12),
            child: GestureDetector(
              onLongPress: (){
                showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.5),
                  isScrollControlled: true,
                  elevation: 12,
                  context: context, builder: (context){
                  return Container(
                    height: 300,
                    padding:  EdgeInsets.all(pad),
                    width: MediaQuery.of(context).size.width,
                    color: whiteColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(pad),
                          child: Align(alignment: Alignment.center, child: Text("Assigne a", style: GoogleFonts.montserrat(fontSize: 22),)),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: projectRealizator.length,
                            itemBuilder: (context, idx){
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        shape: BoxShape.circle
                                      ),
                                      child: Text(projectRealizator[idx][0].toUpperCase(), style: GoogleFonts.montserrat(fontSize: 18, color: whiteColor),),
                                  ),
                                  const SizedBox(width: 6,),
                                  Text(projectRealizator[idx], style: GoogleFonts.montserrat(fontSize: 22),),
                                ],
                              ),
                               SizedBox(height: pad,),
                                ],
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: ProjectWidget(allProjects: allProjects[val])),
          );
        }),
      );
  }
}