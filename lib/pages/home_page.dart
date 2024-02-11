import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snack_n_app/components/drawer.dart';
import 'package:snack_n_app/components/list_tile.dart';
import 'package:snack_n_app/components/post_button.dart';
import 'package:snack_n_app/components/text_field.dart';
import 'package:snack_n_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // access to firestore
  final FirestoreDatabase database = FirestoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // post message
  void postMessage() {
    // post message if textfield is not empty
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // clear controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Snack n Snap"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // Textfield box for user to type
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                // textfield
                Expanded(
                  child: MyTextField(
                    hintText: "Say something..",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),

                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          // POSTS Request
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // display loading circle
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // get all posts
              final posts = snapshot.data!.docs;

              // no data
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts..")
                  ),
                );
              }

              // return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // retrieve individual post
                    final post = posts[index];

                    // get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];
                    // return as a list tile
                    return MyListTile(title: message, subtitle: userEmail);
                  },
                ),
              );
            })

        ],
      )
    );
  }
}