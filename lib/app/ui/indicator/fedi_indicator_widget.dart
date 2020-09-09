import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIndicatorWidget extends StatelessWidget {
  final bool active;

  FediIndicatorWidget({@required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(
          vertical: FediSizes.mediumPadding, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
          border: Border.all(width: 1.0, color: Colors.white)),
    );
  }
}