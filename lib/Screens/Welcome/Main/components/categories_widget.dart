import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Main/components/category_circle_container.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PostGigCategoryCircleContainer(
            imageUrl: 'assets/icons/band.svg',
            categoryName: 'Live band',
          ),
          PostGigCategoryCircleContainer(
            imageUrl: 'assets/icons/saxophonist.svg',
            categoryName: 'Solo',
          ),
          PostGigCategoryCircleContainer(
            imageUrl: 'assets/icons/studio.svg',
            iconWidth: 50,
            categoryName: 'Studio',
          ),
          PostGigCategoryCircleContainer(
            imageUrl: 'assets/icons/concert.svg',
            iconWidth: 55,
            categoryName: 'Event',
          ),
        ],
      ),
    );
  }
}
