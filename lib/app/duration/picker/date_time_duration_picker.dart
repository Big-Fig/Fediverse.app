import 'package:fedi/app/duration/picker/duration_picker_model.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logging/logging.dart';

final _logger = Logger("date_time_duration_picker.dart");

Future<DurationPickerResult> showDateTimeDurationPicker({
  @required BuildContext context,
  @required String popupTitle,
  @required Duration minDuration,
  @required Duration currentDuration,
  @required Duration maxDuration,
  @required bool isDeletePossible,
}) async {
  var minDateTime =
      minDuration != null ? Jiffy().add(duration: minDuration) : null;
  var maxDateTime =
      maxDuration != null ? Jiffy().add(duration: maxDuration) : null;

  var currentDateTime =
      currentDuration != null ? Jiffy().add(duration: currentDuration) : null;

  bool deleted = false;
  bool canceled = false;

  var pickedDateTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minDateTime: minDateTime,
    maxDateTime: maxDateTime,
    currentDateTime: currentDateTime,
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: popupTitle,
    ),
    // todo: rework callbacks to better future result
    onCancel: () {
      canceled = true;
    },
    onDelete: () {
      deleted = true;
    },
    isDeletePossible: isDeletePossible,
    onConfirm: (date) {},
  );

  Duration resultDuration;

  var now = DateTime.now();
  if (pickedDateTime != null) {
    var diffDuration = pickedDateTime.difference(now).abs();

    if ((maxDuration == null || diffDuration < maxDuration) &&
        (minDuration == null || diffDuration > minDuration)) {
      resultDuration = diffDuration;
    } else {
      if ((maxDuration == null || diffDuration > maxDuration)) {
        resultDuration = maxDuration;
      } else {
        resultDuration = minDuration;
      }
    }
  } else {
    resultDuration = null;
  }

  var durationPickerResult = DurationPickerResult(
    deleted: deleted,
    canceled: canceled,
    duration: resultDuration,
  );

  _logger.finest(() =>
      "showDateTimeDurationPicker durationPickerResult $durationPickerResult");

  return durationPickerResult;
}
