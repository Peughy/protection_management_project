import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/navigation_page.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/features/validate_project/all_project/all_project.dart';
import 'package:protection_management_project/src/features/validate_project/infos_page.dart';
import 'package:protection_management_project/src/features/validate_project/my_project/my_project.dart';

class ValidateProject extends StatefulWidget {
  const ValidateProject({super.key});

  @override
  State<ValidateProject> createState() => _ValidateProjectState();
}

class _ValidateProjectState extends State<ValidateProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2, child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("Project manager", style: GoogleFonts.comfortaa(fontSize: 24, color: whiteColor),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(onPressed: (){
                NavigationPage.changePage(context,  InfosPage(showBar: true,));
              }, icon: Icon(Icons.menu, color: whiteColor, size: 32,)),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: const Color.fromARGB(255, 49, 47, 47),
            labelColor: whiteColor,
            labelStyle: TextStyle(fontSize: 20),
            indicatorColor: whiteColor,
            tabs: [
              Tab(child: Text("Mes projets",),),
              Tab(child: Text("Tous les projets"),)
            ],
          ),
        ),

        body: TabBarView(children: [
          const MyProject(),
          const AllProject()
        ]),
      )),
    );
  }
}

