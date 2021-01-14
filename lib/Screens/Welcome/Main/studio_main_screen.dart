import 'package:flutter/material.dart';
import 'package:gigmate/constants.dart';

class StudioMainScreen extends StatefulWidget {
  static final String screenId = 'studio_main_screenId';

  @override
  _StudioMainScreenState createState() => _StudioMainScreenState();
}

class _StudioMainScreenState extends State<StudioMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: kInactiveColour,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                      )
                    ]),
                child: Hero(
                  tag: 'studio',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage('assets/images/producer.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_outlined),
                    ),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.search),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.sort),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
