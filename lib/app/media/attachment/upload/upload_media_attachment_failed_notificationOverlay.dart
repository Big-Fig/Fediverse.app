import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showMediaAttachmentFailedNotificationOverlay(
        BuildContext context) =>
    showErrorFediNotificationOverlay(
        contentText:
            "app.media.attachment.upload.failed.notification.content".tr(),
        titleText: null);
