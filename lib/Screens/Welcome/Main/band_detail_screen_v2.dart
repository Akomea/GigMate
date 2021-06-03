import 'dart:io' as io;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gigmate/components/normal_rounded_button.dart';
import 'package:gigmate/components/pill_button.dart';
import 'package:gigmate/constants.dart';
import 'package:gigmate/enum/connectivity_status.dart';
import 'package:gigmate/model_notifier.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//import '../../Welcome/Main/PostGig/post_gig_screen.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import './components/credits_pill.dart';
import 'PostGig/post_gig_screen.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class BandDetailScreen extends StatefulWidget {
  static const String screenId = 'band_details_screen_id';

  @override
  _BandDetailScreenState createState() => _BandDetailScreenState();
}

class _BandDetailScreenState extends State<BandDetailScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation curve;
  bool _playPause = false;
  ScrollController _scrollController;

  final double _initialSheetChildSize = 0.6;
  double _dragScrollSheetExtent = 0;
  double _widgetHeight = 0;
  double _fabPosition = 0;
  final double _fabPositionPadding = 10;
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  bool _isPlayButtonVisible;
  double _buttonOpacity = 1.0;

  final CarouselController _buttonCarouselController = CarouselController();

  int carouselIndex;
  ConnectivityStatus connectionStatus;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    const double _bottomContainerHeight = 60;
    connectionStatus = Provider.of<ConnectivityStatus>(context);
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: true);
    final reviews = modelNotifier.currentLiveBand.reviews;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.ios_share,
            ),
            onPressed: () {
              Share.share('Share Jonas Ahedor\'s GigMate profile',
                  subject: 'Handpicked Gospel pianist');
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            //slideshow background
            top: 0,
            bottom: 400,
            child: Container(
              height: _size.height * 0.4,
              width: _size.width,
              child: CarouselSlider(
                carouselController: _buttonCarouselController,
                items: [
                  // Use a FutureBuilder to display a loading spinner while waiting for the VideoPlayerController to finish initializing.
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      debugPrint(snapshot.error.toString());
                      debugPrint(snapshot.connectionState.toString());

                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the VideoPlayer.
                        return AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_isPlayButtonVisible) {
                                    _buttonOpacity = 0.0;
                                  } else if (!_isPlayButtonVisible) {
                                    _buttonOpacity = 1.0;
                                  }
                                });
                                _isPlayButtonVisible = !_isPlayButtonVisible;
                                delayTime();
                              },
                              child: Stack(
                                children: [
                                  VideoPlayer(_videoPlayerController),
                                  Positioned(
                                    child: Center(
                                      child: AnimatedOpacity(
                                        opacity: _buttonOpacity,
                                        duration: const Duration(seconds: 1),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _playPause
                                                  ? _animationController
                                                      .reverse()
                                                  : _animationController
                                                      .forward();

                                              if (_videoPlayerController
                                                  .value.isPlaying) {
                                                _videoPlayerController.pause();
                                                _playPause = false;
                                                _buttonOpacity = 1;
                                              } else {
                                                // If the video is paused, play it.
                                                _videoPlayerController.play();
                                                _playPause = true;
                                                _buttonOpacity = 1;
                                                delayTime();
                                              }
                                            });
                                            _playPause = !_playPause;
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.white.withOpacity(0.7),
                                            radius: 36,
                                            child: AnimatedIcon(
                                              icon: AnimatedIcons.pause_play,
                                              color: kAccent,
                                              size: 45,
                                              progress: curve,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        debugPrint(snapshot.error.toString());
                        debugPrint(snapshot.connectionState.toString());

                        return Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: modelNotifier.currentLiveBand.media[1]
                                  .toString(),
                              height: _size.height,
                              width: _size.width,
                              fit: BoxFit.cover,
                            ),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      }
                    },
                  ),
                  Image.network(
                    '${modelNotifier.currentLiveBand.media[1]}',
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
                  autoPlayInterval: const Duration(seconds: 3),
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
              debugPrint('$notification yayy, I\'m moving!!');
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
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            top: 80,
                            left: 25,
                            right: 25,
                            bottom: _bottomContainerHeight + 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'About',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              modelNotifier.currentLiveBand.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'OpenSans'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              endIndent: 20,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: _size.width * 0.7,
                                child: Text(
                                  'Other Instruments: ${modelNotifier.currentLiveBand.instruments}',
                                  style: kDetailTextStyle,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              endIndent: 20,
                            ),
                            const Text(
                              'Credits',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontFamily: 'Roboto'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CreditsPill.getCredits(
                                modelNotifier.currentLiveBand.credits, 6, 30),
                            const Divider(
                              endIndent: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  reviews != null
                                      ? 'Clients\' Reviews'
                                      : 'No Reviews',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontFamily: 'Roboto'),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    reviews != null
                                        ? 'Show All'
                                        : 'Rate & Review',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: kAccent,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ],
                            ),
                            if (reviews != null)
                              CarouselSlider(
                                items: getReviewList(reviews),
                                options: CarouselOptions(
                                  height: 230,
                                  viewportFraction: 0.78,
                                ),
                              )
                            else
                              Container(
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/emptyState.PNG'),
                                ),
                              )
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          Positioned(
            bottom: _fabPosition - _size.height * 0.09,
            left: _size.width * 0.05,
            child: Container(
                width: _size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 3, color: Colors.white12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 6,
                        color: const Color(0xFF666696).withOpacity(0.25),
                        offset: const Offset(3, 7.0)),
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 3,
                        color: kSecondaryColour.withOpacity(0.15),
                        offset: const Offset(-3, -7.0)),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${modelNotifier.currentLiveBand.name}',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                                '${modelNotifier.currentLiveBand.location} | '),
                            Text(modelNotifier.currentLiveBand.isPremium
                                ? '\$\$\$ | '
                                : '\$\$ | '),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  size: 20,
                                  color: kAccent,
                                ),
                              ),
                              Text(
                                  '${getRatingScore(reviews)} (${getTotalNumReviews(reviews)} reviews)')
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              modelNotifier.currentLiveBand.genre,
                              style: TextStyle(
                                  color: kAccent, fontWeight: FontWeight.bold),
                            ),
                            PillButton(
                              buttonText: 'Check Availability',
                              onTap: () {
                                _showMyDialog();
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ), //floating header
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: _bottomContainerHeight + 10,
                color: Colors.white.withOpacity(0.7),
                child: NormalRoundedButton(
                    bgColour: kSecondaryColour,
                    buttonText: 'Contact ${modelNotifier.currentLiveBand.name}',
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
                    }),
              ),
            ),
          ) //contact button
        ],
      ),
    );
  }

  Future<void> customLaunch(String command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      debugPrint('could not launch $command');
    }
  }

  void delayTime() {
    if (_buttonOpacity == 1.0) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        if (mounted) {
          setState(() {
            // Here you can write your code for open new view
            _buttonOpacity = 0.0;
            _isPlayButtonVisible = false;
          });
        }
      });
    }
  }

  static String path = '';
  io.File vidUrl = io.File(path);

  Future getDownloadedUrl(String url) async {
    final fetchedFile = await DefaultCacheManager().getSingleFile(url);
    setState(() {
      vidUrl = fetchedFile;
      path = fetchedFile.path;
      print(path);
    });
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
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: false);

    //getDownloadedUrl(modelNotifier.currentSoloMusician.media[0]);

    delayTime();
    _isPlayButtonVisible = true;

    _videoPlayerController =
        VideoPlayerController.network(modelNotifier.currentLiveBand.media[0]);
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
    _videoPlayerController.play();

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

  double getRatingScore(List reviews) {
    int sumStars = 0;
    double average = 0.0;
    if (reviews != null) {
      for (var review in reviews) {
        sumStars += review['numStars'];
      }
    } else {
      return 0.0;
    }
    average = sumStars / getTotalNumReviews(reviews);
    return average;
  }

  List<Widget> getReviewList(List reviews) {
    final List<Widget> reviewList = [];
    if (reviews != null) {
      for (var review in reviews) {
        reviewList.add(
          ReviewCard(
            reviewerName: review['reviewerName'],
            reviewerImageUrl: review['reviewerImageUrl'],
            numStars: review['numStars'],
            summary: review['summary'],
            review: review['review'],
            eventType: review['eventType'],
          ),
        );
      }
    } else
      print('no reviews');
    return reviewList;
  }

  int getTotalNumReviews(List reviews) {
    if (reviews != null) {
      return reviews.length;
    }
    return 0;
  }
}

Widget getStars(int numStars) {
  const int totalStars = 5;
  final int numEmptyStars = totalStars - numStars;
  final List<Icon> rating = [];
  const Icon fullStar = Icon(
    Icons.star,
    size: 18,
    color: kAccent,
  );
  const Icon emptyStar = Icon(
    Icons.star_border_outlined,
    size: 18,
    color: kAccent,
  );
  if (numStars <= totalStars || numStars != 0) {
    for (int i = 1; i <= numStars; i++) {
      rating.add(fullStar);
    }
    for (int i = 1; i <= numEmptyStars; i++) {
      rating.add(emptyStar);
    }
  } else {
    debugPrint('error in stars count');
  }
  return Row(
    children: rating,
  );
}

class ReviewCard extends StatelessWidget {
  final reviewerName;
  final String reviewerImageUrl;
  final String summary;
  final String review;
  final numStars;
  final String eventType;

  const ReviewCard(
      {this.reviewerName,
      this.reviewerImageUrl,
      this.summary,
      this.review,
      this.numStars,
      this.eventType});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
            boxShadow: kTextFieldContainerShadow, color: Colors.white),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(reviewerImageUrl),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewerName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      eventType,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    getStars(numStars),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summary,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'Roboto'),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        child: Text(
                          review,
                          style: const TextStyle(fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Availability extends StatelessWidget {
  final Icon icon;
  final Color color;

  const Availability({this.icon, this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    final ModelNotifier modelNotifier =
        Provider.of<ModelNotifier>(context, listen: false);
    const Icon available = Icon(
      Icons.event_available,
      color: Colors.green,
    );
    const Icon unavailable = Icon(
      Icons.event_busy,
      color: Colors.redAccent,
    );
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: modelNotifier.currentLiveBand.availability == true
              ? available
              : unavailable,
        ),
        if (modelNotifier.currentLiveBand.availability == true)
          const Text(
            'Available',
            style: TextStyle(color: Colors.green),
          )
        else
          const Text(
            'Unavailable',
            style: TextStyle(color: Colors.redAccent),
          )
      ],
    );
  }
}
