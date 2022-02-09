import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:smart_select/smart_select.dart';

import 'event_choices.dart' as choices;
import 'post_gig_text_field.dart';

class ClientInfoTBChild extends StatefulWidget {
  @override
  _ClientInfoTBChildState createState() => _ClientInfoTBChildState();
}

class _ClientInfoTBChildState extends State<ClientInfoTBChild> {
  String _contactMode = '';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                boxShadow: kTextFieldContainerShadow,
                color: Colors.white,
              ),
              child: SmartSelect<String>.single(
                title: 'Preferred Mode of Contact',
                placeholder: 'Phone',
                value: _contactMode,
                choiceItems: choices.contactMode,
                modalType: S2ModalType.bottomSheet,
                choiceType: S2ChoiceType.chips,
                choiceStyle: S2ChoiceStyle(
                  showCheckmark: true,
                ),
                tileBuilder: (context, state) => S2Tile.fromState(
                  state,
                  isTwoLine: true,
                  leading: Icon(Icons.contact_phone),
                ),
                onChange: (state) => setState(() => _contactMode = state.value),
              ),
            ),
            TitleFieldWidget(
                title: 'Name',
                icon: Icon(
                  Icons.person,
                ),
                hintText: 'Theresa Abebrese'),
            TitleFieldWidget(
                title: 'Phone',
                icon: Icon(
                  Icons.phone,
                ),
                hintText: '+233 50 949 0123'),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Extra Notes', style: kQuestionStyle),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    boxShadow: kTextFieldContainerShadow,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 2,
                      maxLength: 50,
                      cursorColor: kPrimaryColour,
                      decoration: InputDecoration(
                          icon: Icon(Icons.note_outlined),
                          border: InputBorder.none,
                          hintText:
                              'Leave our partners any details you could not specify in the forms',
                          hintStyle: TextStyle(
                              color: kHintTextColour.withOpacity(0.3))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We Hate Spam Too\nOnly relevant partners will be notified',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

class TitleFieldWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String hintText;

  const TitleFieldWidget({Key key, this.title, this.icon, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(title, style: kQuestionStyle),
          ),
        ),
        PostGigTextField(
          hintText: hintText,
          icon: icon,
        ),
      ],
    );
  }
}
