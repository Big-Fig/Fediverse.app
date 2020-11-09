import 'package:fedi/app/splash/splash_widget.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: lightFediUiTheme.colorTheme.primaryDark,
        body: const SplashWidget(),
      );
}
