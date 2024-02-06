import 'package:flutter/material.dart';
import 'package:snack_n_app/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snack n Snap"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        ),
        drawer: MyDrawer(),
    );
  }
}