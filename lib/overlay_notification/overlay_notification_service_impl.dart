import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/overlay_notification/overlay_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

class OverlayNotificationService extends DisposableOwner
    implements IOverlayNotificationService {
  OverlaySupportEntry showFediNotificationOverlay(Widget content,
      {Widget? leading,
      Widget? subtitle,
      Widget? trailing,
      EdgeInsetsGeometry? contentPadding,
      Color? background,
      Color? foreground,
      double elevation = 16,
      Key? key,
      bool autoDismiss = true,
      bool slideDismiss = false,
      NotificationPosition position = NotificationPosition.top}) {
    return showOverlayNotification((context) {
      return SlideDismissible(
        enable: slideDismiss,
        key: ValueKey(key),
        child: FediLightStatusBarStyleArea(
          child: Material(
            color: background ?? Theme.of(context).accentColor,
            elevation: elevation,
            child: SafeArea(
                bottom: position == NotificationPosition.bottom,
                top: position == NotificationPosition.top,
                child: ListTileTheme(
                  textColor: foreground ??
                      Theme.of(context).accentTextTheme.headline6?.color,
                  iconColor: foreground ??
                      Theme.of(context).accentTextTheme.headline6?.color,
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

  @override
  void showNotification({
    required Widget child,
    required bool slideDismissible,
    required Key key,
    required Duration duration,
  }) {
    showOverlayNotification(
      (context) {
        return SlideDismissible(
          enable: slideDismissible,
          key: ValueKey(key),
          child: child,
        );
      },
      duration: duration,
      key: key,
      position: NotificationPosition.top,
    );
  }
}
