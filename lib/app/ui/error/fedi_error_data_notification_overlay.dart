import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

void showFediErrorDataNotificationOverlay({
  @required String contentText,
  @required String titleText,
}) {
  showSimpleNotification(
    FediDarkStatusBarStyleArea(
      child: Text(
        contentText,
        style: TextStyle(
          fontSize: 12,
          color: FediColors.white,
        ),
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
    background: FediColors.error,
  );
}
