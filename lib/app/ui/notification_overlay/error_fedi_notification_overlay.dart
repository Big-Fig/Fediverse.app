import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/notification_overlay/fedi_notification_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showErrorFediNotificationOverlay({
  @required String contentText,
  @required String titleText,
}) {
  return showFediNotificationOverlay(
      Text(
        contentText,
        style: TextStyle(
          fontSize: 12,
          color: FediColors.white,
        ),
      ),
      subtitle: titleText != null
          ? Text(
              titleText,
              style: TextStyle(
                fontSize: 12,
                color: FediColors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      slideDismiss: true,
      background: FediColors.error);
}
