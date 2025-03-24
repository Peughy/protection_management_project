import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/features/auth_manager/controllers/signout_controller.dart';
import 'package:protection_management_project/src/features/auth_manager/signin_page.dart';
import 'package:protection_management_project/src/features/profil_manager/views/profil_page.dart';
import 'package:protection_management_project/src/features/project_manager/views/widgets/add_project_widget.dart';
import 'package:protection_management_project/src/features/project_manager/views/widgets/follow_project_widget.dart';
import 'package:protection_management_project/src/features/project_manager/views/widgets/list_project_widget.dart';

class ProjectManager extends StatefulWidget {
  const ProjectManager({super.key});

  @override
  State<ProjectManager> createState() => _ProjectManagerState();
}

class _ProjectManagerState extends State<ProjectManager> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          theme: ThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              colorScheme: isDark
                  ? ColorScheme.dark().copyWith(primary: mainColor)
                  : ColorScheme.light().copyWith(primary: mainColor)),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                      onPressed: () {
                        isDarkModeNotifier.value = !isDark;
                      },
                      icon: Icon(
                        isDark ? Icons.sunny : Icons.bedtime_sharp,
                        color: whiteColor,
                        size: 28,
                      )),
                ),
              ],
              iconTheme: IconThemeData(color: whiteColor),
              backgroundColor: mainColor,
              title: Text(
                "Protect manager",
                style: GoogleFonts.comfortaa(fontSize: 22, color: whiteColor),
              ),
            ),
            drawer: Drawer(
              elevation: 20,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: mainColor),
                    child: Image(
                      image: AssetImage(protectWhite),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _currentPage = 0;
                      });
                    },
                    leading: Icon(
                      Icons.list,
                      size: 26,
                    ),
                    title: Text(
                      "Liste de projet",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _currentPage = 1;
                      });
                    },
                    leading: Icon(
                      Icons.add,
                      size: 26,
                    ),
                    title: Text(
                      "Ajouter un projet",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _currentPage = 2;
                      });
                    },
                    leading: Icon(
                      Icons.track_changes,
                      size: 26,
                    ),
                    title: Text(
                      "Suivi de projet",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _currentPage = 3;
                      });
                    },
                    leading: Icon(
                      Icons.settings,
                      size: 26,
                    ),
                    title: Text(
                      "Parametres",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                     SignoutController().signout();
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SigninPage();
                     }));
                    },
                    leading: Icon(
                      Icons.logout,
                      size: 26,
                    ),
                    title: Text(
                      "Deconnexion",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            body: [
              ListProject(),
              AddProjectWidget(),
              FollowProject(),
              ProfilPage(
                showBar: false,
              )
            ][_currentPage],
          ),
        );
      },
    );
  }
}
