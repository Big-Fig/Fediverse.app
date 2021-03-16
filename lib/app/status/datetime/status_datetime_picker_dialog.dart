import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_datetime_picker_dialog.dart");

Future<DateTime?> showStatusDateTimePickerDialog({
  required BuildContext context,
  DateTime? oldValue,
  String? pickerTitle,
}) async {
  var approximateDurationForSelection = Duration(minutes: 2);
  var now = DateTime.now();

  var initialDate = now
      .add(IPostStatusBloc.requiredDurationToSelectDateTime)
      .add(approximateDurationForSelection);

  if (oldValue != null) {
    var selectedDateTime = oldValue;
    initialDate = selectedDateTime.isAfter(now) ? selectedDateTime : now;
  }

  var dateTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minDateTime: now,
    maxDateTime: now.add(Duration(days: 365)),
    currentDateTime: initialDate,
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: pickerTitle,
    ),
    onCancel: () {},
    onConfirm: (date) {},
    isDeletePossible: false,
  );
  _logger.finest(() => "showStatusDateTimePickerDialog result "
      "$dateTime ");

  return dateTime;
}
