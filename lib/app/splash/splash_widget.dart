import 'package:fedi/app/package_info/version_package_info_widget.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  final bool displayVersionInfo;

  const SplashWidget({
    Key? key,
    required this.displayVersionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          const Center(
            child: _SplashLogoWidget(),
          ),
          if (displayVersionInfo)
            const Positioned(
              // ignore: no-magic-number
              right: 20.0,
              // ignore: no-magic-number
              bottom: 20.0,
              child: _SplashVersionInfoWidget(),
            ),
        ],
      );
}

class _SplashVersionInfoWidget extends StatelessWidget {
  const _SplashVersionInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => VersionPackageInfoWidget(
        textStyle: lightFediUiTheme.textTheme.mediumShortBoldWhite,
      );
}

class _SplashLogoWidget extends StatelessWidget {
  const _SplashLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Image(
        image: AssetImage('assets/images/theme/logo.png'),
        // ignore: no-magic-number
        width: 200,
      );
}
