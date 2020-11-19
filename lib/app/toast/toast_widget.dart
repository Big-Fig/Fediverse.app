import 'package:fedi/app/toast/toast_model.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final ToastType toastType;

  final String title;
  final String content;

  ToastWidget({
    @required this.toastType,
    @required this.title,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var backgroundColor;
    var iconColor;
    var textColor;

    switch (toastType) {
      case ToastType.error:
        backgroundColor = fediUiColorTheme.error;
        iconColor = fediUiColorTheme.white;
        textColor = fediUiColorTheme.white;
        break;
      case ToastType.info:
        backgroundColor = fediUiColorTheme.primaryDark;
        iconColor = fediUiColorTheme.white;
        textColor = fediUiColorTheme.white;
        break;
    }

    return FediLightStatusBarStyleArea(
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          bottom: false,
          top: true,
          child: ListTileTheme(
            textColor: textColor,
            iconColor: iconColor,
            child: ListTile(
              title: Text(
                title,
                style: fediUiTextTheme.bigShortBoldWhite,
              ),
              subtitle: Text(
                content,
                style: fediUiTextTheme.smallWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
