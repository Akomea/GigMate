import 'package:flutter/material.dart';
import 'package:gigmate/ui/widgets/broadcast/post_gig_category_widget.dart';
import 'package:gigmate/utils/constants.dart';

class PostGigWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      height: _size.height * 0.5,
      child: Column(
        children: [
          Text(
            'Broadcast A Gig',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                color: kPurpleTextColour),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Describe your gig, project or job and GigMate partners will reply with a proposal',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Choose',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: kPurpleTextColour,
                        fontSize: 18),
                  ),
                  TextSpan(
                    text: ' a category',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: kPurpleTextColour),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PostGigCategoriesWidget(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
