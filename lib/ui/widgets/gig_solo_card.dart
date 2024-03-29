import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: _size.height * kGigSoloCardContainerHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  memCacheWidth: 500,
                  memCacheHeight: 349,
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
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
            Container(
              //black mask on card
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            TextButton(
              onPressed: onTap,
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
                                  fontSize: 16.sp,
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
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
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
      ),
    );
  }
}
