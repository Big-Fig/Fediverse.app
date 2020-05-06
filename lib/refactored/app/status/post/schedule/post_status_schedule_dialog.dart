import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/datetime/scheduled_status_datetime_picker_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

showPostStatusScheduleDialog(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  var isScheduled = postStatusBloc.isScheduled;
  var scheduledAt = postStatusBloc.scheduledAt;

  var appLocalizations = AppLocalizations.of(context);

  showAlert(
      context: context,
      title: appLocalizations.tr("app.status.post.schedule.dialog.title"),
      body: isScheduled
          ? appLocalizations.tr(
              "app.status.post.schedule.dialog.content.scheduled",
              args: [dateFormat.format(scheduledAt)])
          : appLocalizations
              .tr("app.status.post.schedule.dialog.content.not_scheduled"),
      actions: [
        AlertAction(
            text: appLocalizations
                .tr("app.status.post.schedule.dialog.action.cancel"),
            onPressed: () {}),
        AlertAction(
            text: appLocalizations
                .tr("app.status.post.schedule.dialog.action.edit"),
            onPressed: () async {
              var newTime = await showScheduledStatusDateTimePickerDialog(
                  context, postStatusBloc.scheduledAt);

              if (newTime
                  .isBefore(DateTime.now().add(IPostStatusBloc
                  .requiredDurationToScheduleStatus))) {
                showAlert(
                  context: context,
                  title: appLocalizations
                      .tr("app.status.post.schedule.error.not_in_future.dialog"
                          ".title"),
                  body: appLocalizations
                      .tr("app.status.post.schedule.error.not_in_future.dialog"
                          ".content"),
                );
              } else {
                postStatusBloc.schedule(newTime);
              }
            }),
        if (isScheduled)
          AlertAction(
              text: appLocalizations
                  .tr("app.status.post.schedule.dialog.action.clear"),
              onPressed: () async {
                postStatusBloc.clearSchedule();
              })
      ]);
}
