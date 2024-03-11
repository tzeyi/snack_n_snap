/*

Database stores posts that users have published in the app
It is stored in a collection called 'Posts' in Firebase

Each post contains;
- message
- email of user
- timestamp

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snack_n_app/services/model/userModel.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CREATE
  Future<void> CreateUser({
    required String email,
    required String username,
    required String profilePic,
  }) async {
    
    await _firebaseFirestore
        .collection('Users')
        .doc(_auth.currentUser!.uid)
        .set({
      'email': email,
      'username': username,
      'profilePic': profilePic,
    });
  }

  // GET
  Future<UserModel> getUser() async {
    try {
      final user = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      final snapuser = user.data()!;
      return UserModel(
          snapuser['email'],
          snapuser['username'],
          snapuser['profilePic']
      );
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }



}