class UserModel {
  final String uid;
  final String? email;
  final String compte;
  final int jokers;
  final String? nom;
  final String? prenom;

  const UserModel({required this.uid, required this.email, this.nom, this.prenom, required this.compte, required this.jokers});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      compte: map['compte'],
      jokers: map['jokers'],
      nom: map['nom'],
      prenom: map['prenom']
    );
  }

  String get getUid => uid;
  String? get getEmail => email;
  String get getCompte => compte;
  int get getJokers => jokers;
}

