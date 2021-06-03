import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: _size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, loading) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: SpinKitChasingDots(
                      color: kSecondaryColour,
                    ),
                  ),
                );
              },
            ),
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
              color: Colors.white,
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
                  child: Text(
                    cardTitle,
                    style: kNormalTextBold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  height: 40,
                  child: Text(
                    description,
                    style: TextStyle(fontFamily: 'Roboto'),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                          Text(
                            location,
                            style: TextStyle(color: kInactiveColour),
                          ),
                          BandCardSeperator(),
                          Text(
                            budget,
                            style: TextStyle(color: kInactiveColour),
                          ),
                          BandCardSeperator(),
                          SizedBox(
                            width: 4,
                          ),
                          Row(
                            children: [
                              Text(rating.toString()),
                              SizedBox(width: 1),
                              Icon(
                                Icons.star,
                                color: kAccent,
                                size: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BandCardSeperator extends StatelessWidget {
  const BandCardSeperator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' | ',
      style: TextStyle(color: kInactiveColour),
    );
  }
}
