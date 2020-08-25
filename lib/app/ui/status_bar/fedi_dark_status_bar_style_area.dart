import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediDarkStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediDarkStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: FediColors.white,
        ),
        child: child);
  }
}
