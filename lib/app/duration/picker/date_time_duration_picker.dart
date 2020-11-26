import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:flutter/widgets.dart';

Future<Duration> showDateTimeDurationPicker({
  @required BuildContext context,
  @required String popupTitle,
  @required Duration minDuration,
  @required Duration currentDuration,
  @required Duration maxDuration,
}) async {
  var now = DateTime.now();
  var dateTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minDateTime: minDuration != null ? now.add(minDuration) : null,
    maxDateTime: maxDuration != null ? now.add(maxDuration) : null,
    currentDateTime: now.add(currentDuration ?? now),
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: popupTitle,
    ),
    onCancel: () {},
    onConfirm: (date) {},
  );

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
