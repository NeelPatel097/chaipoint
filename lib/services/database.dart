import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference chaiCollection = FirebaseFirestore.instance.collection('chai');

  Future updateUserData(String sugars, String name, int strength) async {
    return await chaiCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

}