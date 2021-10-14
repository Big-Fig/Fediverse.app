import 'package:fedi/app/splash/splash_widget.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final bool displayVersionInfo;

  const SplashPage({
    Key? key,
    required this.displayVersionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: lightFediUiTheme.colorTheme.primaryDark,
        body: SplashWidget(displayVersionInfo: displayVersionInfo),
      );
}
