import 'package:flutter/material.dart';
import 'package:gigmate/Screens/Welcome/Main/PostGig/components/basic_details_tabview_child.dart';
import 'package:gigmate/Screens/Welcome/Main/PostGig/components/client_info_tabview_child.dart';
import 'package:gigmate/Screens/Welcome/Main/PostGig/components/gig_info_tabview_child.dart';
import 'package:gigmate/constants.dart';

import './components/modal_bottom_sheet%20background.dart';

class PostGigScreen extends StatefulWidget {
  const PostGigScreen({
    Key key,
    @required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  _PostGigScreenState createState() => _PostGigScreenState();
}

class _PostGigScreenState extends State<PostGigScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  String _postGigButtonText = 'Cancel';

  List<Widget> tabsList = [
    Tab(
        text: 'Basic Details',
        icon: Icon(
          Icons.sticky_note_2_rounded,
        )),
    Tab(
        text: 'Gig Data',
        icon: Icon(
          Icons.music_note,
        )),
    Tab(
        text: 'Client Info',
        icon: Icon(
          Icons.contact_page_rounded,
        ))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _tabController = TabController(length: tabsList.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Material(
      child: BottomSheetBackground(
        child: Container(
          padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 0),
          height: widget._size.height * 0.95,
          child: Column(
            children: [
              Text(
                'Broadcast To Bands',
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
                'Specifying particulars help GigMate partners reply with proposals tailored to your requirements',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                //tab bar
                child: AbsorbPointer(
                  absorbing: true,
                  child: TabBar(
                    controller: _tabController,
                    tabs: tabsList,
                    labelColor: kPurpleTextColour,
                    unselectedLabelColor: kInactiveColour.withOpacity(0.5),
                    indicatorColor: kAccent,
                  ),
                ),
              ),
              Divider(
                color: kSecondaryColour,
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(child: BasicDetailsTBChild()),
                    SingleChildScrollView(child: GigInfoTBChild()),
                    SingleChildScrollView(child: ClientInfoTBChild())
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        child: Text(_postGigButtonText),
                        color: kPrimaryColour,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_selectedIndex == 0) {
                            Navigator.pop(context);
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              _postGigButtonText = 'Cancel';
                            });
                          }
                          if (_selectedIndex > 0) {
                            _tabController.index = _selectedIndex -= 1;
                          }
                          if (_selectedIndex < 0) {
                            _tabController.index = _selectedIndex = 0;
                          }
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        child: Text('Next'),
                        color: kPrimaryColour,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            _postGigButtonText = 'Back';
                          });
                          if (_selectedIndex < 2) {
                            _tabController.index = _selectedIndex += 1;
                          }
                          if (_selectedIndex > 2) {
                            _tabController.index = _selectedIndex = 2;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// onTap: () {
// setState(() {
// int current = _selectedIndex += 1;
// _tabController.index = current;
// });
// },
