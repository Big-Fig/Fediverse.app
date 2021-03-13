import 'package:fedi/app/duration/picker/duration_picker_model.dart';
import 'package:flutter/widgets.dart';
import 'package:duration_picker/duration_picker.dart'
    as duration_picker;

Future<DurationPickerResult> showDurationPicker({
  @required BuildContext context,
  @required String popupTitle,
  @required Duration minDuration,
  @required Duration currentDuration,
  @required Duration maxDuration,
  @required bool isDeletePossible,
}) async {
  if (isDeletePossible) {
    throw UnsupportedError("Deleting not implemented yet");
  }

  var pickedDuration = await duration_picker.showDurationPicker(
    context: context,
    initialTime: currentDuration,
  );

  Duration resultDuration;

  if (pickedDuration != null) {
    if ((maxDuration == null || pickedDuration < maxDuration) &&
        (minDuration == null || pickedDuration > minDuration)) {
      resultDuration = pickedDuration;
    } else {
      if ((maxDuration == null || pickedDuration > maxDuration)) {
        resultDuration = maxDuration;
      } else {
        resultDuration = minDuration;
      }
    }
  } else {
    resultDuration = null;
  }

  return DurationPickerResult(
    deleted: false,
    canceled: resultDuration == null,
    duration: resultDuration,
  );
}
