import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediShadows {
  static const BoxShadow forBottomBar = BoxShadow(
    color: Color(0x26000000),
    // 15%
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
  );
  static const BoxShadow forTopBar = BoxShadow(
    color: Color(0x26000000),
    // 15%
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, -3), // changes position of shadow
  );
  static const BoxShadow forListTile = BoxShadow(
    color: Color(0x26000000),
    // 15%
    spreadRadius: 5,
    blurRadius: 7,
  );
}
