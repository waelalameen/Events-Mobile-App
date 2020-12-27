import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class EventItem extends StatefulWidget {
  final Axis scrollDirection;

  EventItem({this.scrollDirection});

  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  Axis _axis;

  @override
  void initState() {
    _axis = widget.scrollDirection ?? Axis.vertical;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _axis == Axis.vertical ? _buildVerticalEventsList() : _buildHorizontalEventsList());
  }

  Widget _buildVerticalEventsList() {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('images/les.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite_border_outlined),
                          color: Colors.white,
                          iconSize: 32.0,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 6.0,
                          child: Container(
                              padding: const EdgeInsets.all(14.0),
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0))),
                              child: Row(
                                children: [
                                  SvgPicture.asset('images/ic_count_down.svg'),
                                  SizedBox(width: 8.0),
                                  Text(
                                    '7 Days 06 Hrs 27 Mins 44 Secs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ))),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text(
                      '#nighhtLife',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                    Spacer(),
                    RatingBarIndicator(
                      rating: 3.5,
                      itemCount: 5,
                      itemSize: 18.0,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: START_COLOR),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '1.3k',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: BLACK_100),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'Quiet Clubbing VIP Heated Rooftop Party',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0,
                      color: BLACK_100),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SvgPicture.asset('images/ic_location.svg'),
                    SizedBox(width: 8.0),
                    Text(
                      '605 W 48th Street, Manhattan…',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                    Spacer(),
                    Text(
                      '10km',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SvgPicture.asset('images/ic_ticket.svg'),
                    SizedBox(width: 8.0),
                    Text(
                      '2.5K/10K attending',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                    Spacer(),
                    Container(
                      width: 164,
                      height: 22,
                      child: Stack(
                        children: List.generate(5, (index) {
                          return Positioned(
                            right: index * 14.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.0,
                              child: CircleAvatar(
                                radius: 10.0,
                                backgroundImage: AssetImage('images/img.png'),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _buildHorizontalEventsList() {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width / 1.2,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('images/les.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite_border_outlined),
                          color: Colors.white,
                          iconSize: 32.0,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 6.0,
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0))),
                          child: Row(
                            children: [
                              SvgPicture.asset('images/ic_count_down.svg'),
                              SizedBox(width: 8.0),
                              Text(
                                '7 Days 06 Hrs 27 Mins 44 Secs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ))),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text(
                      '#nighhtLife',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                    Spacer(),
                    RatingBarIndicator(
                      rating: 3.5,
                      itemCount: 5,
                      itemSize: 18.0,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: START_COLOR),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '1.3k',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: BLACK_100),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'Quiet Clubbing VIP Heated Rooftop Party',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: BLACK_100),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SvgPicture.asset('images/ic_location.svg'),
                    SizedBox(width: 8.0),
                    Text(
                      '605 W 48th Street, Manhattan…',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          color: GREY),
                    ),
                    Spacer(),
                    Text(
                      '10km',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          color: GREY),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SvgPicture.asset('images/ic_ticket.svg'),
                    SizedBox(width: 8.0),
                    Text(
                      '2.5K/10K attending',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          color: GREY),
                    ),
                    Spacer(),
                    Container(
                      width: 164,
                      height: 22,
                      child: Stack(
                        children: List.generate(5, (index) {
                          return Positioned(
                            right: index * 14.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.0,
                              child: CircleAvatar(
                                radius: 10.0,
                                backgroundImage: AssetImage('images/img.png'),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
