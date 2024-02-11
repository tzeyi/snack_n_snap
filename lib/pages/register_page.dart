import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snack_n_app/components/button.dart';
import 'package:snack_n_app/components/text_field.dart';
import 'package:snack_n_app/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap; // toggle to sign in page
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

    // create a user document and add to firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null){
      await FirebaseFirestore.instance
        .collection("Users")
        .doc(userCredential.user!.email)
        .set({
          'email': userCredential.user!.email,
          'username': usernameController.text,
      });
    }
  }
  
  void registerUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // match password is correct
    if (passwordController.text != confirmPasswordController.text){
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayErrorToUser("Passwords don't match!", context);
    }

    else {
      // create the user 
      try {
        UserCredential? userCredential = 
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);

        // create a user document and add to firestore
        createUserDocument(userCredential);

        // pop loading circle
        Navigator.pop(context);

      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        // display error message
        displayErrorToUser(e.code, context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  
                  // Welcome back message
                  Text(
                    "welcome",
                  ),

                  // spacer
                  SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: usernameController, 
                    hintText: "Username",
                    obscureText: false,
                  ),
                
                  // spacer
                  SizedBox(height: 10),

                  // email textfield
                  MyTextField(
                    controller: emailController, 
                    hintText: "Email",
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  // confirm password textfield
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Pasword',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // sign in button
                  MyButton(
                    onTap: registerUser, 
                    text: 'Sign Up',
                  ),

                  const SizedBox(height: 10),

                  // register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color:Theme.of(context).colorScheme.inversePrimary,
                        )
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now", 
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,      
                          ),
                        ),
                      ),
                    ]
                  ),
              ],
            ),
          ),
  
        ),
      ),
    );
  }
}