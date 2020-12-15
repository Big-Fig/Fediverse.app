import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class DurationDateTimeValueFormFieldBloc extends DurationValueFormFieldBloc
    implements IDurationDateTimeValueFormFieldBloc {
  final DateTime originalDateTime;
  DurationDateTimeValueFormFieldBloc({
    @required Duration originValue,
    @required Duration minDuration,
    @required Duration maxDuration,
    @required bool isNullValuePossible,
    @required bool isEnabled,
    @required this.originalDateTime,
  }) : super(
          originValue: originValue,
          isNullValuePossible: isNullValuePossible,
          isEnabled: isEnabled,
          minDuration: minDuration,
          maxDuration: maxDuration,
        );

  int get currentValueInTotalSeconds => currentValue != null ? currentValue.inMilliseconds *
      Duration.microsecondsPerMillisecond *
      Duration.millisecondsPerSecond : null;
}
