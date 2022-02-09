import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/utils/constants.dart';
import 'package:gigmate/core/providers/post_gig_notifier.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'event_choices.dart' as choices;
import 'date_picker_button.dart';
import 'question_header_text.dart';
import 'rectangular_container.dart';

class BasicDetailsTBChild extends StatefulWidget {
  @override
  _BasicDetailsTBChildState createState() => _BasicDetailsTBChildState();
}

enum GigType { Event, Contract }

class _BasicDetailsTBChildState extends State<BasicDetailsTBChild> {
  GigType _gigType = GigType.Event;

  List<DateTime> _multiple;
  List<String> _multipleDates = [];
  String _dateCount = '';
  String _range = '';

  @override
  void initState() {
    // TODO: implement initState
    List<String> _multipleDates = [''];
    String _selectedDate = '';
    List<DateTime> multiple = [];
    String _dateCount = '';
    String _range = '';
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    _multipleDates.clear();
    _dateCount = 'No selected dates';
    var pgNotifier = Provider.of<PostGigNotifier>(context, listen: false);
    pgNotifier.setSelectedDate('Pick a date');
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
        pgNotifier.setSelectedDate(_range);
      } else if (args.value is DateTime) {
        DateTime time = args.value;
        pgNotifier.setSelectedDate('${time.year}/${time.month}/${time.day}');
        print(' ${pgNotifier.dateType}');
      } else if (args.value is List<DateTime>) {
        int listLength = args.value.length;
        String length = listLength.toString();
        _dateCount = listLength == 1
            ? '$length selected date'
            : '$length dates selected';

        //TODO correctly display 0 if list is empty

        _multiple = args.value;

        for (DateTime date in _multiple) {
          String multipleDate = '${date.year}-${date.month}-${date.day}';
          if (!_multipleDates.contains(multipleDate)) {
            _multipleDates.add(multipleDate);
          }
          pgNotifier.setDateType(_multipleDates.toString());

          print(pgNotifier.selectedDate);
        }
        pgNotifier.setMultiDateCount(_dateCount);
        print(pgNotifier.multiDateCount);
      }
      pgNotifier.setMultiDateCount(_dateCount);
    });
  }

  void showDatePicker(
      DateRangePickerSelectionMode pickerSelectionMode, Size size) {
    showMaterialModalBottomSheet(
        barrierColor: Colors.black54,
        elevation: 8,
        context: context,
        builder: (context) => Material(
              child: Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
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

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var pgNotifier = Provider.of<PostGigNotifier>(context);
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
                          value: GigType.Event,
                          onChanged: (value) {
                            setState(() {
                              _gigType = GigType.Event;
                            });
                            pgNotifier.setGigType('Event');
                          },
                          groupValue: _gigType),
                      Text('Event'),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                        value: GigType.Contract,
                        onChanged: (value) {
                          setState(() {
                            _gigType = GigType.Contract;
                          });
                          pgNotifier.setGigType('Contract');
                        },
                        groupValue: _gigType,
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
          child: Row(
            textBaseline: TextBaseline.alphabetic,
            children: [
              QuestionText(question: 'Set Event Date: '),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 2.0),
                child: Text(
                  pgNotifier.selectedDateType == SelectedDateType.Single
                      ? pgNotifier.selectedDate
                      : pgNotifier.selectedDateType == SelectedDateType.Multiple
                          ? pgNotifier.multiDateCount
                          : pgNotifier.selectedDateType ==
                                  SelectedDateType.Range
                              ? pgNotifier.selectedDate
                              : pgNotifier.selectedDate,
                  style: kNotifiedTextStyle,
                ),
              )
            ],
          ),
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
                  bgShadow:
                      pgNotifier.selectedDateType == SelectedDateType.Single
                          ? kShadow2
                          : kNoShadow,
                  icon: Icon(
                    Icons.today,
                    size: 26,
                    color:
                        pgNotifier.selectedDateType == SelectedDateType.Single
                            ? kAccent
                            : Colors.black,
                  ),
                  bgColour:
                      pgNotifier.selectedDateType == SelectedDateType.Single
                          ? kSecondaryColour
                          : Colors.white,
                  borderColour: kSecondaryColour,
                  onTapped: () {
                    pgNotifier.setSelectedDate('Pick a date');
                    showDatePicker(DateRangePickerSelectionMode.single, _size);
                    pgNotifier.setSelectedDateType(SelectedDateType.Single);
                  }),
              DatePickerButton(
                  size: _size,
                  label: 'Multiple',
                  bgShadow:
                      pgNotifier.selectedDateType == SelectedDateType.Multiple
                          ? kShadow2
                          : kNoShadow,
                  icon: Icon(
                    Icons.margin,
                    color:
                        pgNotifier.selectedDateType == SelectedDateType.Multiple
                            ? kAccent
                            : Colors.black,
                  ),
                  bgColour:
                      pgNotifier.selectedDateType == SelectedDateType.Multiple
                          ? kSecondaryColour
                          : Colors.white,
                  onTapped: () {
                    pgNotifier.setMultiDateCount('0 dates selected');
                    pgNotifier.setSelectedDateType(SelectedDateType.Multiple);
                    showDatePicker(
                        DateRangePickerSelectionMode.multiple, _size);
                  }),
              DatePickerButton(
                  size: _size,
                  label: 'Range',
                  bgShadow:
                      pgNotifier.selectedDateType == SelectedDateType.Range
                          ? kShadow2
                          : kNoShadow,
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: pgNotifier.selectedDateType == SelectedDateType.Range
                        ? kAccent
                        : Colors.black,
                  ),
                  bgColour:
                      pgNotifier.selectedDateType == SelectedDateType.Range
                          ? kSecondaryColour
                          : Colors.white,
                  onTapped: () {
                    pgNotifier.setSelectedDate('Pick a date');
                    pgNotifier.setSelectedDateType(SelectedDateType.Range);
                    showDatePicker(DateRangePickerSelectionMode.range, _size);
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
              value: pgNotifier.eventType,
              choiceItems: choices.eventType,
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.chips,
              modalFilter: true,
              modalFilterHint: 'Quick Search',
              choiceStyle:
                  S2ChoiceStyle(showCheckmark: true, activeColor: kAccent),
              tileBuilder: (context, state) => S2Tile.fromState(
                    state,
                    isTwoLine: true,
                  ),
              onChange: (state) => pgNotifier.setEventType(state.value)),
        ),
        Container(
          child: QuestionText(
            question: 'Performance Duration: ',
            duration: '${pgNotifier.performanceDuration}',
          ),
          padding: EdgeInsets.only(top: 10),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.white,
            child: SfRangeSlider(
              min: 1.0,
              max: 10.0,
              values: pgNotifier.sliderValues,
              interval: 1,
              stepSize: 1.0,
              activeColor: kAccent,
              showDividers: true,
              enableTooltip: true,
              tooltipShape: SfPaddleTooltipShape(),
              showLabels: true,
              showTicks: true,
              onChanged: (SfRangeValues newValues) {
                setState(() {
                  pgNotifier.setSliderValue(newValues);
                });
                String end = newValues.end.toInt().toString();
                String start = newValues.start.toInt().toString();
                pgNotifier.setPerformanceDuration('$start - $end Hours');
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
              height: kBudgetButtonHeight,
              width: 0.35,
              child: Center(
                  child: Text(
                'GHc ${pgNotifier.budgetAmount()}',
                style: kNotifiedTextStyle.copyWith(fontSize: 16),
              )),
            ),
            InkWell(
              onTap: () {
                pgNotifier.subtractBudget();
              },
              child: RectangularContainer(
                colour: kSecondaryColour,
                height: kBudgetButtonHeight,
                width: kBudgetButtonWidth,
                child: Icon(Icons.remove, color: kAccent),
              ),
            ),
            InkWell(
              onTap: () {
                pgNotifier.addToBudget();
              },
              child: RectangularContainer(
                colour: kSecondaryColour,
                height: kBudgetButtonHeight,
                width: kBudgetButtonWidth,
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
