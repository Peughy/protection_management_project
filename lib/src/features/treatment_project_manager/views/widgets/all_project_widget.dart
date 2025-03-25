import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/project_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class AllProjectWidget extends StatefulWidget {
  const AllProjectWidget({super.key});

  @override
  State<AllProjectWidget> createState() => _AllProjectWidgetState();
}

class _AllProjectWidgetState extends State<AllProjectWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("projets").snapshots(), 
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

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
      
      final userDocuments = snapshot.data!.docs;
      return Padding(
        padding:  EdgeInsets.only(top: pad),
        child: ListView.builder(itemCount: userDocuments.length, itemBuilder: (BuildContext context, int val){
          ProjectModel projectModel = ProjectModel.fromMap(userDocuments[val].data() as Map<String, dynamic>);
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: pad, vertical: 12),
            child: ProjectWidget(allProjects: projectModel),
          );
        }),
      );}),
    );
  }
}

