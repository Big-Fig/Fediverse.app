import 'package:fedi/app/package_info/package_info_widget.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: buildLogoWidget(),
      ),
      Positioned(
        right: 20.0,
        bottom: 20.0,
        child: VersionPackageInfoWidget(
          textStyle: lightFediUiTheme.textTheme.mediumShortBoldWhite,
        ),
      ),
    ]);
  }

  Widget buildLogoWidget() => Container(
        child: Image(
          image: AssetImage("assets/images/theme/logo.png"),
          width: 200,
        ),
      );
}
