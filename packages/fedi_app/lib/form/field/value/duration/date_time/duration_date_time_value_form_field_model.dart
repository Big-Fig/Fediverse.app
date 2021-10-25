import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_date_time_value_form_field_model.freezed.dart';

@freezed
class DurationDateTime with _$DurationDateTime {
  const factory DurationDateTime({
    required Duration? duration,
    required DateTime? dateTime,
  }) = _DurationDateTime;
}
