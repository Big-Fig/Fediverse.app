import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediDarkStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  const FediDarkStatusBarStyleArea({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    if (fediUiColorTheme.brightness == Brightness.light) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: IFediUiColorTheme.of(context).white,
        ),
        child: child,
      );
    } else {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: fediUiColorTheme.transparent,
        ),
        child: child,
      );
    }
  }
}
