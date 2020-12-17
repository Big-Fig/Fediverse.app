import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/generated/l10n.dart';
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
    minDateTime: now,
    maxDateTime: now.add(Duration(days: 365)),
    currentDateTime: initialDate,
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: S.of(context).app_status_scheduled_datetime_picker_title,
    ),
    onCancel: () {},
    onConfirm: (date) {},
    isDeletePossible: false,
  );
  _logger.finest(() => "showScheduledStatusDateTimePickerDialog result "
      "$dateTime ");

  return dateTime;
}
