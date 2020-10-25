import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/scheduled/datetime/scheduled_status_datetime_picker_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

void showPostStatusScheduleDialog(
    BuildContext context, IPostStatusBloc postStatusBloc) async {
  var newTime = await showScheduledStatusDateTimePickerDialog(
      context, postStatusBloc.scheduledAt);

  if (newTime != null &&
      newTime.isBefore(DateTime.now()
          .add(IPostStatusBloc.requiredDurationToScheduleStatus))) {
    await FediSimpleAlertDialog(
      context: context,
      title: tr("app.status.post.schedule.error.not_in_future.dialog"
          ".title"),
      contentText: tr("app.status.post.schedule.error.not_in_future.dialog"
          ".content"),
    ).show(context);
  } else {
    postStatusBloc.schedule(newTime);
  }
}
