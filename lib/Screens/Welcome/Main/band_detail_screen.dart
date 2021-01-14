import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gigmate/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:video_player/video_player.dart';

import '../../../components/normal_roundedbutton.dart';
import '../../../components/pill_button.dart';
import '../../Welcome/Main/PostGig/post_gig_screen.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class DetailScreen extends StatefulWidget {
  static final String screenId = 'details_screen_id';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation curve;
  bool _playPause = false;
  ScrollController _scrollController;

  double _initialSheetChildSize = 0.6;
  double _dragScrollSheetExtent = 0;
  double _widgetHeight = 0;
  double _fabPosition = 0;
  double _fabPositionPadding = 10;
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  CarouselController _buttonCarouselController = CarouselController();

  int carouselIndex;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _bottomContainerHeight = 60;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.ios_share,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.favorite_border_rounded,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 400,
            child: Container(
              height: _size.height * 0.4,
              width: _size.width,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/kwanpa.jpg'),
              //         fit: BoxFit.cover)),
              child: CarouselSlider(
                carouselController: _buttonCarouselController,
                items: [
                  // Use a FutureBuilder to display a loading spinner while waiting for the VideoPlayerController to finish initializing.
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the VideoPlayer.
                        return AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_videoPlayerController),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return Stack(
                          children: [
                            Image.asset(
                              'assets/images/kwanpa.jpg',
                              height: _size.height,
                              width: _size.width,
                              fit: BoxFit.cover,
                            ),
                            Center(child: CircularProgressIndicator()),
                          ],
                        );
                      }
                    },
                  ),

                  Image.asset(
                    'assets/images/kwanpa.jpg',
                    height: _size.height,
                    width: _size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/kwanpa_guitar.png',
                    height: _size.height,
                    width: _size.width,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/kwanpa_drum.png',
                    height: _size.height,
                    width: _size.width,
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  height: _size.height,
                  aspectRatio: _size.width,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification notification) {
              setState(() {
                _widgetHeight = context.size.height;
                _dragScrollSheetExtent = notification.extent;

                // Calculate FAB position based on parent widget height and DraggableScrollable position
                _fabPosition = _dragScrollSheetExtent * _widgetHeight;
              });
              print('$notification yayy, I\'m moving!!');
              return;
            },
            child: DraggableScrollableSheet(
              minChildSize: _initialSheetChildSize,
              initialChildSize: _initialSheetChildSize,
              maxChildSize: 0.85,
              builder: (context, controller) {
                _scrollController = controller;
                return ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 30,
                            left: 25,
                            right: 25,
                            bottom: _bottomContainerHeight + 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Kwan Pa',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('Accra | '),
                                Text('\$\$\$\$ | '),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.star,
                                      size: 20,
                                      color: kAccent,
                                    ),
                                  ),
                                  Text('4.9 (18 votes)')
                                ]),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Genre: Palmwine'),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.event_available,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Available',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      PillButton(
                                        buttonText: 'Check Availability',
                                        onTap: () {
                                          _showMyDialog();
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Kwan Pa is made up of four (4) versatile gentlemen who are '
                              'passionate about African Music performance and promotion, '
                              'who also enjoy what they do.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: _size.width * 0.7,
                                child: Text(
                                  'Instrumentation: Djembe, Twin bell & Shekere, Gome, Guitar, Male vocals',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'OpenSans'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 20,
                            ),
                            BulletNote(
                                icon: Icons.library_music_outlined,
                                title: 'Song Requests',
                                subtitle: 'Nothing is set in stone.'),
                            BulletNote(
                                icon: Icons.calendar_today,
                                title: 'Free Cancellation for 48 hours',
                                subtitle:
                                    'After that, cancel up to 7 days before check-in and get a 50% refund'),
                            BulletNote(
                                icon: Icons.bookmark_outline_sharp,
                                title: 'Booking Rules',
                                subtitle: 'Rules about booking with us'),
                            Divider(
                              endIndent: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amenities',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AmenityWidget(
                                    title: 'Instruments',
                                    asset: 'assets/icons/electric.svg',
                                  ),
                                  AmenityWidget(
                                    title: 'PA Sound Systems',
                                    asset: 'assets/icons/loud_speaker.svg',
                                  ),
                                  AmenityWidget(
                                    title: 'Lighting',
                                    asset: 'assets/icons/spotlight.svg',
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cients\' Review',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontFamily: 'Roboto'),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Show All',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: kAccent,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ],
                            ),
                            CarouselSlider(
                              items: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/adwoa.jpg'),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Adwoa Yankey',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  'Wedding Event',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                RatingWidget()
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Amazing Band',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontFamily: 'Roboto'),
                                                ),
                                                SizedBox(height: 5),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'There is no one who loves pain itself, who seeks after it'
                                                      ' and wants to have it, simply because it is pain',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'OpenSans'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: kTextFieldContainerShadow,
                                        color: Colors.white),
                                    margin: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 230,
                                viewportFraction: 0.78,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          Positioned(
            bottom: _fabPosition - _size.height * 0.05,
            left: _size.width * 0.4,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.white12),
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [kSecondaryColour, kSecondaryColour, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 6,
                      color: Color(0xFF666696).withOpacity(0.2),
                      offset: Offset(3, 7.0)),
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 3,
                      color: kSecondaryColour.withOpacity(0.25),
                      offset: Offset(-3, -7.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _playPause = !_playPause;
                    if (_playPause) {
                      _buttonCarouselController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                    _playPause
                        ? _animationController.forward()
                        : _animationController.reverse();
                    //TODO change carousel slider index if not 0

                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                      _playPause = false;
                    } else {
                      // If the video is paused, play it.
                      _videoPlayerController.play();
                      _playPause = true;
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 36,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    color: kAccent,
                    size: 45,
                    progress: curve,
                  ),
                ),
              ),
            ),
          ), //FAB
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: _bottomContainerHeight + 10,
                color: Colors.white.withOpacity(0.7),
                child: NormalRoundedButton(
                  bgColour: kSecondaryColour,
                  buttonText: 'Contact Band',
                  textColour: kAccent,
                  onPressed: () {
                    showCupertinoModalBottomSheet(
                      barrierColor: Colors.black54,
                      elevation: 8,
                      context: context,
                      builder: (context) => Material(
                          child: PostGigScreen(
                        size: _size,
                      )),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          title: Column(
            children: [
              Text('Band Schedule'),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '*Highlighted dates indicate booked dates on which bands are likely unavailable',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kAccent, fontSize: 12),
                ),
              )
            ],
          ),
          content: AbsorbPointer(
            absorbing: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                  decoration:
                      BoxDecoration(color: kSecondaryColour.withOpacity(0.05)),
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) => {},
                    view: DateRangePickerView.month,
                    enableMultiView: true,
                    navigationDirection:
                        DateRangePickerNavigationDirection.vertical,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      blackoutDateTextStyle: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough),
                      blackoutDatesDecoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: kAccent, width: 1),
                          shape: BoxShape.circle),
                    ),
                    selectionMode: DateRangePickerSelectionMode.single,
                    selectionColor: kAccent,
                    todayHighlightColor: kAccent,
                    enablePastDates: false,
                    rangeSelectionColor: kSecondaryColour,
                    startRangeSelectionColor: kAccent,
                    endRangeSelectionColor: kAccent,
                    monthViewSettings: DateRangePickerMonthViewSettings(
                        blackoutDates: List<DateTime>()
                          ..add(DateTime(2021, 01, 18))
                          ..add(DateTime(2021, 01, 19))
                          ..add(DateTime(2021, 01, 9))
                          ..add(DateTime(2021, 01, 15))),
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Okay',
                style: TextStyle(color: kAccent, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController =
        VideoPlayerController.asset('assets/images/bandvid1.mp4');
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationController.addListener(() {
      setState(() {
        // The state that has changed here is the animation object’s value.
      });
    });

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // render the floating button on widget
        _fabPosition = _initialSheetChildSize * context.size.height;
      });
    });

    _videoPlayerController.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    if (!mounted) {
      _scrollController.dispose();
    }
    _animationController.dispose();

    _videoPlayerController.pause();
    _videoPlayerController.dispose();

    super.dispose();
  }
}

class RatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 18,
          color: kAccent,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: kAccent,
        ),
        Icon(
          Icons.star,
          size: 18,
          color: kAccent,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 18,
          color: kAccent,
        ),
        Icon(
          Icons.star_border_outlined,
          size: 18,
          color: kAccent,
        )
      ],
    );
  }
}

class AmenityWidget extends StatelessWidget {
  final String asset;
  final title;

  AmenityWidget({this.asset, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          SvgPicture.asset(
            asset,
            width: 30,
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }
}

class BulletNote extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String link;

  BulletNote({this.icon, this.title, this.subtitle, this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontFamily: 'OpenSans'),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  subtitle,
                  style: TextStyle(fontFamily: 'OpenSans'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
