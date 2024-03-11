import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snack_n_app/components/drawer.dart';
import 'package:snack_n_app/services/database/firestore.dart';
import 'package:snack_n_app/services/model/userModel.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Firestore Database instance
  final FirestoreDatabase firestoreDatabase = FirestoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<UserModel>(
        future: firestoreDatabase.getUser(), // Fetch user details
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          // Data
          else if (snapshot.hasData) {
            final UserModel user = snapshot.data!;

            return Center(
              child: Column(
                children: [
                  SizedBox(height: 25),

                  // Profile picture
                  CircleAvatar(
                    radius: 64,
                    backgroundImage:  NetworkImage(user.profilePic)
                  ),

                  Text(
                    user.username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("No Data");
          }
        },
      ),
    );
  }
}
