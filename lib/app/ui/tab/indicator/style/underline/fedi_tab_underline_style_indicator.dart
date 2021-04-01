import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediTabUnderlineStyleIndicator extends UnderlineTabIndicator {
  FediTabUnderlineStyleIndicator({
    Color indicatorColor = Colors.white,
  }) : super(
          borderSide: BorderSide(width: 2.0, color: indicatorColor),
          insets: EdgeInsets.only(bottom: 2.0),
        );
}