import 'package:fedi/app/status/datetime/status_datetime_picker_dialog.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

void showPostStatusScheduleDialog({
  required BuildContext context,
  required IPostStatusBloc postStatusBloc,
}) async {
  var newTime = await showStatusDateTimePickerDialog(
    context: context,
    oldValue: postStatusBloc.scheduledAt,
    pickerTitle: S.of(context).app_status_scheduled_datetime_picker_title,
  );

  var now = DateTime.now();
  var minDateTimeToSchedule =
      now.add(IPostStatusBloc.requiredDurationToSelectDateTime);
  if (newTime != null && newTime.isBefore(minDateTimeToSchedule)) {
    await FediSimpleAlertDialog(
      context: context,
      title:
          S.of(context).app_status_post_schedule_error_notInFuture_dialog_title,
      contentText: S
          .of(context)
          .app_status_post_schedule_error_notInFuture_dialog_content,
    ).show(context);
  } else {
    postStatusBloc.setScheduledAt(newTime);
  }
}
