import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // sign out user
  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Icon(Icons.favorite , 
                color: Theme.of(context).colorScheme.inversePrimary),
              ),
              
              const SizedBox(height: 25),
              
              // home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.inversePrimary,  
                  ),
                  title: Text("H O M E"),
                  onTap: () {
                    // pop drawer since it is already the home screen (root)
                    Navigator.pop(context);

                    // navigate to profile page
                    Navigator.pushNamed(context, '/home_page');
                  }
                ),
              ),
              
              // profile tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,  
                  ),
                  title: Text("P R O F I L E"),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  }
                ),
              ),

            ],

          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,  
              ),
              title: Text("L O G O U T"),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // log out user
                logOut();
              }
            ),
          ),

        ]
      )
    );
  }
}