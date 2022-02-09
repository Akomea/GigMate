import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';

class QuestionText extends StatelessWidget {
  final String question;
  final String duration;

  const QuestionText({this.question, this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 2.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: question, style: kQuestionStyle),
              TextSpan(text: duration, style: kNotifiedTextStyle)
            ]),
          )),
    );
  }
}
