import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediLightStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediLightStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: fediUiColorTheme.transparent,
      ),
      child: child,
    );
  }
}
