import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fw_ticket/fw_ticket.dart';

import '../colors.dart';

class PurchaseComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              START_COLOR,
              END_COLOR
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Ticket(
                innerRadius: BorderRadius.circular(16.0),
                dashedBottom: true,
                child: Container(
                  height: size.height / 3,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          'Quiet Clubbing VIP Heated Rooftop Party',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24.0,
                              color: BLACK_100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('images/ic_event_time.svg'),
                            SizedBox(width: 8.0),
                            Text(
                              'SUN, MAR. 25 - 4:30 PM EST',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: BLACK_100),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('images/ic_location.svg'),
                            SizedBox(width: 8.0),
                            Text(
                              'Stage 48',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: BLACK_100),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          '605 W 48th Street, Manhattan, 10036',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: GREY),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('images/ic_ticket.svg'),
                            SizedBox(width: 8.0),
                            Text(
                              '2 VIP tickets - 160\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: BLACK_100),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 70,
                        color: GREY_100,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0,
                                  color: BLACK_100),
                            ),
                            Spacer(),
                            Text(
                              '160\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: START_COLOR),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: List.generate(390~/10, (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0 ?
                      Colors.white :
                      Colors.transparent,
                      height: 2.0,
                    ),
                  )),
                ),
              ),
              Ticket(
                innerRadius: BorderRadius.circular(16.0),
                dashedBottom: true,
                child: Container(
                  height: size.height / 3,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 32.0),
                      SvgPicture.asset(
                          'images/img_qrcode.svg',
                        width: 160.0,
                        height: 160.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Check your email ',
                            style: TextStyle(
                              color: BLACK_100,
                              fontWeight: FontWeight.w300
                            ),
                            children: [
                              TextSpan(
                                text: 'lehieuds@gmail.com ',
                                style: TextStyle(
                                  color: START_COLOR
                                )
                              ),
                              TextSpan(
                                text: 'in order to know how to get in the event',
                                style: TextStyle(
                                  color: BLACK_100
                                )
                              ),
                            ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
