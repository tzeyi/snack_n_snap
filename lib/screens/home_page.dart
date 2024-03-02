import 'package:flutter/material.dart';
import 'package:snack_n_app/components/bottom_nav_bar.dart';
import 'package:snack_n_app/screens/post_page.dart';
import 'package:snack_n_app/screens/profile_page.dart';
import 'package:snack_n_app/screens/tabs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // index used to keep track of bottom nav bar
  int _selectedIndex = 0;

  // update selected index for bottom nav bar
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // list of tab pages to display
  final List<Widget> _pages = [
    TabsPage(),
    const Text("camera"),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}