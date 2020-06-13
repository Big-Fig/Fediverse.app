import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediLightStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediLightStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
//          value: SystemUiOverlayStyle(
//            statusBarColor: Colors.red,
//          ),
        value: SystemUiOverlayStyle.light.copyWith(
//          statusBarColor: Colors.transparent,
            statusBarColor: Colors.yellow,
//          systemNavigationBarColor: Colors.white,
//          systemNavigationBarColor: Colors.transparent,
//          statusBarColor: Colors.transparent,
//          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: child);
  }
}
