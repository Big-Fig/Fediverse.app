import 'dart:ui';

import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class FediDarkImageBackground extends StatelessWidget {

  final Widget child;


  FediDarkImageBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      child: child,
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
    );
  }

}