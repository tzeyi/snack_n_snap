import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snack_n_app/services/model/userModel.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CREATE
  Future<void> createUser({
    required String email,
    required String username,
    required String profilePic,
  }) async {
    try {
      await _firebaseFirestore.collection('Users').doc(_auth.currentUser!.uid).set({
        'email': email,
        'username': username,
        'profilePic': profilePic,
      });
    } catch (e) {
      // Handle exceptions here
      print('Error creating user: $e');
      throw 'Failed to create user: $e';
    }
  }

  // GET
  Future<UserModel> getUser() async {
    try {
      final userSnapshot = await _firebaseFirestore.collection('Users').doc(_auth.currentUser!.uid).get();
      if (userSnapshot.exists) {
        final userData = userSnapshot.data()!;
        return UserModel(
          userData['email'],
          userData['username'],
          userData['profilePic'],
        );
      } else {
        throw 'User not found';
      }
    } catch (e) {
      // Handle exceptions here
      print('Error getting user: $e');
      throw 'Failed to get user: $e';
    }
  }
}
