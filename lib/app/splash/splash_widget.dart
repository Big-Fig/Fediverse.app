import 'package:fedi/app/package_info/package_info_widget.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Center(
        child: _SplashLogoWidget(),
      ),
      Positioned(
        right: 20.0,
        bottom: 20.0,
        child: const _SplashVersionInfoWidget(),
      ),
    ]);
  }
}

class _SplashVersionInfoWidget extends StatelessWidget {
  const _SplashVersionInfoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VersionPackageInfoWidget(
      textStyle: lightFediUiTheme.textTheme.mediumShortBoldWhite,
    );
  }
}

class _SplashLogoWidget extends StatelessWidget {
  const _SplashLogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage("assets/images/theme/logo.png"),
        width: 200,
      ),
    );
  }
}
