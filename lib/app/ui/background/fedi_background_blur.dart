import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FediBackgroundBlur extends StatelessWidget {
  final Widget child;
  final double sigma;

  const FediBackgroundBlur({
    Key? key,
    required this.child,
    // ignore: no-magic-number
    this.sigma = 3.0,
  }) : super(key: key);

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
