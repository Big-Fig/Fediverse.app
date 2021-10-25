import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediShadows {
  static const BoxShadow _shadow = BoxShadow(
    color: Color(0x26000000),
    // 15%
    blurRadius: 12,
    offset: Offset(0, 1),
  );
  static const BoxShadow forBottomBar = _shadow;
  static const BoxShadow forTopBar = _shadow;
  static const BoxShadow forListTile = _shadow;
}
