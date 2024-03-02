import 'package:flutter/material.dart';
import 'package:snack_n_app/components/bottom_nav_bar.dart';
import 'package:snack_n_app/screens/post_page.dart';
import 'package:snack_n_app/screens/tab_views/feed.dart';
import 'package:snack_n_app/screens/tab_views/map.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _StaggeredPageState();
}


class _StaggeredPageState extends State<TabsPage> {
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
    ];

  // CUSTOM TabBarView
  final myTabBarView = TabBarView(
    children: const [
      // feed view
      FeedView(),

      // explore view
      MapView(),
    ]
  );


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, 
      child: Scaffold(
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
