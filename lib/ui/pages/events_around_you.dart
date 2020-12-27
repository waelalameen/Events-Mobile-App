import 'package:events_app/ui/colors.dart';
import 'package:events_app/ui/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class EventsAroudYou extends StatefulWidget {
  @override
  _EventsAroudYouState createState() => _EventsAroudYouState();
}

class _EventsAroudYouState extends State<EventsAroudYou> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            height: size.height,
            color: Colors.blueAccent,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        mini: true,
                        child: Icon(
                          Icons.clear,
                          color: START_COLOR,
                        ),
                        onPressed: () {}
                      ),
                      Spacer(),
                      FloatingActionButton.extended(
                        label: Text(
                          'Filter',
                          style: TextStyle(
                            color: BLACK_100
                          ),
                        ),
                        icon: Icon(
                          Icons.sort,
                          color: BLACK_100
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {}, 
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        mini: true,
                        child: SvgPicture.asset(
                          'images/ic_direction.svg',
                          color: START_COLOR,
                        ),
                        onPressed: () {}
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: 400.0,
                  color: Colors.white,
                  child: EventItem(
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
