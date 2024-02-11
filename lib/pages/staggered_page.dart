import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    return DefaultTabController(
      length: 3, 
      child:Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
              // tab bar
              TabBar(
                tabs: myTabs,
              ),

              // tab bar view
              Expanded(
                child: myTabBarView,
              )

            ]
          ),
        ),
      );
  }
}


// custom picture grid
class FeedView extends StatelessWidget {
  const FeedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('lib/images/image${(index + 1).toString()}.jpeg')
        ),
        
      ),
    );
  }
}