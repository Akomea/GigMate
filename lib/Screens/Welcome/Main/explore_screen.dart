import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Main/components/card_header_text.dart';
import 'package:gigmate/Screens/Welcome/Main/components/gig_solo_card.dart';
import 'package:gigmate/Screens/Welcome/Main/components/pro_gig_card.dart';
import 'package:gigmate/components/gig_card.dart';
import 'package:gigmate/components/persistent_search_bar.dart';
import 'package:gigmate/model_api.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:provider/provider.dart';

import './components/categories_widget.dart';
import './studio_main_screen.dart';
import '../../../constants.dart';
import 'band_detail_screen_v2.dart';
import 'musicians_main_screen.dart';
import 'places_screen.dart';
import 'solo_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final scrollableCardContainerSize = _size.height * 0.38;
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: true);

    return Scaffold(
      body: Column(
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
            height: _size.height * 0.730,
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
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        modelNotifier.musicianType = MusicianType.band;
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
                                  context, BandDetailScreen.screenId);
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
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        modelNotifier.musicianType = MusicianType.soloist;
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
                          itemCount: modelNotifier.soloMusicianList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GigSoloCard(
                                size: _size,
                                name:
                                    modelNotifier.soloMusicianList[index].name,
                                imageUrl: modelNotifier
                                        .soloMusicianList[index].media[1]
                                        .toString() ??
                                    'assets/images/kwame.jpg',
                                role:
                                    modelNotifier.soloMusicianList[index].role,
                                onTap: () {
                                  modelNotifier.currentSoloMusician =
                                      modelNotifier.soloMusicianList[index];
                                  Navigator.pushNamed(
                                      context, SoloDetailScreen.screenId);
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
                            image: AssetImage('assets/images/kwashibu.jpg'))),
                    child: Column(
                      children: [
                        Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _size.height*0.2, horizontal: 20),
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
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () => Navigator.pushNamed(
                                      context, PlacesScreen.screenId),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset.fromDirection(8, 2),
                                            color: kPurpleTextColour,
                                            blurRadius: 30,
                                            spreadRadius: 5)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
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
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      //Card category text
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Discover Music Production Pros',
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
                          height: _size.height * 0.35,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final ModelApi _modelApi = ModelApi();

  @override
  void initState() {
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: false);
    _modelApi.getSoloMusicians(modelNotifier);
    _modelApi.getLiveBands(modelNotifier);
    _modelApi.getProducers(modelNotifier);
    super.initState();
  }
}
