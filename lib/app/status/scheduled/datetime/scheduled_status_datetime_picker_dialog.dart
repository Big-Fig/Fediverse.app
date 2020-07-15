import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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

  var dateTime = await DatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minTime: now,
    maxTime: now.add(Duration(days: 365)),
    currentTime: initialDate,
    theme: DatePickerTheme(
      headerColor: FediColors.white,
      backgroundColor: FediColors.white,
      itemStyle: FediTextStyles.mediumShortBoldDarkGrey,
      doneStyle: FediTextStyles.mediumShortBoldPrimary,
    ),
    onCancel: () {},
    onConfirm: (date) {
      print('confirm $date');
    },
  );
  _logger.finest(() => "showScheduledStatusDateTimePickerDialog result "
      "$dateTime ");

  return dateTime;
}
