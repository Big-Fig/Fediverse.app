import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/error/fedi_error_data_notification_overlay.dart';
import 'package:flutter/cupertino.dart';

void showMediaAttachmentFailedNotification(BuildContext context) {
  return showFediErrorDataNotificationOverlay(
      contentText:
          "app.media.attachment.upload.failed.notification.content".tr(),
      titleText: null);
}
