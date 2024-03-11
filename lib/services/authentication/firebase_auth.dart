import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snack_n_app/helper/helper_functions.dart';
import 'package:snack_n_app/services/database/firestore.dart';
import 'package:snack_n_app/services/model/imageModel.dart';


class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> signIn({required String email, required String password}) async {
      return await _auth.signInWithEmailAndPassword(
          email: email.trim(), 
          password: password.trim()
      );

  }

  Future<UserCredential?> signUp({
    required String username,
    required String email, 
    required String password,
    required File profilePic
    }) async {
      String URL;
    try{
      // create user with email and password
      UserCredential? user = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // upload profile pic on storage
      if (profilePic.path.isEmpty) {
        URL = '';
      } else {
        URL = await ImageModel().uploadImageToStorage('profilePic', profilePic);
      }

      // create user information in cloud firestore
      await FirestoreDatabase().createUser(
        email: email, 
        username: username, 
        profilePic: URL == ''? 
                'https://firebasestorage.googleapis.com/v0/b/instagram-8a227.appspot.com/o/person.png?alt=media&token=c6fcbe9d-f502-4aa1-8b4b-ec37339e78ab'
                : URL,
      );

      return user;
    } on FirebaseException catch (e) {
      throw Exception(e.message.toString());
    }
      
  }
}
