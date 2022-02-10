import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/routes.dart';
import 'package:gigmate/ui/widgets/card_header_text.dart';
import 'package:gigmate/ui/widgets/gig_solo_card.dart';
import 'package:gigmate/ui/widgets/pro_gig_card.dart';
import 'package:gigmate/ui/screens/others/studio_main_screen.dart';
import 'package:gigmate/ui/widgets/gig_card.dart';
import 'package:gigmate/ui/widgets/persistent_search_bar.dart';
import 'package:gigmate/core/models/model_api.dart';
import 'package:gigmate/core/providers/model_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../widgets/categories_widget.dart';
import '../../../utils/constants.dart';
import '../others/band_detail_screen_v2.dart';
import '../others/musicians_main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    final scrollableCardContainerSize = _size.height * 0.38;
    final ModelNotifier modelNotifier =
    Provider.of<ModelNotifier>(context, listen: false);
    final ModelApi _modelApi = ModelApi();


    Future getModels(){
      _modelApi.getProducers(modelNotifier);
      _modelApi.getLiveBands(modelNotifier);
      return _modelApi.getSoloMusicians(modelNotifier);
    }

    return Scaffold(
      body: FutureBuilder(
        future: getModels(),
        builder:
            (context, snapshot) {
          /// The snapshot data type have to be same of the result of your web service method
          if (snapshot.connectionState == ConnectionState.done) {
            /// When the result of the future call respond and has data show that data
            return Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: SafeArea(
                        child: BuildSearchBar(),
                      ),
                    )
                  ],
                ),
                Container(
                  height: _size.height * 0.72,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CategoriesWidget(),
                        const SizedBox(
                          height: 15,
                        ),
                        CardHeaderText(
                          leading: 'Featured National Partners',
                          trailing: InkWell(
                            onTap: () =>
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          modelNotifier.musicianType =
                                              MusicianType.band;
                                          return MusiciansMainScreen();
                                        })),
                            child: Text('SEE ALL',
                                style: TextStyle(
                                  color: kAccent,
                                )),
                          ),
                        ),
                        Container(
                          //Container for scrollable row
                          //height: scrollableCardContainerSize,
                            height: _size.height * kGigSoloCardContainerHeight,
                            padding: const EdgeInsets.only(left: 5.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: modelNotifier.liveBandList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var _band = modelNotifier.liveBandList[index];
                                return InkWell(
                                  onTap: () {
                                    modelNotifier.currentLiveBand =
                                    modelNotifier.liveBandList[index];
                                    Navigator.pushNamed(
                                        context, BandDetailScreen2.screenId);
                                  },
                                  child: GigCard(
                                    size: _size,
                                    imageUrl: _band.media[1],
                                    cardTitle: _band.name,
                                    description: _band.description,
                                    location: _band.location,
                                    rating: 4.5,
                                    budget: '\$\$\$\$\$',
                                  ),
                                );
                              },
                            )),
                        CardHeaderText(
                          leading: 'Popular Solo Musicians',
                          trailing: InkWell(
                            onTap: () =>
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          modelNotifier.musicianType =
                                              MusicianType.soloist;
                                          return MusiciansMainScreen();
                                        })),
                            child: Text('SEE ALL',
                                style: TextStyle(
                                  color: kAccent,
                                )),
                          ),
                        ),
                        Container(
                          //Container for scrollable row
                            height: _size.height * kGigSoloCardContainerHeight,
                            padding: const EdgeInsets.only(left: 5.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: modelNotifier.soloMusicianList
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GigSoloCard(
                                      size: _size,
                                      name:
                                      modelNotifier.soloMusicianList[index]
                                          .name,
                                      imageUrl: modelNotifier
                                          .soloMusicianList[index].media[1]
                                          .toString() ??
                                          'assets/images/kwame.jpg',
                                      role:
                                      modelNotifier.soloMusicianList[index]
                                          .role,
                                      onTap: () {
                                        modelNotifier.currentSoloMusician =
                                        modelNotifier.soloMusicianList[index];
                                        Navigator.pushNamed(
                                            context, PageRoutes.solo_detail);
                                      });
                                })),
                        CardHeaderText(
                          leading: 'Places & Events',
                          trailing: null,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: _size.height * 0.02),
                          width: _size.width * 0.95,
                          height: _size.height * 0.60,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset.fromDirection(2, 5),
                                    blurRadius: 9,
                                    spreadRadius: 2,
                                    color: kShadowColour)
                              ],
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/kwashibu.jpg'))),
                          child: Column(
                            children: [
                              Align(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 100.h, horizontal: 20),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: const TextSpan(children: [
                                          TextSpan(
                                              text: 'Go',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' Out',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'Find your next chill-out venues, concerts,\n'
                                            'gospel shows and live music events',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pushNamed(
                                                context, PageRoutes.places),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset.fromDirection(
                                                      8, 2),
                                                  color: kPurpleTextColour,
                                                  blurRadius: 30,
                                                  spreadRadius: 5)
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                5),
                                          ),
                                          width: 100,
                                          height: 30,
                                          child: const Center(
                                            child: Text('Explore',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: kPurpleTextColour)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            //Card category text
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Music Production Pros',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: kPurpleTextColour,
                                      fontFamily: 'PlayFair')),
                              Icon(
                                Icons.arrow_right_alt,
                                color: kAccent,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: _size.height * 0.40,
                          child: CarouselSlider(
                              items: [
                                ProGigCard(
                                  onTap: () {
                                    modelNotifier.proType = ProType.producer;
                                    Navigator.pushNamed(
                                        context, StudioMainScreen.screenId);
                                  },
                                  size: _size,
                                  imageUrl: 'assets/images/producer.jpg',
                                  cardTitle: 'Producers',
                                  description:
                                  'Hire and work with top producers ready to turn your song or idea into a hit',
                                ),
                                ProGigCard(
                                  onTap: () {
                                    modelNotifier.proType = ProType.session;
                                    Navigator.pushNamed(
                                        context, StudioMainScreen.screenId);
                                  },
                                  size: _size,
                                  imageUrl: 'assets/images/session.jpg',
                                  cardTitle: 'Session Musicians',
                                  description:
                                  'Custom drum tracks, guitarists, bass players, '
                                      'string arrangers, and countless top instrumentalists to hire',
                                ),
                                ProGigCard(
                                  onTap: () {
                                    modelNotifier.proType = ProType.mixing;
                                    Navigator.pushNamed(
                                        context, StudioMainScreen.screenId);
                                  },
                                  size: _size,
                                  imageUrl: 'assets/images/mixing.jpg',
                                  cardTitle: 'Mixing & Mastering Engineers',
                                  description:
                                  'Hire hit-making mixing engineers that will transform your recorded tracks into release-ready songs',
                                ),
                              ],
                              options: CarouselOptions(
                                height: _size.height * 0.36,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if(snapshot.hasError) {
            return Container(child: Center(child: Text('Oops...something happened'),));
          }
            /// While is no data show this
            return Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: SafeArea(
                        child: BuildSearchBar(),
                      ),
                    )
                  ],
                ),
                Container(
                  height: _size.height * 0.72,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        CategoriesWidget(),
                        const SizedBox(
                          height: 15,
                        ),
                        CardHeaderText(
                          leading: 'Featured National Partners',
                          trailing: ShimmerSeeAll()
                        ),
                        Container(
                          color: Colors.transparent,
                          //Container for scrollable row
                          //height: scrollableCardContainerSize,
                            height: _size.height * kGigSoloCardContainerHeight,
                            padding: const EdgeInsets.only(left: 5.0),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(

                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.grey[100],
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              color: Colors.grey[300]),
                                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                          height: _size.height * kGigSoloCardContainerHeight - 5,
                                          width: _size.width * 0.8
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: kShadow2,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10)),
                                            color: Colors.grey[300],
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          margin: EdgeInsets.only(
                                              top: 140,
                                              left: 5,
                                              right: 5,
                                              bottom: 5), //detail container height
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Shimmer.fromColors(
                                                      baseColor: Colors.grey[300],
                                                      highlightColor: Colors.grey[100],
                                                      child: Container( height: 10, color: Colors.grey[300],))
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[300],
                                                highlightColor: Colors.grey[100],
                                                child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2),
                                                    height: 40,
                                                    child: Column(
                                                      children: [
                                                        ShimmerTexts(),
                                                        ShimmerTexts()
                                                      ],
                                                    )
                                                ),
                                              ),
                                              Divider(
                                                color: kSecondaryColour,
                                                height: 0.1,
                                                thickness: 0.3,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Shimmer.fromColors(child: Container(width: 20, height: 10, color: Colors.grey[300],), baseColor: Colors.grey[300], highlightColor: Colors.grey[100]),
                                                        ShimmerSeeAll(),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        ShimmerSeeAll()
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      )
                                    ],
                                  );
                              },
                            )),
                        CardHeaderText(
                          leading: 'Popular Solo Musicians',
                          trailing: ShimmerSeeAll()
                        ),
                        Container(
                          //Container for scrollable row
                            height: _size.height * kGigSoloCardContainerHeight,
                            padding: const EdgeInsets.only(left: 5.0),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Stack(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300],
                                          highlightColor: Colors.grey[100],
                                          child: Container(
                                            height: _size.height * kGigSoloCardContainerHeight,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: ShimmerTexts(),
                                                      alignment: Alignment.bottomLeft,
                                                    ),
                                                    Align(
                                                      child: ShimmerTexts(),
                                                      alignment: Alignment.bottomLeft,
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(top: _size.height*0.25),
                                                padding: EdgeInsets.all(1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      // image: DecorationImage(image: NetworkImage(imageUrl)),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset.fromDirection(2, 5),
                                            blurRadius: 9,
                                            spreadRadius: 2,
                                            color: kShadowColour)
                                      ],
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: _size.width * 0.46,
                                  );
                                })),
                        CardHeaderText(
                          leading: 'Places & Events',
                          trailing: ShimmerSeeAll(),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: _size.height * 0.02),
                          width: _size.width * 0.95,
                          height: _size.height * 0.60,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset.fromDirection(2, 5),
                                    blurRadius: 9,
                                    spreadRadius: 2,
                                    color: kShadowColour)
                              ],
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/kwashibu.jpg'))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
        },
      ),

    );
  }
}

class ShimmerSeeAll extends StatelessWidget {
  const ShimmerSeeAll({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
            width: 40,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),)));
  }
}

class ShimmerTexts extends StatelessWidget {
  const ShimmerTexts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(height: 10, color: Colors.grey[300]));
  }
}
