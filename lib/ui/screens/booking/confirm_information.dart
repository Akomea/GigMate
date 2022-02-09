import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:gigmate/locale/locales.dart';
import 'package:gigmate/theme/colors.dart';
import 'package:gigmate/ui/shared_widgets/custom_button.dart';

import '../../../routes.dart';

class ConfirmInformation extends StatefulWidget {
  @override
  _ConfirmInformationState createState() => _ConfirmInformationState();
}

class _ConfirmInformationState extends State<ConfirmInformation> {
  DateData dateData = DateData('21 Jun, 2020', '10:00 am');
  bool isOpen = false;
  void openSheet() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (BuildContext context) {
          return DateBottomSheet();
        },
      ).then((value) {
        setState(() {
          dateData = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);

    if (!isOpen) {
      isOpen = true;
      openSheet();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/Handyzone/headerbg.png',
                height: 150,
                width: MediaQuery.of(context).size.width * 1.4,
                fit: BoxFit.fill,
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                start: 12,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Emili Anderson',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 0.11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                start: 12,
                top: -25,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    locale.booking,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.11,
                      fontWeight: FontWeight.w500,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                start: 30,
                top: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.rate,
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.hintColor),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '\$12',
                            style: theme.textTheme.subtitle1,
                          ),
                          TextSpan(
                            text: '/hr',
                            style: theme.textTheme.bodyText1
                                .copyWith(color: theme.hintColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              PositionedDirectional(
                end: 72,
                bottom: 0,
                child: FadedScaleAnimation(
                  Image.asset(
                    'assets/Providers/Emili.png',
                    scale: 3,
                  ),
                  durationInMilliseconds: 800,
                ),
              ),
            ],
          ),
          Container(
            // height: MediaQuery.of(context).size.height / 1.44,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        locale.task,
                        style: theme.textTheme.bodyText1
                            .copyWith(color: iconColor),
                      ),
                      Text(
                        locale.homeClean + " > " + locale.carpetCleaning + '\n',
                        style: theme.textTheme.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(locale.address,
                          style: theme.textTheme.bodyText1
                              .copyWith(color: iconColor)),
                      Text(
                        locale.home,
                        style: theme.textTheme.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('B121 - Galaxy Residency, Hemiltone Tower,' +
                          '\n' +
                          'New York, USA' +
                          '\n'),
                      Text(locale.description,
                          style: theme.textTheme.bodyText1
                              .copyWith(color: iconColor)),
                      Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.'),
                      SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 200,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsetsDirectional.only(end: 8),
                                        child: Image.asset(
                                          'assets/Handyzone/servicerequestpic1.jpg',
                                          height: 70,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            FadedScaleAnimation(
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  'assets/Handyzone/servicerequestpic1.jpg',
                                  height: 60,
                                ),
                              ),
                              durationInMilliseconds: 800,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FadedScaleAnimation(
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  'assets/Handyzone/servicerequestpic1.jpg',
                                  height: 60,
                                ),
                              ),
                              durationInMilliseconds: 800,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //  Spacer(),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (BuildContext context) {
                        return DateBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset.fromDirection(50),
                              spreadRadius: 5,
                              blurRadius: 5)
                        ]),
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(locale.bookingDate,
                                style: theme.textTheme.bodyText1
                                    .copyWith(color: iconColor)),
                            Text(locale.bookingTime,
                                style: theme.textTheme.bodyText1
                                    .copyWith(color: iconColor)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateData.date,
                              style: theme.textTheme.bodyText1.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              dateData.time,
                              style: theme.textTheme.bodyText1.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Spacer(),
                        CustomButton(
                          text: locale.confirmBooking,
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRoutes.bookingSent);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // openSheet() async {
  //   setState(() async {
  //     dateData = await
  //   });
  // }maine nai kiya yaar
}

class DateData {
  final String date;
  final String time;

  DateData(this.date, this.time);
}

class DateBottomSheet extends StatefulWidget {
  @override
  _DateBottomSheetState createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  final List<String> day = [
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  final List<String> time = [
    '7:00',
    '8:00',
    '9:00',
    '10:00',
    '11:00',
  ];

  int _selectedDate;
  int _selectedTime;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: Theme.of(context).backgroundColor,
      ),
      // height: 200,
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Text(
                  locale.selectDate,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: iconColor,
                      ),
                ),
                Spacer(),
                Text(
                  'June 2020',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: iconColor,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 28,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = index;
                      });
                    },
                    child: Container(
                      width: 55,
                      margin: EdgeInsets.only(right: 8, bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _selectedDate == index
                            ? Color(0xff93c152)
                            : Color(0xfff8f9fd),
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: '${index + 1}\n',
                              style:
                                  Theme.of(context).textTheme.bodyText1.copyWith(
                                        fontSize: 21,
                                        color: _selectedDate == index
                                            ? Theme.of(context).backgroundColor
                                            : Colors.black,
                                      ),
                            ),
                            TextSpan(
                              text: day[index],
                              style:
                                  Theme.of(context).textTheme.bodyText1.copyWith(
                                        fontSize: 11,
                                        color: _selectedDate == index
                                            ? Theme.of(context).backgroundColor
                                            : iconColor,
                                      ),
                            ),
                          ])),
                    ),
                  );
                },
              ),
            ),
            Text(
              locale.availableTimings,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: iconColor,
                  ),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          _selectedTime = index;
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 4, bottom: 8),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _selectedTime == index
                            ? Color(0xff93c152)
                            : Color(0xfff8f9fd),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: time[index],
                              style:
                                  Theme.of(context).textTheme.bodyText1.copyWith(
                                        fontSize: 18,
                                        color: _selectedTime == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                            ),
                            TextSpan(
                              text: ' am',
                              style:
                                  Theme.of(context).textTheme.bodyText1.copyWith(
                                        fontSize: 11,
                                        color: _selectedTime == index
                                            ? Theme.of(context).backgroundColor
                                            : iconColor,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Spacer(),
            CustomButton(
              text: locale.continueWord,
              onTap: () {
                if(_selectedDate!=null&&_selectedTime!=null){
                  Navigator.pop(
                      context,
                      DateData('${_selectedDate + 1} Jun, 2020',
                          time[_selectedTime] + ' am'));
                }else{
                  Navigator.pop(context, DateData('03 Jun, 2020',
                      '09:00' + ' am'));
                }
              },
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
