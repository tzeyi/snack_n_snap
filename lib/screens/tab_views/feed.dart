import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// custom picture grid
class FeedView extends StatelessWidget {
  const FeedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: MasonryGridView.builder(
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: // Image(image: AssetImage('assets/images/image${(index + 1).toString()}.jpeg')),
            Stack(
              children: 
                [
                  Image(
                    image: AssetImage('assets/images/image${(index + 1).toString()}.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: [0.3, 0.5],
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                          ]
                        )
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.favorite,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      )
                    ),
                  ),
              ]
          )
        )
      ),
    );
  }
}