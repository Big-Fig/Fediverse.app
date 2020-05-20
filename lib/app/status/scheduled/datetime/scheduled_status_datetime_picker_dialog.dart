import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<DateTime> showScheduledStatusDateTimePickerDialog(
    BuildContext context, DateTime oldValue) async {
  var now = DateTime.now()
      .add(IPostStatusBloc.requiredDurationToScheduleStatus)
      // additional time to select time
      .add(Duration(minutes: 2));
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
