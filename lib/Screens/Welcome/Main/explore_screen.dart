import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Main/components/card_header_text.dart';
import 'package:gigmate/Screens/Welcome/Main/components/categories_widget.dart';
import 'package:gigmate/Screens/Welcome/Main/components/gig_solo_card.dart';
import 'package:gigmate/Screens/Welcome/Main/components/pro_gig_card.dart';
import 'package:gigmate/components/gig_card.dart';
import 'package:gigmate/components/persistent_search_bar.dart';

import '../../../constants.dart';
import 'detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var scrollableCardContainerSize = _size.height * 0.38;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            height: _size.height * 0.769,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CategoriesWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  CardHeaderText(
                    leading: 'Featured National Partners',
                    trailing: Icons.arrow_right_alt_rounded,
                  ),
                  Container(
                    //Container for scrollable row
                    height: scrollableCardContainerSize,
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DetailScreen.screenId);
                            },
                            child: GigCard(
                              size: _size,
                              imageUrl: 'assets/images/kwanpa.jpg',
                              cardTitle: 'Kwan Pa',
                              description: 'An indigenous band that performs '
                                  'and promotes the Palmwine music of Ghana in various forms',
                              location: 'Accra',
                              rating: 4.5,
                              budget: '\$\$\$\$\$',
                            ),
                          ),
                          GigCard(
                            size: _size,
                            imageUrl: 'assets/images/kyekyeku1.jpg',
                            cardTitle: 'Kyekyeku',
                            description:
                                'My music is integrally Ghanaian highlife with a tangent to Afrobeat. A revival of the vintage sounds from the 1970s',
                            location: 'Accra',
                            rating: 4.5,
                            budget: '\$\$\$\$\$',
                          ),
                          GigCard(
                            size: _size,
                            imageUrl: 'assets/images/kwashibu2.jpg',
                            cardTitle: 'Kwashibu Area Band',
                            description:
                                'Known as “The Golden Voice Of Africa”, Pat Thomas is a true Ghanaian highlife legend',
                            location: 'Accra',
                            rating: 4.5,
                            budget: '\$\$\$\$\$',
                          ),
                        ],
                      ),
                    ),
                  ),
                  CardHeaderText(
                    leading: 'Popular Solo Musicians',
                    trailing: Icons.arrow_right_alt_rounded,
                  ),
                  Container(
                    //Container for scrollable row
                    height: _size.height * 0.35,
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: SingleChildScrollView(
                      controller: ScrollController(initialScrollOffset: 0.2),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GigSoloCard(
                            size: _size,
                            name: 'Jonas Ahedor',
                            role: 'Gospel Piano',
                            imageUrl: 'assets/images/jonas.JPG',
                          ),
                          GigSoloCard(
                            size: _size,
                            name: 'Kwame Yeboah',
                            role: 'Contemporary Guitar',
                            imageUrl: 'assets/images/kwame.jpg',
                          ),
                        ],
                      ),
                    ),
                  ),
                  CardHeaderText(
                    leading: 'Places & Events',
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 80, horizontal: 20),
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(children: [
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Find your next chill-out venues, concerts,\n'
                                  'gospel shows and live music events',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Explore',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: kPurpleTextColour)),
                                  ),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: _size.height * 0.02),
                    width: _size.width * 0.95,
                    height: _size.height * 0.60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.fromDirection(2, 5),
                              blurRadius: 9,
                              spreadRadius: 2,
                              color: kShadowColour)
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/kwashibu.jpg'))),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      //Card category text
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discover top music production pros',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
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
                            size: _size,
                            imageUrl: 'assets/images/session.jpg',
                            cardTitle: 'Session Musicians',
                            description:
                                'Custom drum tracks, guitarists, bass players, '
                                'string arrangers, and countless top instrumentalists to hire',
                          ),
                          ProGigCard(
                            size: _size,
                            imageUrl: 'assets/images/producer.jpg',
                            cardTitle: 'Producers',
                            description:
                                'Hire and work with top producers ready to turn your song or idea into a hit',
                          ),
                          ProGigCard(
                            size: _size,
                            imageUrl: 'assets/images/mixing.jpg',
                            cardTitle: 'Mixing & Mastering Engineers',
                            description:
                                'Hire hit- making mixing engineers that will transform your recorded tracks into release - ready songs',
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
}
