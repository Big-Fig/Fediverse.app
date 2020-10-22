import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_proxy_provider.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_bloc.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_widget.dart';
import 'package:fedi/ui/theme/ui_theme_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediWindow extends StatelessWidget {
  final Widget child;

  FediWindow({@required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IFediUiTheme>(
      builder: (context, snapshot) {
        var currentTheme = snapshot.data;

        if (currentTheme == null) {
          return buildThemeBasedOnSystemBrightness(context);
        } else {
          return buildCurrentTheme(currentTheme);
        }
      },
    );
  }

  Widget buildCurrentTheme(IFediUiTheme currentTheme) =>
      Provider<IFediUiTheme>.value(
        value: currentTheme,
        child: FediUiThemeProxyProvider(
          child: UiThemeProxyProvider(
            child: UiThemeSystemBrightnessHandlerWidget(
              child: child,
            ),
          ),
        ),
      );

  Widget buildThemeBasedOnSystemBrightness(BuildContext context) {
    var systemBrightnessHandlerBloc =
        IUiThemeSystemBrightnessHandlerBloc.of(context, listen: false);

    return StreamBuilder<Brightness>(
      stream: systemBrightnessHandlerBloc.systemBrightnessStream,
      builder: (context, snapshot) {
        var systemBrightness = snapshot.data;

        if (systemBrightness == null) {
          return buildCurrentTheme(lightFediUiTheme);
        } else {
          switch (systemBrightness) {
            case Brightness.dark:
              return buildCurrentTheme(darkFediUiTheme);
              break;
            case Brightness.light:
              return buildCurrentTheme(lightFediUiTheme);
              break;
          }

          throw "Unsupported systemBrightness $systemBrightness";
        }
      },
    );
  }
}
