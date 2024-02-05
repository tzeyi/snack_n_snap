import 'package:flutter/material.dart';
import 'package:snack_n_app/components/button.dart';
import 'package:snack_n_app/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  // text editing controllers

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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

                  // email textfield
                  MyTextField(
                    controller: emailTextController, 
                    hintText: "Email",
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // sign in button
                  MyButton(
                    onTap: () {}, 
                    text: 'Sign In',
                  ),

                  const SizedBox(height: 10),

                  // register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        )
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: () {}, 
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