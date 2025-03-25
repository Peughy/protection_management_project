import 'package:cloud_firestore/cloud_firestore.dart';

class ListProjetController {

  List<Map<String, dynamic>> filteredUser(List<QueryDocumentSnapshot<Object?>> snapshots){

    List<Map<String, dynamic>> snapshotMaps = [];

    for(int i=0; i<snapshots.length; i++){
      Map<String, dynamic> map = snapshots[i].data() as Map<String, dynamic>;
      map["uid"] = snapshots[i].id;
      snapshotMaps.add(map);
    }

    List<Map<String, dynamic>> filteredUserInfos = 
      snapshotMaps.where((snapshotMap) => snapshotMap["compte"] == "dev").toList();

    return filteredUserInfos;

  }

}