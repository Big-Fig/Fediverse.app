import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry showPostStatusPostOverlayNotification(
    {@required BuildContext context,
    @required IPostStatusBloc postStatusBloc,
    @required bool isScheduled}) {
  return showInfoFediNotificationOverlay(
    context: context,
    contentText: isScheduled
        ? S.of(context).app_status_post_toast_success_schedule
        : S.of(context).app_status_post_toast_success_post,
    titleText: null,
  );
}
