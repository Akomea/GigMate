import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProGigCard extends StatelessWidget {
  const ProGigCard({
    @required Size size,
    this.imageUrl,
    this.cardTitle,
    this.description,
    this.onTap,
  }) : _size = size;

  final Size _size;
  final String imageUrl;
  final String cardTitle;
  final String description;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          height: _size.height * 0.40,
          width: _size.width,
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
                  fit: BoxFit.cover,
                  image: ResizeImage(AssetImage(imageUrl),
                      width: 568, height: 449))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.black.withOpacity(0.3),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //margin: EdgeInsets.only(top: 90.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    cardTitle,
                    style: kNormalTextBold.copyWith(color: Colors.white, fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  height: 50,
                  child: Text(
                    description,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
