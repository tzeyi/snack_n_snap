import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        color: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.inversePrimary,
        tabActiveBorder: Border.all(color: Theme.of(context).colorScheme.background),
        tabBackgroundColor: Theme.of(context).colorScheme.primary,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home'
          ),
          GButton(
            icon: Icons.add,
          ),
           GButton(
            icon: Icons.person,
            text: 'Profile'
          ),
        ]
      )
    );
  }
}