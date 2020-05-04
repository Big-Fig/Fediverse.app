import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

var requiredDurationToSchedule = Duration(minutes: 5);

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
              var newTime = await _showChooseDateTimeDialog(
                  context, postStatusBloc.scheduledAt);

              if (newTime
                  .isBefore(DateTime.now().add(requiredDurationToSchedule))) {
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

Future<DateTime> _showChooseDateTimeDialog(
    BuildContext context, DateTime oldValue) async {
  var now =
      DateTime.now()
          .add(requiredDurationToSchedule)
      // additional time to select time
          .add(Duration(minutes:2));
  var initialDate = now;

  if (oldValue != null) {
    var scheduledAt = oldValue;
    initialDate = scheduledAt.isAfter(now) ? scheduledAt : now;
  }

  var dateTime = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: initialDate,
    lastDate: initialDate.add(Duration(days: 365)),
  );

  if (dateTime != null) {
    var initialTimeOfDay = TimeOfDay.fromDateTime(initialDate);
    var timeOfDay =
        await showTimePicker(context: context, initialTime: initialTimeOfDay);

    if (timeOfDay != null) {
      dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
          timeOfDay.hour, timeOfDay.minute);

      return dateTime;
    } else {
      return null;
    }
  }
  {
    return null;
  }
}
