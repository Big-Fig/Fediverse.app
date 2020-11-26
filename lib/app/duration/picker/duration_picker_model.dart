import 'package:fedi/app/duration/picker/date_time_duration_picker.dart';
import 'package:fedi/app/duration/picker/duration_picker.dart';
import 'package:flutter/widgets.dart';

enum DurationPickerType {
  duration,
  dateTime,
}

extension DurationPickerTypeExtension on DurationPickerType {
  Future<Duration> showPicker({
    @required BuildContext context,
    @required String popupTitle,
    @required Duration minDuration,
    @required Duration currentDuration,
    @required Duration maxDuration,
  }) {
    switch (this) {
      case DurationPickerType.duration:
        return showDurationPicker(
          context: context,
          popupTitle: popupTitle,
          minDuration: minDuration,
          currentDuration: currentDuration,
          maxDuration: maxDuration,
        );
        break;
      case DurationPickerType.dateTime:
        return showDateTimeDurationPicker(
          context: context,
          popupTitle: popupTitle,
          minDuration: minDuration,
          currentDuration: currentDuration,
          maxDuration: maxDuration,
        );
        break;
      default:
        throw "Invalid DurationPickerType $this";
    }
  }
}
