import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;

  PrimaryButton({@required this.title, this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(16.0),
      child: Ink(
        width: width ?? MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [START_COLOR, END_COLOR]),
        ),
        child: InkWell(
          onTap: () {
            onPressed.call();
          },
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
