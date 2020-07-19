import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/package_info/version_package_info_widget.dart';
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
          textStyle: FediTextStyles.mediumShortBoldWhite,
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
