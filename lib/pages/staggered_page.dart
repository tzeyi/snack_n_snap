import 'package:flutter/material.dart';
import 'package:snack_n_app/components/bottom_nav_bar.dart';
import 'package:snack_n_app/pages/tab_views/feed_view.dart';

class StaggeredPage extends StatefulWidget {
  const StaggeredPage({super.key});

  @override
  State<StaggeredPage> createState() => _StaggeredPageState();
}


class _StaggeredPageState extends State<StaggeredPage> {
  // CUSTOM tabs
  final List<Widget> myTabs = const [
      // feed tab
      Tab(
        text: "feed",
      ),
      // explore tab
      Tab(
        text: "explore",
      ),
      // friends tab
      Tab(
        text: "friends",
      ),
    ];

  // CUSTOM TabBarView
  final myTabBarView = TabBarView(
    children: const [
      // feed view
      FeedView(),

      // explore view
      Text("buffer"),

      // friends view
      Text("buffer"),
    ]
  );


  @override
  Widget build(BuildContext context) {

    // index used to keep track of bottom nav bar
    int selectedIndex = 0;


    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        appBar: AppBar(),
        body: ListView(
          children: [
              // tab bar
              TabBar(
                tabs: myTabs,
              ),

              // tab bar view
              SizedBox(
                height: 1000,
                child: myTabBarView,
              )

            ]
          ),
        ),
      );
  }
}
