import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class GigSoloCard extends StatelessWidget {
  const GigSoloCard({
    Key key,
    @required Size size,
    this.imageUrl,
    this.name,
    this.role,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String imageUrl;
  final String name;
  final role;

  @override
  Widget build(BuildContext context) {
    return Container(
      //Container for scrollable row
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    //black mask on card
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Align(
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                            Align(
                              child: Text(
                                role,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 150),
                        padding: EdgeInsets.all(15),
                      ),
                    ],
                  ),
                ],
              ),
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
                      fit: BoxFit.cover, image: AssetImage(imageUrl))),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: _size.width * 0.92,
              height: _size.height * 0.32,
            ),
          ],
        ),
      ),
    );
  }
}
