import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/all_project/all_project_class.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.allProjects,
  });

  final AllProjectClass allProjects;

  @override
  Widget build(BuildContext context) {
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
      child:  Column(
        children: [
          Text(allProjects.nomProject, style: GoogleFonts.montserrat(fontSize: 22, color: mainColor, fontWeight: FontWeight.w600),),
          const SizedBox(height: 12,),
          Align(alignment: Alignment.topLeft, child: Text("Du ${allProjects.dateDebut}", style: GoogleFonts.montserrat(fontSize: 16, color: const Color.fromARGB(255, 55, 54, 54)))),
          Align(alignment: Alignment.topLeft, child: Text("Au ${allProjects.dateDebut}", style: GoogleFonts.montserrat(fontSize: 16, color: const Color.fromARGB(255, 55, 54, 54)))),
          const SizedBox(height: 12,),
          Divider(height: 1,),
          const SizedBox(height: 12,),
          Row(children: [
            Icon(Icons.person, size: 22, color: Colors.black,),
            const SizedBox(width: 8,),
            Text(allProjects.author, style: TextStyle(color: Colors.black, fontSize: 16),)
          ],)
        ],
      ),
    );
  }
}