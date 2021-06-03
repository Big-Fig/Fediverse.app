import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

void showPostStatusPostOverlayNotification({
  required BuildContext context,
  required IPostStatusBloc postStatusBloc,
  required bool isScheduled,
}) {
  var toastService = IToastService.of(context, listen: false);

  return toastService.showInfoToast(
    context: context,
    title: isScheduled
        ? S.of(context).app_status_post_toast_success_schedule
        : S.of(context).app_status_post_toast_success_post,
    content: null,
  );
}
