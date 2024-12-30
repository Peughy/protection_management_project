import 'package:flutter/material.dart';
import 'package:protection_management_project/src/commons/project_widget.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/all_project/all_project_class.dart';

class AllProject extends StatefulWidget {
  const AllProject({super.key});

  @override
  State<AllProject> createState() => _AllProjectState();
}

class _AllProjectState extends State<AllProject> {
  
  List<AllProjectClass> allProjects  = [
    AllProjectClass(nomProject: "Application de gestion des etudiants", dateDebut: "14 decembre 2024", dateFin: "25 decembre 2024",  author: "rachelle@gmail.com"),
    AllProjectClass(nomProject: "Application de gestion des notes", dateDebut: "14 decembre 2024", dateFin: "25 decembre 2024",author: "milie@gmail.com"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: pad),
        child: ListView.builder(itemCount: allProjects.length, itemBuilder: (BuildContext context, int val){
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: pad, vertical: 12),
            child: ProjectWidget(allProjects: allProjects[val]),
          );
        }),
      ),
    );
  }
}

