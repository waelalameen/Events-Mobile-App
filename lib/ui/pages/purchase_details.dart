import 'package:events_app/ui/widgets/primary_button.dart';
import 'package:events_app/ui/widgets/zigzag_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class PurchaseDetails extends StatefulWidget {
  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  List<bool> _selected = List.generate(3, (index) => index == 0 ? true : false);

  @override
  Widget build(BuildContext context) {
    var redBorder = Border.all(
        color: START_COLOR,
        width: 2.0
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              height: size.height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    START_COLOR,
                    END_COLOR
                  ],
                ),
              ),
              child: CustomPaint(
                size: size,
                painter: ZigzagPainter(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Quiet Clubbing VIP Heated Rooftop Party',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24.0,
                              color: BLACK_100),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Choose your payment method',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: BLACK_100),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectNewMethod(0);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: _selected[0] ? redBorder : null,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]
                            ),
                            width: 125.0,
                            height: 100.0,
                            child: Image.asset('images/img_visa.png'),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectNewMethod(1);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                                border: _selected[1] ? redBorder : null,
                                borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 2.0,
                                ),
                              ]
                            ),
                            width: 125.0,
                            height: 100.0,
                            child: Image.asset('images/img_master.png'),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectNewMethod(2);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: _selected[2] ? redBorder : null,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]
                            ),
                            width: 125.0,
                            height: 100.0,
                            child: Image.asset('images/img_amex.png'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(title: 'GET IT'),
            )
          ],
        ),
      ),
    );
  }

  void selectNewMethod(index) {
    _selected[index] = !_selected[index];
    for (int i = 0; i < _selected.length; i++) {
      if (i != index) _selected[i] = false;
    }
  }
}
