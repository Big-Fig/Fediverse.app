import 'package:fedi/app/duration/picker/date_time_duration_picker.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_duration_picker_dialog.dart");

Future<Duration> showStatusDurationPickerDialog({
  BuildContext context,
  Duration oldValue,
  String pickerTitle,
}) async {
  var durationForSelection = Duration(minutes: 5);
  var minimumExpireDuration =
      IPostStatusBloc.minimumExpireDuration + durationForSelection;

  var pickerResult = await showDateTimeDurationPicker(
    context: context,
    popupTitle: pickerTitle,
    minDuration: minimumExpireDuration,
    currentDuration: oldValue ?? minimumExpireDuration,
    maxDuration: null,
    isDeletePossible: true,
  );

  _logger.finest(() => "showStatusDateTimePickerDialog result "
      "$pickerResult ");

  if (pickerResult.deleted) {
    return null;
  } else if (pickerResult.canceled) {
    return oldValue;
  } else {
    return pickerResult.duration;
  }
}
