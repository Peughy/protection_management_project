import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/features/validate_project/infos_page.dart';
import 'package:protection_management_project/src/features/protect_manager/add_project.dart';
import 'package:protection_management_project/src/features/protect_manager/follow_project.dart';
import 'package:protection_management_project/src/features/protect_manager/list_project.dart';

class ProtectManager extends StatefulWidget {
  const ProtectManager({super.key});

  @override
  State<ProtectManager> createState() => _ProtectManagerState();
}

class _ProtectManagerState extends State<ProtectManager> {

  int _currentPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: whiteColor
          ),
          backgroundColor: mainColor,
          title: Text("Protect manager", style: GoogleFonts.comfortaa(fontSize: 22, color: whiteColor),),
        ),
        drawer: Drawer(
          backgroundColor: whiteColor,
          elevation: 20,
          child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                DrawerHeader(decoration: BoxDecoration(
                  color: mainColor
                ), child: Image(image: AssetImage(protectWhite), height: 100, width: 100,),),
                const SizedBox(height: 32,),
                ListTile(
                  onTap: (){
                    setState(() {
                      _currentPage = 0;
                    });
                  },
                  leading: Icon(Icons.list, size: 26,), title: Text("Liste de projet", style: GoogleFonts.roboto(fontSize: 20),),),
                ListTile(
                  onTap: (){
                    setState(() {
                      _currentPage = 1;
                    });
                  },
                  leading: Icon(Icons.add, size: 26,), title: Text("Ajouter un projet", style: GoogleFonts.roboto(fontSize: 20),),),
                ListTile(
                  onTap: (){
                    setState(() {
                      _currentPage = 2;
                    });
                  },
                  leading: Icon(Icons.track_changes, size: 26,), title: Text("Suivi de projet", style: GoogleFonts.roboto(fontSize: 20),),),
                ListTile(
                  onTap: () {
                    setState(() {
                      _currentPage = 3;
                    });
                  },
                  leading: Icon(Icons.settings, size: 26,), title: Text("Parametres", style: GoogleFonts.roboto(fontSize: 20),),),
                ListTile(leading: Icon(Icons.logout, size: 26,), title: Text("Deconnexion", style: GoogleFonts.roboto(fontSize: 20),),),
              ],
          ),
        ),
        body: [ListProject(), AddProject(), FollowProject(), InfosPage(showBar: false,)][_currentPage],
      ),
    );
  }
}