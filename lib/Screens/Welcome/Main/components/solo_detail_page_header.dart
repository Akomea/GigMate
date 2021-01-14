import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SoloDetailPageHeader implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  SoloDetailPageHeader({this.minExtent, this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/jonas.JPG',
          fit: BoxFit.cover,
        ),
        // Positioned(
        //   child: Container(
        //     color: Colors.transparent,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Icon(
        //           Icons.arrow_back_outlined,
        //           color: Colors.white,
        //         ),
        //         Row(
        //           children: [
        //             Icon(Icons.ios_share, color: Colors.white),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Icon(Icons.favorite_border_rounded, color: Colors.white),
        //             SizedBox(
        //               width: 10,
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),

        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Lorem ipsum',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider get vsync => null;
}
