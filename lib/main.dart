import 'package:flutter/material.dart';
import 'package:snack_n_app/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snack_n_app/auth/login_or_register.dart';
import 'package:snack_n_app/screens/home_page.dart';
import 'package:snack_n_app/screens/post_page.dart';
import 'package:snack_n_app/screens/profile_page.dart';
import 'package:snack_n_app/screens/tabs_page.dart';
import 'package:snack_n_app/screens/users_page.dart';
import 'package:snack_n_app/data/theme/dark_mode.dart';
import 'package:snack_n_app/data/theme/light_mode.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack n Snap',
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/post_page': (context) => PostPage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => UsersPage(),
        '/staggered_page': (context) => TabsPage(),
      }
    );
  }
}



