import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snack_n_app/components/button.dart';
import 'package:snack_n_app/components/text_field.dart';
import 'package:snack_n_app/helper/helper_functions.dart';
import 'package:snack_n_app/services/authentication/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;  // toggle to sign up page
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user from firebase
  void loginUser() async {
    // display loading circle
    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // sign user in
    try {
      await Authentication()
        .login(email: emailController.text, password: passwordController.text);

      if (context.mounted) Navigator.pop(context);
    }
    // display errors
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayErrorToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cafe1.jpg"),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 120, horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 1. Logo
                    Icon(
                      Icons.person,
                      size: 80,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    
                    const SizedBox(height: 25),
          
                    // 2. Welcome back message
                    Text(
                      "welcome",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),                
                    ),
                  
                    // spacer
                    const SizedBox(height: 25),
          
                    // 3. email textfield
                    MyTextField(
                      controller: emailController, 
                      hintText: "Email",
                      obscureText: false,
                    ),
          
                    const SizedBox(height: 10),
          
                    // 4. password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
          
                    const SizedBox(height: 10),
          
                    // 5. forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        )
                      ]
                    ),
          
                    const SizedBox(height: 10),
          
                    // 6. sign in button
                    MyButton(
                      onTap: loginUser, 
                      text: 'Sign In',
                    ),
          
                    const SizedBox(height: 10),
          
                    // 7. register page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          // style: TextStyle(
                          //   color: Theme.of(context).colorScheme.inversePrimary,
                          // )
                        ),
          
                        const SizedBox(width: 4),
          
                        GestureDetector(
                          onTap: widget.onTap, 
                          child: const Text(
                            "Register now", 
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