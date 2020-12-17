import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

class DurationValueFormFieldBloc extends ValueFormFieldBloc<Duration>
    implements IDurationValueFormFieldBloc {
  @override
  final Duration minDuration;
  @override
  final Duration maxDuration;

  DurationValueFormFieldBloc({
    @required Duration originValue,
    @required this.minDuration,
    @required this.maxDuration,
    @required bool isNullValuePossible,
    @required bool isEnabled,
    List<FormValueFieldValidation<Duration>> validators = const [],
  }) : super(
          originValue: originValue,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
          isEnabled: isEnabled,
        );

  @override
  void deleteValue() {
    changeCurrentValue(null);
  }
}
