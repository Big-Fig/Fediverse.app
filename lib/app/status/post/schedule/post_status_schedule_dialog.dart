import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/scheduled/datetime/scheduled_status_datetime_picker_dialog.dart';
import 'package:fedi/app/ui/dialog/fedi_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

void showPostStatusScheduleDialog(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  var isScheduled = postStatusBloc.isScheduled;
  var scheduledAt = postStatusBloc.scheduledAt;



  showFediAlertDialog(
      context: context,
      title: tr("app.status.post.schedule.dialog.title"),
      body: isScheduled
          ? tr(
              "app.status.post.schedule.dialog.content.scheduled",
              args: [dateFormat.format(scheduledAt)])
          : tr("app.status.post.schedule.dialog.content.not_scheduled"),
      actions: [
        AlertAction(
            text: tr("app.status.post.schedule.dialog.action.cancel"),
            onPressed: () {}),
        AlertAction(
            text: tr("app.status.post.schedule.dialog.action.edit"),
            onPressed: () async {
              var newTime = await showScheduledStatusDateTimePickerDialog(
                  context, postStatusBloc.scheduledAt);

              if (newTime.isBefore(DateTime.now()
                  .add(IPostStatusBloc.requiredDurationToScheduleStatus))) {
                showFediAlertDialog(
                  context: context,
                  title: tr("app.status.post.schedule.error.not_in_future.dialog"
                          ".title"),
                  body: tr("app.status.post.schedule.error.not_in_future.dialog"
                          ".content"),
                );
              } else {
                postStatusBloc.schedule(newTime);
              }
            }),
        if (isScheduled)
          AlertAction(
              text: tr("app.status.post.schedule.dialog.action.clear"),
              onPressed: () async {
                postStatusBloc.clearSchedule();
              })
      ]);
}

