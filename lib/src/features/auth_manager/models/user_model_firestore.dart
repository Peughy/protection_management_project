class UserModelFirestore {

  final String uid;
  final String compte;
  final int jokers;
  final String? nom;
  final String? prenom;

  const UserModelFirestore({required this.uid, this.nom, this.prenom, required this.compte, required this.jokers});

  factory UserModelFirestore.fromMap(Map<String, dynamic> map) {
    return UserModelFirestore(
      uid: map['uid'],
      compte: map['compte'],
      jokers: map['jokers'],
      nom: map['nom'],
      prenom: map['prenom']
    );
  }


}