import 'package:flutter/widgets.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart'
    as flutter_duration_picker;

Future<Duration> showDurationPicker({
  @required BuildContext context,
  @required String popupTitle,
  @required Duration minDuration,
  @required Duration currentDuration,
  @required Duration maxDuration,
}) async {

  var resultDuration = await flutter_duration_picker.showDurationPicker(
    context: context,
    initialTime: currentDuration,
  );

  if (resultDuration != null) {
    if ((maxDuration == null || resultDuration < maxDuration) &&
        (minDuration == null || resultDuration > minDuration)) {
      return resultDuration;
    } else {
      if ((maxDuration == null || resultDuration > maxDuration)) {
        return maxDuration;
      } else {
        return minDuration;
      }
    }
  } else {
    return null;
  }
}
