import 'package:fedi/app/ui/notification_overlay/fedi_notification_overlay.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showInfoFediNotificationOverlay({
  @required BuildContext context,
  @required String contentText,
  @required String titleText,
}) {
  return showFediNotificationOverlay(
      Text(
        contentText,
        style: IFediUiTextTheme.of(context, listen: false).smallShortWhite,
      ),
      subtitle: titleText != null
          ? Text(
              titleText,
              style: IFediUiTextTheme.of(context, listen: false).mediumShortBoldWhite,
            )
          : null,
      slideDismiss: true,
      background: IFediUiColorTheme.of(context, listen: false).primary);
}
