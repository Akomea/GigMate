import 'package:flutter/material.dart';
import 'package:gigmate/routes.dart';
import 'package:gigmate/ui/widgets/category_circle_container.dart';
import 'package:gigmate/ui/screens/others/musicians_main_screen.dart';
import 'package:gigmate/ui/screens/others/places_screen.dart';
import 'package:gigmate/ui/screens/others/studio_main_screen.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:gigmate/core/providers/model_notifier.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelNotifier = Provider.of<ModelNotifier>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              modelNotifier.musicianType = MusicianType.band;
              Navigator.pushNamed(context, PageRoutes.musicians_main);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/band.svg',
              categoryName: 'Live band',
            ),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              modelNotifier.musicianType = MusicianType.soloist;
              Navigator.pushNamed(context, PageRoutes.musicians_main);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/saxophonist.svg',
              categoryName: 'Solo',
            ),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              modelNotifier.proType = ProType.all;
              Navigator.pushNamed(context, PageRoutes.studio_main);
            },
            child: PostGigCategoryCircleContainer(
              imageUrl: 'assets/icons/studio.svg',
              iconWidth: 50,
              categoryName: 'Studio',
            ),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.places),
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
