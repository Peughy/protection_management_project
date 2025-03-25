import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProjectController {


  List<Map<String, dynamic>> filterMyProject(List<QueryDocumentSnapshot<Object?>> listProjects, List<QueryDocumentSnapshot<Object?>> projetsAffets, User user){
    List<Map<String, dynamic>> myProjects = [];

    for(int i=0; i<listProjects.length; i++){
        Map<String, dynamic> listProject = listProjects[i].data() as Map<String, dynamic>;
      for(int j=0; j<projetsAffets.length; j++){
        Map<String, dynamic> projetsAffet = projetsAffets[j].data() as Map<String, dynamic>;
        if(listProject["num"] == projetsAffet["num_projet"] && projetsAffet["uid_user"] == user.uid){
          myProjects.add(listProject);
        }
      }
    }

    return myProjects;
  }
}