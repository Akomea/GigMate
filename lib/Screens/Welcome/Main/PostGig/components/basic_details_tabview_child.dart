import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/post_gig_notifier.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import './choices.dart' as choices;
import 'date_picker_button.dart';
import 'question_header_text.dart';
import 'rectangular_container.dart';

class BasicDetailsTBChild extends StatefulWidget {
  @override
  _BasicDetailsTBChildState createState() => _BasicDetailsTBChildState();
}

class _BasicDetailsTBChildState extends State<BasicDetailsTBChild> {
  void showDatePicker(
      DateRangePickerSelectionMode pickerSelectionMode, Size size) {
    print('tapped tap tap');
    showMaterialModalBottomSheet(
        barrierColor: Colors.black54,
        elevation: 8,
        context: context,
        builder: (context) => Material(
              child: Container(
                child: SfDateRangePicker(
                  allowViewNavigation: true,
                  showNavigationArrow: true,
                  view: DateRangePickerView.month,
                  selectionMode: pickerSelectionMode,
                  selectionColor: kAccent,
                  todayHighlightColor: kAccent,
                  enablePastDates: false,
                  rangeSelectionColor: kSecondaryColour,
                  startRangeSelectionColor: kAccent,
                  endRangeSelectionColor: kAccent,
                ),
                height: size.height * 0.5,
              ),
            ));
  }

  SfRangeValues _values = SfRangeValues(1.0, 4.0);
  String _category = '';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(children: [
        Container(
          child: QuestionText(question: 'Select Gig Type'),
          padding: EdgeInsets.only(top: 5),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        onChanged: (value) {},
                        groupValue: [Text('dino')],
                      ),
                      Text('Event'),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        onChanged: (value) {},
                        groupValue: [Text('dino')],
                      ),
                      Text('Contract'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: QuestionText(question: 'Set Event Date'),
          padding: EdgeInsets.only(top: 5),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              DatePickerButton(
                  size: _size,
                  label: 'Single Date',
                  icon: Icon(
                    Icons.today,
                    size: 26,
                    color: kAccent,
                  ),
                  bgColour: kSecondaryColour,
                  borderColour: kSecondaryColour,
                  onTapped: () {
                    showDatePicker(DateRangePickerSelectionMode.single, _size);
                  }),
              DatePickerButton(
                  size: _size,
                  label: 'Multiple',
                  icon: Icon(Icons.margin),
                  onTapped: () {
                    showDatePicker(
                        DateRangePickerSelectionMode.multiple, _size);
                  }),
              DatePickerButton(
                  size: _size,
                  label: 'Range',
                  icon: Icon(Icons.date_range_rounded),
                  onTapped: () {
                    showDatePicker(
                        DateRangePickerSelectionMode.multiRange, _size);
                  }),
            ],
          ),
        ),
        SizedBox(height: 2),
        Container(
          color: Colors.white,
          child: SmartSelect<String>.single(
            title: 'Event Type',
            placeholder: 'Wedding',
            value: _category,
            choiceItems: choices.eventType,
            modalType: S2ModalType.bottomSheet,
            choiceType: S2ChoiceType.chips,
            modalFilter: true,
            modalFilterHint: 'Quick Search',
            choiceStyle: S2ChoiceStyle(
              showCheckmark: true,
            ),
            tileBuilder: (context, state) => S2Tile.fromState(
              state,
              isTwoLine: true,
            ),
            onChange: (state) => setState(() => _category = state.value),
          ),
        ),
        // Container(
        //   color: Colors.white,
        //   child: SettingsTile(
        //     title: 'Event Type',
        //     subtitle: 'Wedding',
        //     trailing: Icon(Icons.chevron_right),
        //     onPressed: (BuildContext context) {
        //
        //     },
        //   ),
        // ),

        Container(
          child: QuestionText(question: 'Performance Duration (Hours)'),
          padding: EdgeInsets.only(top: 10),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.white,
            child: SfRangeSlider(
              min: 1.0,
              max: 10.0,
              values: _values,
              interval: 1,
              stepSize: 1.0,
              activeColor: kAccent,
              showDivisors: true,
              enableTooltip: true,
              tooltipShape: SfPaddleTooltipShape(),
              showLabels: true,
              showTicks: true,
              onChanged: (SfRangeValues newValues) {
                setState(() {
                  _values = newValues;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          child: QuestionText(question: 'Budget'),
          padding: EdgeInsets.only(top: 5),
        ),
        Row(
          children: [
            RectangularContainer(
              height: 0.055,
              width: 0.35,
              child: Center(
                  child: Text(
                'GHc ${Provider.of<PostGigNotifier>(context).budgetAmount()}',
                style: TextStyle(color: kInactiveColour, fontSize: 16),
              )),
            ),
            InkWell(
              onTap: () {
                Provider.of<PostGigNotifier>(context, listen: false)
                    .subtractBudget();
              },
              child: RectangularContainer(
                colour: kSecondaryColour,
                height: 0.055,
                width: 0.13,
                child: Icon(Icons.remove, color: kAccent),
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<PostGigNotifier>(context, listen: false)
                    .addToBudget();
              },
              child: RectangularContainer(
                colour: kSecondaryColour,
                height: 0.055,
                width: 0.13,
                child: Icon(
                  Icons.add,
                  color: kAccent,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
