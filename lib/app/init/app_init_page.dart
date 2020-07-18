import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/package_info/version_package_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppInitPage extends StatelessWidget {

  const AppInitPage();

  @override
  Widget build(BuildContext context) {
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: FediColors.primaryColorDark,
        body: Center(
          child: SafeArea(
            child: Stack(children: <Widget>[
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
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildLogoWidget() => Container(
      child: Image(
        image: AssetImage("assets/images/theme/logo.png"),
        width: 200,
      ),
    );


}
