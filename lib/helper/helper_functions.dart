import 'package:flutter/material.dart';

// display error message to user
void displayErrorToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),

  );
}