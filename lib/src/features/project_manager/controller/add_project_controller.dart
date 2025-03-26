import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:protection_management_project/src/features/project_manager/models/project_model.dart';

class AddProjectController {
  final db = FirebaseFirestore.instance;
  TextEditingController nomProjetController = TextEditingController();
  TextEditingController descProjetController = TextEditingController();

  DateTime? debutDateTime;
  DateTime? finDateTime;

  bool isLoading = false;

  Future<void> addProject(String nom, String desc, String etat, DateTime? debut, DateTime? fin) async {
    String num = "protect-project-${Random().nextInt(9999)+1111}";
    final projectModel = ProjectModel(num: num, nomProjet: nom, descriptionProjet: desc, etat: etat, dateDebut: debut!, dateFin: fin!);

    final docRef = db
    .collection("projets")
    .withConverter(
      fromFirestore: ProjectModel.fromFirestore,
      toFirestore: (ProjectModel project, options) => project.toFirestore(),
    );

    await docRef.add(projectModel);
  }
}
