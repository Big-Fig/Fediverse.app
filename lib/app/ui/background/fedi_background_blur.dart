import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FediBackgroundBlur extends StatelessWidget {
  final Widget child;
  final double sigma;

  const FediBackgroundBlur({
    required this.child,
    // ignore: no-magic-number
    this.sigma = 3.0,
  });

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          // ignore: no-equal-arguments
          sigmaY: sigma,
        ),
        child: child,
      );
}
