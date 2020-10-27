import 'dart:math';

import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

final _numberFormat = NumberFormat("#.#");

OverlaySupportEntry showMediaAttachmentFailedNotificationOverlay(
    BuildContext context, dynamic e) {
  String contentText;
  if (e is UploadMediaExceedFileSizeLimitException) {
    // todo: todo rework copy-pasted code
    contentText = S
        .of(context)
        .app_media_upload_failed_notification_exceedSize_content(
          _numberFormat.format(e.currentFileSizeInBytes / pow(1024, 2)),
          _numberFormat.format(e.maximumFileSizeInBytes / pow(1024, 2)),
        );
  } else {
    contentText = e.toString();
  }
  return showErrorFediNotificationOverlay(
    context: context,
    contentText: contentText,
    titleText: S.of(context).app_media_upload_failed_notification_title,
  );
}
