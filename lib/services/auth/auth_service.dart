import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get instance of firestore
  final firestore = FirebaseFirestore.instance;


  //get the current user
  User? getcurrentUser() {
    return _auth.currentUser;
  }

  //sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //save user data to firestore
      await firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'online':true,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signup with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      //create user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //save user data to firestore
      await firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'online':true,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
    // Get the current user's UID
    String? uid = _auth.currentUser?.uid;

    // Sign out the user
    await _auth.signOut();

    // If UID exists, update the online status to false
    if (uid != null) {
      await firestore.collection('Users').doc(uid).update({
        'online': false,
      });
    }
  } catch (e) {
    throw Exception(e);
  }
  }
}
