import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/Screens/Welcome/Main/solo_detail_screen.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:provider/provider.dart';

import 'band_detail_screen_v2.dart';
import 'components/credits_pill.dart';

enum Category { bands, soloists }

class MusiciansMainScreen extends StatefulWidget {
  static const String screenId = 'musicians_main_screenId';

  @override
  _MusiciansMainScreenState createState() => _MusiciansMainScreenState();
}

class _MusiciansMainScreenState extends State<MusiciansMainScreen> {
  Widget _buildRatingStars(int rating) {
    List<Widget> stars = [];
    if (rating > 5) {
      rating = 5;
    }

    for (int i = 0; i < rating; i++) {
      stars.add(const Icon(
        Icons.star,
        color: kAccent,
        size: 18,
      ));
    }
    return Row(children: stars);
  }

  // Producer producer = Producer();
  // List<Producer> producers = [
  //   Producer(
  //       imageUrl: 'assets/images/producer_detail.png',
  //       name: 'Kimo Beats',
  //       credits: ['Boboo', 'Lil Kaytee'],
  //       genre: 'Trap, Electronic',
  //       rating: 1),
  //   Producer(
  //       imageUrl: 'assets/images/producer.jpg',
  //       name: 'Jonas Ahedor',
  //       credits: [
  //         'Siisi Baidoo',
  //         'Joe Mettle',
  //       ],
  //       genre: 'Gospel',
  //       price: 30,
  //       rating: 4),
  //   Producer(
  //       imageUrl: 'assets/images/kwanpa_guitar.png',
  //       name: 'Andy',
  //       credits: ['Sarkodie', 'Stonebuoy'],
  //       genre: 'Highlife, Palmwine',
  //       rating: 3),
  // ];
  ProType proType;
  String dropdownValue = 'All Production Pros';
  Color activeColour = kPrimaryColour;
  Color inActiveColour = Colors.transparent;

  @override
  void initState() {
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: false);
    proType = modelNotifier.proType;

    if (proType == ProType.producer) {
      dropdownValue = 'Music Producers';
    } else if (proType == ProType.session) {
      dropdownValue = 'Session Musicians';
    } else if (proType == ProType.mixing) {
      dropdownValue = 'Mixing & Mastering';
    }
    if (proType == ProType.all) {
      dropdownValue = 'All Production Pros';
    }

    if (modelNotifier.musicianType == MusicianType.band) {
      selectedCategory = Category.bands;
    } else if (modelNotifier.musicianType == MusicianType.soloist) {
      selectedCategory = Category.soloists;
    }
    super.initState();
  }

  Category selectedCategory = Category.bands;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    const double _filterContainerHeight = 55.0;
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: kInactiveColour,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 2.0),
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: AnimatedCrossFade(
                      firstChild:
                          HeaderImage(imageUrl: 'assets/images/band_head.jpg'),
                      secondChild:
                          HeaderImage(imageUrl: 'assets/images/solo_head.jpg'),
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: selectedCategory == Category.bands
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      color: Colors.black.withOpacity(0.2),
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_outlined),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: _size.width * 0.10,
                  right: _size.width * 0.10,
                  top: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(6, 0),
                              blurRadius: 9,
                              spreadRadius: 1,
                              color: kInactiveColour.withOpacity(0.4))
                        ],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20))),
                    height: _filterContainerHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = Category.bands;
                              });
                              debugPrint('Bands selected');
                            },
                            child: FilterButton(
                              text: 'Bands',
                              containerColour:
                              selectedCategory == Category.bands
                                  ? activeColour
                                  : inActiveColour,
                              textColour: selectedCategory == Category.bands
                                  ? Colors.white
                                  : Colors.grey[700],
                              shadow: selectedCategory == Category.bands
                                  ? kFilterButtonShadow
                                  : kNoShadow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = Category.soloists;
                              });
                              debugPrint('Soloists selected');
                            },
                            child: FilterButton(
                              text: 'Soloists',
                              containerColour:
                              selectedCategory == Category.soloists
                                  ? activeColour
                                  : inActiveColour,
                              textColour: selectedCategory == Category.soloists
                                  ? Colors.white
                                  : Colors.grey[700],
                              shadow: selectedCategory == Category.soloists
                                  ? kFilterButtonShadow2
                                  : kNoShadow,
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
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemCount: selectedCategory == Category.bands
                    ? modelNotifier.liveBandList.length
                    : modelNotifier.soloMusicianList.length,
                itemBuilder: (BuildContext context, int index) {
                  final liveBand = modelNotifier.liveBandList[index];
                  var soloists = modelNotifier.soloMusicianList;
                  return InkWell(
                    onTap: () {
                      if (selectedCategory == Category.bands) {
                        print('hey, you tapped on a band');
                        modelNotifier.currentLiveBand =
                            modelNotifier.liveBandList[index];
                        Navigator.pushNamed(context, BandDetailScreen.screenId);
                      } else {
                        print('hey, you tapped on a soloist');
                        modelNotifier.currentSoloMusician =
                            modelNotifier.soloMusicianList[index];
                        Navigator.pushNamed(context, SoloDetailScreen.screenId);
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(30.0, 5.0, 20.0, 5.0),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: kTextFieldContainerShadow),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                100.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 120,
                                          child: Text(
                                            selectedCategory == Category.bands
                                                ? liveBand.name
                                                : soloists[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          child: Text(
                                            selectedCategory == Category.bands
                                                ? liveBand.genre
                                                : soloists[index].role,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '\$${selectedCategory == Category.bands ? liveBand.charge.toString() : soloists[index].charge.toString()}',
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'min per gig',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: _buildRatingStars(
                                    selectedCategory == Category.bands
                                        ? liveBand.ratingScore
                                        : soloists[index].rating,
                                  ),
                                ),
                                CreditsPill.generateCreditPill(
                                    selectedCategory == Category.bands
                                        ? liveBand.credits
                                        : soloists[index].credits,
                                    3,
                                    22)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 5,
                          bottom: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 0),
                                      blurRadius: 9,
                                      spreadRadius: 1,
                                      color: kInactiveColour.withOpacity(0.4))
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: selectedCategory == Category.bands
                                  ? CachedNetworkImage(
                                      width: 110,
                                      fit: BoxFit.cover,
                                      imageUrl: liveBand.media[1],
                                      placeholder: (context, loading) {
                                        return Center(
                                          child: SpinKitChasingDots(
                                            color: kSecondaryColour,
                                          ),
                                        );
                                      },
                                    )
                                  : CachedNetworkImage(
                                      width: 110,
                                      fit: BoxFit.cover,
                                      imageUrl: soloists[index].media[1],
                                      placeholder: (context, loading) {
                                        return Center(
                                          child: SpinKitChasingDots(
                                            color: kSecondaryColour,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final String imageUrl;

  HeaderImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width,
        child: Image(
          image: ResizeImage(AssetImage(imageUrl), width: 300, height: 200),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final Color containerColour;
  final List<BoxShadow> shadow;
  final Color textColour;
  final String text;

  const FilterButton({this.containerColour, this.shadow, this.textColour, this.text});

  @override
  Widget build(BuildContext context) {
    const double _filterContainerHeight = 55.0;
    return Container(
        height: _filterContainerHeight,
        decoration: BoxDecoration(
            color: containerColour,
            boxShadow: shadow,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: textColour, fontWeight: FontWeight.w600))));
  }
}
