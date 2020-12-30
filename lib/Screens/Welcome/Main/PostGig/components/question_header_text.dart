import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class QuestionText extends StatelessWidget {
  final String question;

  const QuestionText({this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(question, style: kQuestionStyle),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
