import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/validate_project/protect_manager/follow_project_class.dart';

class FollowProject extends StatelessWidget {
  const FollowProject({super.key});

  @override
  Widget build(BuildContext context) {
    List<FollowProjectClass> followProjectClass = [
      FollowProjectClass(name: "Milie Flore", totalProject: 5, realizeProject: 3, loadinProject: 1, rejectProject: 1),
      FollowProjectClass(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectClass(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectClass(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
      FollowProjectClass(name: "Rachelle Bagao", totalProject: 3, realizeProject: 2, loadinProject: 1, rejectProject: 0),
  ];
  
    return Column(
      children: [
        SizedBox(height: pad,),
          Align(
            alignment: Alignment.center,
            child: Text("SUIVI DE PROJET", style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: whiteColor, backgroundColor: mainColor),)),
        Expanded(
          child: ListView.builder(
                  itemCount: followProjectClass.length,
                  itemBuilder: (context, idx){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 48),
                        Text(followProjectClass[idx].name, style: GoogleFonts.montserrat(fontSize: 22, color: mainColor, fontWeight: FontWeight.bold),),
                        SizedBox(height: pad,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectClass[idx].totalProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: mainColor),),
                                Text("Projet totals", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                            SizedBox(width: pad,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectClass[idx].realizeProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),),
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
                                Text("${followProjectClass[idx].loadinProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey),),
                                Text("Projet en cous", style: GoogleFonts.montserrat(fontSize: 18),),
                                ],
                            ),
                            SizedBox(width: pad,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${followProjectClass[idx].rejectProject}", style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),),
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