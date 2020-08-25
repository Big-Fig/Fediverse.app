import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showPostStatusPostOverlayNotification(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  var isScheduled = postStatusBloc.isScheduled;

  return showInfoFediNotificationOverlay(
      contentText: isScheduled
          ? tr("app.status.post.toast.success.schedule")
          : tr("app.status.post.toast.success.post"),
      titleText: null);
}
