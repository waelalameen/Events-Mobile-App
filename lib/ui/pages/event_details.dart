import 'package:events_app/ui/colors.dart';
import 'package:events_app/ui/widgets/event_item.dart';
import 'package:events_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                pinned: true,
                shadowColor: Colors.black87,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [START_COLOR, END_COLOR],
                    ),
                  ),
                  child: FlexibleSpaceBar(
                      background: Stack(
                    children: [
                      PageView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black87,
                                  Colors.black87,
                                  Colors.black87,
                                  Colors.transparent
                                ],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.asset(
                              'images/les.png',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        onPageChanged: (index) =>
                            _currentPageNotifier.value = index,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CirclePageIndicator(
                            selectedDotColor: Colors.white,
                            dotColor: GREY_200,
                            itemCount: 6,
                            currentPageNotifier: _currentPageNotifier,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.share_outlined, size: 32.0),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.favorite_outline_outlined, size: 32.0),
                      onPressed: () {})
                ],
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '#nighhtLife #event',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16.0,
                              color: GREY),
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
                            SvgPicture.asset('images/ic_event_time.svg'),
                            SizedBox(width: 8.0),
                            Text(
                              'SUN, MAR. 25 - 4:30 PM EST',
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
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: GREY_100,
                    child: Row(
                      children: [
                        Text(
                          '4.8',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32.0,
                              color: START_COLOR),
                        ),
                        SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: 3.5,
                              itemCount: 5,
                              itemSize: 18.0,
                              itemBuilder: (context, index) =>
                                  Icon(Icons.star, color: START_COLOR),
                            ),
                            Text(
                              '214 Reviews',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: BLACK_100),
                            ),
                          ],
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '1.3k',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: BLACK_100),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'images/ic_write_review.svg',
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Write Review',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: START_COLOR),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'ABOUT',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: GREY),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Why this party is for you Let’s play the silent game, but this time yo have to dance under the stars with hundreds…',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: BLACK_100),
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          'ENDORSED BY',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: GREY),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/org.png'),
                              maxRadius: 32.0,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12.0),
                                Text(
                                  'Clarence Rodgers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: BLACK_100),
                                ),
                                Text(
                                  '500 followers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: GREY),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: GestureDetector(child: SvgPicture.asset('images/ic_follow.svg')),
                            )
                          ],
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          children: [
                            Text(
                              'LOCATION',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: GREY),
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    'How to get there?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                        color: START_COLOR),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: START_COLOR,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Stage 48',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: BLACK_100),
                        ),
                        Text(
                          '605 W 48th Street, Manhattan, 10036',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: GREY),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '3.5 km nearby',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              color: BLACK_100),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    color: GREY,
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: GREY),
                        ),
                        SizedBox(height: 8.0),
                        RichText(
                          text: TextSpan(
                            text: 'Send us an email at ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              color: BLACK_100
                            ),
                            children: [
                              TextSpan(
                                text: 'help@evez.com ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    color: START_COLOR
                                ),
                              ),
                              TextSpan(
                                text: 'or call us at \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    color: BLACK_100
                                ),
                              ),
                              TextSpan(
                                text: '+1 991-681-0200',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    color: START_COLOR
                                ),
                              )
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'SIMILAR EVENTS',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: GREY),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 400.0,
                    child: EventItem(
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PrimaryButton(
                      title: 'From 20\$ GET IT',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 24.0)
                ],
              ),
            ),
          )),
    );
  }
}
