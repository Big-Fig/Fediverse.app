import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("scheduled_status_datetime_picker_dialog.dart");

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

  var dateTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minTime: now,
    maxTime: now.add(Duration(days: 365)),
    currentTime: initialDate,
    theme: FediDatePickerTheme.byDefault(
        customTitle: "app.status.scheduled.datetime.picker.title".tr()),
    onCancel: () {},
    onConfirm: (date) {},
  );
  _logger.finest(() => "showScheduledStatusDateTimePickerDialog result "
      "$dateTime ");

  return dateTime;
}
