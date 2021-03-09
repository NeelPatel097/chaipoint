import 'package:chaipoint/models/user_new.dart';
import 'package:chaipoint/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  NewUser _userFromFirebaseUser(User user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }
  //  auth change user stream
  Stream<NewUser> get user {
    return _auth.authStateChanges()
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }
  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and passowrd
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new member', 100);
      return _userFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
        return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
        return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}