import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

final _numberFormat = NumberFormat("#.#");

OverlaySupportEntry showMediaAttachmentFailedNotificationOverlay(
    BuildContext context, dynamic e) {
  String contentText;
  if (e is UploadMediaExceedFileSizeLimitException) {
    // todo: todo rework copy-pasted code
    contentText = "app.media.attachment.upload.failed.notification"
            ".exceed_size.content"
        .tr(
      args: [
        _numberFormat.format(e.currentFileSizeInBytes / pow(1024, 2)),
        _numberFormat.format(e.maximumFileSizeInBytes / pow(1024, 2)),
      ],
    );
  } else {
    contentText = e.toString();
  }
  return showErrorFediNotificationOverlay(
    context: context,
    contentText: contentText,
    titleText: "app.media.attachment.upload.failed.notification.title".tr(),
  );
}
