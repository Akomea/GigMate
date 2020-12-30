import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class PostGigCategoryCircleContainer extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final double iconWidth;
  final Color bgColour;
  final double opacity;

  PostGigCategoryCircleContainer({
    this.imageUrl,
    this.categoryName,
    this.iconWidth,
    this.bgColour = Colors.white,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                print('category tapped');
              },
              child: CircleAvatar(
                child: SvgPicture.asset(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                  width: iconWidth,
                ),
                radius: 30,
                backgroundColor: bgColour,
              ),
            ),
          ),
          Text(
            categoryName,
            style: TextStyle(
                color: kPurpleTextColour.withOpacity(0.5),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
