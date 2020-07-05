import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showFediNotificationOverlay(Widget content,
    {Widget leading,
    Widget subtitle,
    Widget trailing,
    EdgeInsetsGeometry contentPadding,
    Color background,
    Color foreground,
    double elevation = 16,
    Key key,
    bool autoDismiss = true,
    bool slideDismiss = false,
    NotificationPosition position = NotificationPosition.top}) {
  return showOverlayNotification((context) {
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
                    // ignore: deprecated_member_use
                    Theme.of(context)?.accentTextTheme?.title?.color,
                iconColor: foreground ??
                    // ignore: deprecated_member_use
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
