import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/package_info/version_package_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FediColors.primaryColor,
      body: Center(
        child: SafeArea(
          child: Stack(children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  backgroundColor: FediColors.white,
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
    );
  }

  const InitAppPage();
}
