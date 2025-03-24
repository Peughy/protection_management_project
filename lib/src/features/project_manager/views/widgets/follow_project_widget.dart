import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/models/follow_project_model.dart';

class FollowProject extends StatelessWidget {
  const FollowProject({super.key});

  @override
  Widget build(BuildContext context) {
    List<FollowProjectModel> followProjectModel = [
      FollowProjectModel(name: "Milie Flore", totalProject: 5, realizeProject: 3, loadinProject: 1, rejectProject: 1),
      FollowProjectModel(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectModel(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectModel(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectModel(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
  ];
  
    return Column(
      children: [
        SizedBox(height: pad,),
          Align(
            alignment: Alignment.center,
            child: Text("SUIVI DE PROJET", style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: whiteColor, backgroundColor: mainColor),)),
        Expanded(
          child: ListView.builder(
                  itemCount: followProjectModel.length,
                  itemBuilder: (context, idx){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 48),
                        Text(followProjectModel[idx].name, style: GoogleFonts.montserrat(fontSize: 22, color: mainColor, fontWeight: FontWeight.bold),),
                        SizedBox(height: pad,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectModel[idx].totalProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: mainColor),),
                                Text("Projet totals", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                            SizedBox(width: pad,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectModel[idx].realizeProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),),
                                Text("Projet Realises", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,  
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectModel[idx].loadinProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey),),
                                Text("Projet en cous", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                            SizedBox(width: pad,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectModel[idx].rejectProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),),
                                Text("Projet pas atteint", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}