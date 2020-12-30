import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gigmate/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../post_gig_screen.dart';

class PostGigCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _iconSize = 40;
    Size _size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PostGigCircleContainer(
          onTapped: () {
            Navigator.pop(context);
            showCupertinoModalBottomSheet(
              expand: true,
              barrierColor: Colors.black54,
              elevation: 8,
              context: context,
              builder: (context) {
                return PostGigScreen(size: _size);
              },
            );
          },
          bgColour: kSecondaryColour,
          imageUrl: 'assets/icons/band.svg',
          iconWidth: _iconSize,
          categoryName: 'Live band',
        ),
        PostGigCircleContainer(
          opacity: 0.5,
          imageUrl: 'assets/icons/saxophonist.svg',
          iconWidth: _iconSize,
          categoryName: 'Solo',
        ),
        PostGigCircleContainer(
          opacity: 0.5,
          imageUrl: 'assets/icons/studio.svg',
          iconWidth: _iconSize,
          categoryName: 'Studio',
        ),
      ],
    );
  }
}

class PostGigCircleContainer extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final double iconWidth;
  final Color bgColour;
  final double opacity;
  final Function onTapped;

  PostGigCircleContainer({
    this.imageUrl,
    this.categoryName,
    this.iconWidth,
    this.bgColour = Colors.white,
    this.opacity = 1.0,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(boxShadow: kShadow, shape: BoxShape.circle),
            margin: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: onTapped,
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
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
