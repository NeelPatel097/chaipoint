import 'package:chaipoint/models/user_new.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chaipoint/models/chai.dart';

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

  // chai list from snapshot
  List<Chai> _chaiListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Chai(
        name: doc.data()['name'] ?? '',
        strength: doc.data()['strength'] ?? 0,
        sugars: doc.data()['sugars'] ?? '0'
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)  {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
        sugars: snapshot.data()['sugars'],
        strength: snapshot.data()['strength']
    );
  }

  //get chai stream
  Stream<List<Chai>> get chai {
    return chaiCollection.snapshots()
    .map(_chaiListFromSnapshot);
  }
  
  // get user doc stream
  Stream<UserData> get userData {
    return chaiCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}