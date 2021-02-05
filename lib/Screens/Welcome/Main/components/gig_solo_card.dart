import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class GigSoloCard extends StatelessWidget {
  const GigSoloCard({
    Key key,
    @required Size size,
    this.imageUrl,
    this.name,
    this.role,
    this.onTap,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String imageUrl;
  final String name;
  final role;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: [
            Container(
              //black mask on card
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            FlatButton(
              onPressed: onTap,
              splashColor: kSecondaryColour.withOpacity(0.3),
              child: Container(
                child: Column(
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
                      margin: EdgeInsets.only(top: 170),
                      padding: EdgeInsets.all(1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(2, 5),
                  blurRadius: 9,
                  spreadRadius: 2,
                  color: kShadowColour)
            ],
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: _size.width * 0.46,
      ),
    );
  }
}
