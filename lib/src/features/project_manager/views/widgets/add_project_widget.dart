import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/navigation_page.dart';
import 'package:protection_management_project/src/commons/snackbar_widget.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/features/project_manager/controller/add_project_controller.dart';
import 'package:protection_management_project/src/features/project_manager/views/project_manager.dart';

class AddProjectWidget extends StatefulWidget {
  const AddProjectWidget({super.key});

  @override
  State<AddProjectWidget> createState() => _AddProjectWidgetState();
}

class _AddProjectWidgetState extends State<AddProjectWidget> {
  final _formKey = GlobalKey<FormState>();
  AddProjectController addProjectController = AddProjectController();

  String dateDebutText = "DEBUT";
  String dateFinText = "FIN";

  void setProject(
      String nom, String desc, String etat, DateTime? debut, DateTime? fin) async {
    await addProjectController.addProject(nom, desc, etat, debut, fin);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> debutDate() async {
      DateTime? debutDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2025),
          lastDate: DateTime(2026),
          initialDate: DateTime.now());

      if (debutDate != null) {
        setState(() {
          dateDebutText = debutDate.toString();
          addProjectController.debutDateTime = debutDate;
        });
      }
    }

    Future<void> finDate() async {
      DateTime? finDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2025),
          lastDate: DateTime(2026),
          initialDate: DateTime.now());

      if (finDate != null) {
        setState(() {
          dateFinText = finDate.toString();
          addProjectController.finDateTime = finDate;
        });
      }
    }

    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            SizedBox(
              height: pad,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "AJOUT DE PROJET",
                  style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                )),
            SizedBox(
              height: pad,
            ),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: addProjectController.nomProjetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez completer ce champs";
                  }
                  return null;
                },
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Entrez le nom du projet",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius)),
                )),
            SizedBox(
              height: pad,
            ),
            TextFormField(
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                controller: addProjectController.descProjetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez completer ce champs";
                  }
                  return null;
                },
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Entrez la description du projet",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius)),
                )),
            SizedBox(
              height: pad * 2,
            ),
            Center(
              child: Wrap(
                spacing: 16,
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      Text(
                        "Date de debut",
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            debutDate();
                          },
                          style: ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(12)),
                              backgroundColor:
                                  WidgetStatePropertyAll(mainColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius)))),
                          child: Text(
                            dateDebutText,
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      Text(
                        "Date de fin",
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            finDate();
                          },
                          style: ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(12)),
                              backgroundColor:
                                  WidgetStatePropertyAll(mainColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius)))),
                          child: Text(
                            dateFinText,
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: pad,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (addProjectController.debutDateTime != null &&
                          addProjectController.finDateTime != null) {
                        setProject(
                            addProjectController.nomProjetController.text,
                            addProjectController.descProjetController.text,
                            "en cours",
                            addProjectController.debutDateTime,
                            addProjectController.finDateTime);

                            SnackbarWidget(text: "Le projet a bien ete ajoute", color: Colors.green).snackbarWidget(context);
                            await Future.delayed(Duration(seconds: 2));
                            NavigationPage.changePage(context, ProjectManager());
                      } else {
                        SnackbarWidget(
                                text:
                                    "Veuillez selectionner une date de debut et/ou une date de fin de projet")
                            .snackbarWidget(context);
                      }
                    }
                  },
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                      backgroundColor: WidgetStatePropertyAll(mainColor),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius)))),
                  child: Text(
                    "AJOUTER",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: whiteColor,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
