import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/navigation_page.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
import 'package:protection_management_project/src/features/treatment_project_manager/views/widgets/all_project_widget.dart';
import 'package:protection_management_project/src/features/profil_manager/views/profil_page.dart';
import 'package:protection_management_project/src/features/treatment_project_manager/views/widgets/my_project_widget.dart';

class TreatementProjectManager extends StatefulWidget {
  const TreatementProjectManager({super.key});

  @override
  State<TreatementProjectManager> createState() => _TreatementProjectManagerState();
}

class _TreatementProjectManagerState extends State<TreatementProjectManager> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: isDark ?  ColorScheme.dark().copyWith(primary: mainColor) : ColorScheme.light().copyWith(primary: mainColor),
                useMaterial3: true,
                brightness: isDark ? Brightness.dark : Brightness.light),
            home: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: mainColor,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Project manager",
                        style: GoogleFonts.comfortaa(
                            fontSize: 24, color: whiteColor),
                      ),
                    ),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                            onPressed: () {
                              NavigationPage.changePage(
                                  context,
                                  ProfilPage(
                                    showBar: true,
                                  ));
                            },
                            icon: Icon(
                              Icons.menu,
                              color: whiteColor,
                              size: 32,
                            )),
                      )
                    ],
                    bottom: TabBar(
                      unselectedLabelColor:
                          const Color.fromARGB(255, 49, 47, 47),
                      labelColor: whiteColor,
                      labelStyle: TextStyle(fontSize: 20),
                      indicatorColor: whiteColor,
                      tabs: [
                        Tab(
                          child: Text(
                            "Mes projets",
                          ),
                        ),
                        Tab(
                          child: Text("Tous les projets"),
                        )
                      ],
                    ),
                  ),
                  body: TabBarView(
                      children: [const MyProjectWidget(), const AllProjectWidget()]),
                )),
          );
        });
  }
}
