import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/ui/shared_widgets/backgrounds/login_screen_background.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:gigmate/core/models/place.dart';

class PlacesScreen extends StatefulWidget {
  static final String screenId = 'places_screenId';

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<Place> places = [
    new Place(
        name: 'Zen Garden',
        rating: 4,
        type: 'Restaurant',
        event: 'Kwan Pa live on Tuesdays',
        imageUrl:
            'https://media-cdn.tripadvisor.com/media/photo-s/11/e0/d4/c4/outdoor-space.jpg'),
    new Place(
        name: 'Kiki\'s',
        rating: 3,
        type: 'Restaurant',
        event: 'Jazz music every Friday',
        imageUrl:
            'https://media-cdn.tripadvisor.com/media/photo-s/11/e0/d3/bd/entrance.jpg'),
    new Place(
        name: 'Country Lodge',
        rating: 5,
        type: 'Lodge & Restaurant',
        event: 'Raggae concert this Saturday',
        imageUrl:
            'https://coupons.com.gh//blog/assets/images/restaurants-in-accra.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 20,
                  child: Container(
                    width: 200,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Need a place to hangout ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 26)),
                        TextSpan(
                            text: 'Today?',
                            style: TextStyle(
                                color: kPrimaryColour,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                      ]),
                    ),
                  ),
                ),
                Container(
                  color: kSecondaryColour.withOpacity(0.3),
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            Container(
              height: _size.height * 0.25,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: _size.width * 0.45,
                      child:
                          PlaceMiniCard(place: places[index], places: places));
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    var place = places[index];
                    return PlaceCard(place: place, places: places);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    @required this.place,
    @required this.places,
  });

  final Place place;
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 1),
        height: _size.height * 0.4,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: kTextFieldContainerShadow),
                height: _size.height * 0.18,
                width: _size.width * 0.95,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                height: _size.height * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 24),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.business_sharp,
                          color: kAccent,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          place.type,
                          style: TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.event,
                          color: kAccent,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          place.event,
                          style: TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(6, 2),
                        blurRadius: 9,
                        spreadRadius: 1,
                        color: kInactiveColour.withOpacity(0.4))
                  ]),
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: _size.height * 0.27,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  memCacheHeight: 649,
                  memCacheWidth: 565,
                  fit: BoxFit.cover,
                  imageUrl: place.imageUrl,
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
          ],
        ));
  }
}

class PlaceMiniCard extends StatelessWidget {
  const PlaceMiniCard({
    @required this.place,
    @required this.places,
  });

  final Place place;
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double miniCardWidth = _size.width * 0.39;
    double detailsHeight = 33.0;
    double detailsContainerHeight = 30.0;
    return Container(
        child: Stack(
      children: [
        Positioned(
          bottom: detailsContainerHeight,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
                boxShadow: kTextFieldContainerShadow),
            height: _size.height * 0.18,
            width: miniCardWidth,
          ),
        ),
        Positioned(
          bottom: detailsHeight,
          left: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  place.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.business_sharp,
                      color: kAccent,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 100,
                      child: Text(
                        place.type,
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 9,
                    spreadRadius: 1,
                    color: kInactiveColour.withOpacity(0.3))
              ]),
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: _size.height * 0.15,
          width: miniCardWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              memCacheHeight: 349,
              memCacheWidth: 265,
              fit: BoxFit.cover,
              imageUrl: place.imageUrl,
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
      ],
    ));
  }
}
