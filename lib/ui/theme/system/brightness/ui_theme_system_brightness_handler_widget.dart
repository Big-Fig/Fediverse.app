import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:flutter/material.dart';

class UiThemeSystemBrightnessHandlerWidget extends StatefulWidget {
  final Widget child;

  const UiThemeSystemBrightnessHandlerWidget({
    required this.child,
  });

  @override
  UiThemeSystemBrightnessHandlerWidgetState createState() =>
      UiThemeSystemBrightnessHandlerWidgetState();
}

class UiThemeSystemBrightnessHandlerWidgetState
    extends State<UiThemeSystemBrightnessHandlerWidget> {
  VoidCallback? oldOnPlatformBrightnessChanged;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final window = WidgetsBinding.instance!.window;
    oldOnPlatformBrightnessChanged = window.onPlatformBrightnessChanged;

    var uiThemeSystemHandlerBloc =
        IUiThemeSystemBrightnessBloc.of(context, listen: false);
    window.onPlatformBrightnessChanged = () {
      uiThemeSystemHandlerBloc
          .onSystemBrightnessChanged(window.platformBrightness);

      oldOnPlatformBrightnessChanged?.call();
    };

    uiThemeSystemHandlerBloc
        .onSystemBrightnessChanged(window.platformBrightness);
  }

  @override
  void dispose() {
    final window = WidgetsBinding.instance!.window;

    if (oldOnPlatformBrightnessChanged != null) {
      oldOnPlatformBrightnessChanged = null;
    } else {
      window.onPlatformBrightnessChanged = oldOnPlatformBrightnessChanged;
    }
    oldOnPlatformBrightnessChanged = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
