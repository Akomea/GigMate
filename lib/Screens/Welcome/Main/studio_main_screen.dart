import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:provider/provider.dart';

import './components/credits_pill.dart';

class StudioMainScreen extends StatefulWidget {
  static const String screenId = 'studio_main_screenId';

  @override
  _StudioMainScreenState createState() => _StudioMainScreenState();
}

class _StudioMainScreenState extends State<StudioMainScreen> {
  Widget _buildRatingStars(int rating) {
    final List<Widget> stars = [];

    for (int i = 0; i <= rating; i++) {
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
  //       imageUrl: 'assets/images/jonas.JPG',
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ModelNotifier modelNotifier =
    Provider.of<ModelNotifier>(context, listen: false);

    AssetImage getImage() {
      switch (proType) {
        case ProType.producer:
          return const AssetImage('assets/images/p2.jpg');
          break;
        case ProType.session:
          return const AssetImage('assets/images/tm.jpg');
          break;
        case ProType.mixing:
          return const AssetImage('assets/images/mm.jpg');
          break;
        case ProType.all:
          return const AssetImage('assets/images/producer_detail.png');
          break;
      }
      return null;
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(
                        color: kInactiveColour,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: getImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        proType == ProType.producer
                            ? 'Top Producers'
                            : proType == ProType.session
                            ? 'Tracking Musicians'
                            : proType == ProType.mixing
                            ? 'Hit Standard Pros'
                            : 'Finish that Song',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          proType == ProType.producer
                              ? 'Hire top producers ready to make a hit out of your song idea'
                              : proType == ProType.session
                              ? 'Hand-picked musicians to record custom tracks on your song'
                              : proType == ProType.mixing
                              ? 'Hire hit-making mixing engineers to transform your recorded tracks into radio-ready songs'
                              : 'Find your next music production professional to work with',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    Row(
                      children: [
                        DropdownButton(
                          value: dropdownValue,
                          dropdownColor: Colors.black,
                          focusColor: kSecondaryColour,
                          elevation: 16,
                          style: const TextStyle(color: Colors.white),
                          underline: Container(),
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          items: <String>[
                            'All Production Pros',
                            'Music Producers',
                            'Session Musicians',
                            'Mixing & Mastering'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              switch (value) {
                                case 'All Production Pros':
                                  proType = ProType.all;
                                  break;
                                case 'Music Producers':
                                  proType = ProType.producer;
                                  break;
                                case 'Session Musicians':
                                  proType = ProType.session;
                                  break;
                                case 'Mixing & Mastering':
                                  proType = ProType.mixing;
                                  break;
                              }
                              dropdownValue = value.toString();
                              debugPrint(value.toString());
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemCount: modelNotifier.producersList.length,
                itemBuilder: (BuildContext context, int index) {
                  final pro = modelNotifier.producersList[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 5.0, 20.0, 5.0),
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
                                          pro.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Text(
                                          pro.genre,
                                          style: TextStyle(color: Colors.grey),
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
                                        '\$${pro.price.toString()}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'per hour',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 2),
                                child: _buildRatingStars(pro.rating),
                              ),
                              CreditsPill.generateCreditPill(pro.credits, 3, 22)
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
                                    offset: Offset(6, 0),
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                    color: kInactiveColour.withOpacity(0.4))
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: pro.imageUrl != null
                                ? CachedNetworkImage(
                                    filterQuality: FilterQuality.low,
                                    width: 110,
                                    placeholder: (context, loading) {
                                      return Center(
                                          child: SpinKitChasingDots(
                                        color: kSecondaryColour,
                                      ));
                                    },
                                    fit: BoxFit.cover,
                                    imageUrl: pro.imageUrl)
                                : Container(),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
