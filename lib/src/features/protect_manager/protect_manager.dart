import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/features/profil_manager/views/profil_page.dart';
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
                        isDark ? Icons.sunny : Icons.nightlight_round,
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
              // backgroundColor: whiteColor,
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
              AddProject(),
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
