import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_picker_model.freezed.dart';

@freezed
class DurationPickerResult with _$DurationPickerResult {
  const factory DurationPickerResult({
    required Duration? duration,
    required bool canceled,
    required bool deleted,
  }) = _DurationPickerResult;
}
