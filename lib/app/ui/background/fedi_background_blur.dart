import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FediBackgroundBlur extends StatelessWidget {
  final Widget child;

  FediBackgroundBlur({@required this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      child: child,
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
    );
  }
}
