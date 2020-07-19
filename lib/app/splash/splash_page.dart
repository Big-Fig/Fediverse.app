import 'package:fedi/app/splash/splash_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FediColors.primaryColorDark,
        body: SplashWidget(),
      );
}
