import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/package_info/version_package_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

    var _progressSize = 40.0;
class AppInitPage extends StatelessWidget {
  final String text;

  const AppInitPage({this.text});

  @override
  Widget build(BuildContext context) {
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: FediColors.primaryColor,
        body: Center(
          child: SafeArea(
            child: Stack(children: <Widget>[
              Center(
                child: buildLogoWidget(),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _progressSize,
                      height: _progressSize,
                      child: FediCircularProgressIndicator(
                        color: FediColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (text != null)
                Positioned(
                  left: 20.0,
                  right: 20.0,
                  bottom: _progressSize,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: FediColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: VersionPackageInfoWidget(
                  textStyle: TextStyle(
                    color: FediColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Container buildLogoWidget() {
    return Container(
      child: Image(
        image: AssetImage("assets/images/theme/logo.png"),
        width: 200,
      ),
    );
  }
}
