import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Main/components/category_circle_container.dart';
import 'package:gigmate/Screens/Welcome/Main/places_screen.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:provider/provider.dart';

import '../musicians_main_screen.dart';
import '../studio_main_screen.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelNotifier = Provider.of<ModelNotifier>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FlatButton(
            padding: EdgeInsets.zero,
            splashColor: kSecondaryColour,
            onPressed: () {
              Navigator.pushNamed(context, MusiciansMainScreen.screenId);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/band.svg',
              categoryName: 'Live band',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            splashColor: kSecondaryColour,
            onPressed: () {
              Navigator.pushNamed(context, MusiciansMainScreen.screenId);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/saxophonist.svg',
              categoryName: 'Solo',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            splashColor: kSecondaryColour,
            onPressed: () {
              modelNotifier.proType = ProType.all;
              Navigator.pushNamed(context, StudioMainScreen.screenId);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/studio.svg',
              iconWidth: 50,
              categoryName: 'Studio',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            splashColor: kSecondaryColour,
            onPressed: () =>
                Navigator.pushNamed(context, PlacesScreen.screenId),
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/concert.svg',
              iconWidth: 55,
              categoryName: 'Event',
            ),
          ),
        ],
      ),
    );
  }
}
