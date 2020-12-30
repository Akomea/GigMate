import 'package:flutter/material.dart';

import '../constants.dart';

class GigCard extends StatelessWidget {
  const GigCard({
    @required Size size,
    this.imageUrl,
    this.cardTitle,
    this.description,
    this.location,
    this.budget,
    this.rating,
  }) : _size = size;

  final Size _size;
  final String imageUrl;
  final String cardTitle;
  final String description;
  final String location;
  final String budget;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(2, 5),
                  blurRadius: 9,
                  spreadRadius: 2,
                  color: kShadowColour)
            ],
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imageUrl))),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: _size.height * 0.35,
        width: _size.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.only(top: 140),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  cardTitle,
                  style: kNormalTextBold,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                height: 50,
                child: Text(
                  description,
                  style: TextStyle(fontFamily: 'Roboto'),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                color: kSecondaryColour,
                height: 0.1,
                thickness: 0.3,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          location,
                          style: TextStyle(color: kInactiveColour),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(color: kInactiveColour),
                        ),
                        Text(
                          budget,
                          style: TextStyle(color: kInactiveColour),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Row(
                      children: [
                        Text(rating.toString()),
                        Icon(
                          Icons.star,
                          color: kAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.favorite_border_rounded,
                          color: kAccent,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
