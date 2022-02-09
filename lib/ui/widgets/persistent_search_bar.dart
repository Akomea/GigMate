import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BuildSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.search_rounded,
              color: kAccent,
              size: 22,
            ),
          ),
          InkWell(
            highlightColor: kAccent,
            splashColor: kAccent,
            onTap: () {
              print('InkWell');
            },
            child: Text(
              'What are we looking for?',
              style: TextStyle(
                  color: Color(0x80270040),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
          vertical: _size.height * 0.025, horizontal: _size.width * 0.025),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
      width: _size.width * 0.95,
      height: _size.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kPurpleTextColour,
            blurRadius: 30,
            spreadRadius: -19,
          ),
        ],
        borderRadius: BorderRadius.circular(29),
        color: Colors.white,
      ),
    );
  }
}
