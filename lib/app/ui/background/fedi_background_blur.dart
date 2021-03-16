import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FediBackgroundBlur extends StatelessWidget {
  final Widget child;
  final double sigma;

  FediBackgroundBlur({
    required this.child,
    this.sigma = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      child: child,
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
    );
  }
}
