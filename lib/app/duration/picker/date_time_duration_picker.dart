import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';

Future<Duration> showDateTimeDurationPicker({
  @required BuildContext context,
  @required String popupTitle,
  @required Duration minDuration,
  @required Duration currentDuration,
  @required Duration maxDuration,
}) async {
  var jiffy = Jiffy();

  var minDateTime =
      minDuration != null ? jiffy.add(duration: minDuration) : null;
  var maxDateTime =
      maxDuration != null ? jiffy.add(duration: maxDuration) : null;

  var currentDateTime =
      currentDuration != null ? jiffy.add(duration: currentDuration) : null;
  var dateTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minDateTime: minDateTime,
    maxDateTime: maxDateTime,
    currentDateTime: currentDateTime,
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: popupTitle,
    ),
    onCancel: () {},
    onConfirm: (date) {},
  );

  var now = DateTime.now();
  if (dateTime != null) {
    var diffDuration = dateTime.difference(now).abs();

    if ((maxDuration == null || diffDuration < maxDuration) &&
        (minDuration == null || diffDuration > minDuration)) {
      return diffDuration;
    } else {
      if ((maxDuration == null || diffDuration > maxDuration)) {
        return maxDuration;
      } else {
        return minDuration;
      }
    }
  } else {
    return null;
  }
}
