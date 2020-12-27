import 'package:events_app/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../colors.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<bool> _selected = List.generate(10, (index) => index == 0);
  double _distanceValue = 5.0;
  RangeValues _priceRange;
  bool _onlyFree = false;

  @override
  void initState() {
    _priceRange = RangeValues(0, 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'When',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: BLACK_100),
              ),
            ),
            Container(
                height: 32.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      double left = index == 0 ? 24.0 : 4.0;
                      double right = index == 9 ? 24.0 : 4.0;
                      return Container(
                        margin: EdgeInsets.only(left: left, right: right),
                        child: ChoiceChip(
                          label: Text(
                            'data $index',
                            style: TextStyle(
                                color: _selected[index] ? Colors.white : GREY),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          backgroundColor: GREY_100,
                          selectedColor: START_COLOR,
                          selected: _selected[index],
                          onSelected: (value) {
                            setState(() {
                              for (var i = 0; i < _selected.length; i++) {
                                if (i != index) {
                                  _selected[i] = false;
                                } else if (value) {
                                  _selected[index] = value;
                                }
                              }
                            });
                          },
                        ),
                      );
                    })),
            SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Rating',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: BLACK_100),
              ),
            ),
            Align(
              child: RatingBar.builder(
                  initialRating: 2,
                  minRating: 1,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: START_COLOR),
                  onRatingUpdate: (value) {}),
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Distance',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: BLACK_100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '${_distanceValue.toInt()} mil',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                        color: START_COLOR),
                  ),
                ),
              ],
            ),
            Slider(
                min: 0,
                max: 10,
                value: _distanceValue,
                activeColor: START_COLOR,
                inactiveColor: GREY_100,
                onChanged: (value) {
                  setState(() => _distanceValue = value);
                }),
            SizedBox(height: 32.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Price',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: BLACK_100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '${_priceRange.start.toInt()}\$ - ${_priceRange.end.toInt()}\$',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                        color: START_COLOR),
                  ),
                ),
              ],
            ),
            RangeSlider(
              min: 0,
              max: 100,
              divisions: 20,
              values: _priceRange,
              activeColor: START_COLOR,
              inactiveColor: GREY_100,
              onChanged: (value) {
                setState(() {
                  _priceRange = value;
                });
              },
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Checkbox(
                  value: _onlyFree,
                  activeColor: START_COLOR,
                  onChanged: (value) {
                    setState(() => _onlyFree = value);
                  },
                ),
                Text(
                  'Only free events',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0,
                      color: BLACK_100),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Divider(
              height: 2.0,
              thickness: 0.6,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                title: 'SHOW +100 EVENTS',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
