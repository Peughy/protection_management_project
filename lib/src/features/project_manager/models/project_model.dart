// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String num;
  final String nomProjet;
  final String descriptionProjet;
  final String etat;
  final DateTime dateDebut;
  final DateTime dateFin;

  const ProjectModel(
      {required this.num,
      required this.nomProjet,
      required this.descriptionProjet,
      required this.etat,
      required this.dateDebut,
      required this.dateFin});

  factory ProjectModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return ProjectModel(
      num: data?['num'],
      nomProjet: data?['nomProjet'],
      descriptionProjet: data?['descriptionProjet'],
      etat: data?["etat"],
      dateDebut: data?['dateDebut'],
      dateFin: data?['dateFin'],
    );
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map){
    return ProjectModel(
      num: map['num'],
      nomProjet: map['nomProjet'],
      descriptionProjet: map['descriptionProjet'],
      etat: map["etat"],
      dateDebut: map['dateDebut'].toDate(),
      dateFin: map['dateFin'].toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (num != null) "num": num,
      if (nomProjet != null) "nomProjet": nomProjet,
      if (descriptionProjet != null) "descriptionProjet": descriptionProjet,
      if (etat != null) "etat": etat,
      if (dateDebut != null) "dateDebut": dateDebut,
      if (dateFin != null) "dateFin": dateFin,
    };
  }
}
