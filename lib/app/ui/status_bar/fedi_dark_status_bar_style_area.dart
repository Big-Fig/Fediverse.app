import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediDarkStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediDarkStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.white
//    ));
    return AnnotatedRegion<SystemUiOverlayStyle>(
//          value: SystemUiOverlayStyle(
//            statusBarColor: Colors.red,
//          ),
        value: SystemUiOverlayStyle.dark.copyWith(
//          statusBarColor: Colors.red,
          statusBarColor: FediColors.white,

//          systemNavigationBarColor: FediColors.white,
//          systemNavigationBarColor: Colors.black,
        ),
        child: child);
  }
}
