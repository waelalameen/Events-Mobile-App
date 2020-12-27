import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class Attenders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/org.png'),
                    radius: 32.0,
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bronwyn Hulme',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: BLACK_100),
                      ),
                      Text(
                        '328 Follower',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                            color: GREY),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset('images/ic_followed.svg')
                ],
              ),
            );
          }),
    );
  }
}
