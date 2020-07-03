import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

void showFediErrorDataNotificationOverlay({
  @required String contentText,
  @required String titleText,
}) {

  // custom code to add FediLightStatusBarStyleArea
  var content = Text(
    contentText,
    style: TextStyle(
      fontSize: 12,
      color: FediColors.white,
    ),
  );
  var subtitle = titleText != null
      ? Text(
        titleText,
        style: TextStyle(
          fontSize: 12,
          color: FediColors.white,
          fontWeight: FontWeight.w500,
        ),
      )
      : null;
  var slideDismiss = true;
  var background = FediColors.error;
  var foreground;

  double elevation = 16;
  Key key;
  bool autoDismiss = true;

  NotificationPosition position = NotificationPosition.top;
  Widget leading;

  Widget trailing;
  EdgeInsetsGeometry contentPadding;

  showOverlayNotification((context) {
    return SlideDismissible(
      enable: slideDismiss,
      key: ValueKey(key),
      child: FediLightStatusBarStyleArea(
        child: Material(
          color: background ?? Theme.of(context)?.accentColor,
          elevation: elevation,
          child: SafeArea(
              bottom: position == NotificationPosition.bottom,
              top: position == NotificationPosition.top,
              child: ListTileTheme(
                textColor: foreground ??
                    Theme.of(context)?.accentTextTheme?.title?.color,
                iconColor: foreground ??
                    Theme.of(context)?.accentTextTheme?.title?.color,
                child: ListTile(
                  leading: leading,
                  title: content,
                  subtitle: subtitle,
                  trailing: trailing,
                  contentPadding: contentPadding,
                ),
              )),
        ),
      ),
    );
  },
      duration: autoDismiss ? null : Duration.zero,
      key: key,
      position: position);
}
