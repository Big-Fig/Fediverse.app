import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/form/form_item_validation.dart';

class DurationDateTimeValueFormFieldBlocAdapter extends DisposableOwner
    implements IDurationValueFormFieldBloc {
  final IDurationDateTimeValueFormFieldBloc durationDateTimeValueFormFieldBloc;

  DurationDateTimeValueFormFieldBlocAdapter(
    this.durationDateTimeValueFormFieldBloc,
  );

  @override
  Duration? get currentValue =>
      durationDateTimeValueFormFieldBloc.currentValueDuration;

  @override
  Stream<Duration?> get currentValueStream =>
      durationDateTimeValueFormFieldBloc.currentValueDurationStream;

  @override
  void changeCurrentValue(Duration? newValue) {
    durationDateTimeValueFormFieldBloc.changeCurrentValueDuration(newValue);
  }

  @override
  void changeIsEnabled(bool enabled) {
    durationDateTimeValueFormFieldBloc.changeIsEnabled(enabled);
  }

  @override
  void clear() {
    durationDateTimeValueFormFieldBloc.clear();
  }

  @override
  void deleteValue() {
    durationDateTimeValueFormFieldBloc.deleteValue();
  }

  @override
  Future dispose() async {
    await super.dispose();

    return durationDateTimeValueFormFieldBloc.dispose();
  }

  @override
  List<FormItemValidationError> get errors =>
      durationDateTimeValueFormFieldBloc.errors;

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      durationDateTimeValueFormFieldBloc.errorsStream;

  @override
  bool get isEnabled => durationDateTimeValueFormFieldBloc.isEnabled;

  @override
  Stream<bool> get isEnabledStream =>
      durationDateTimeValueFormFieldBloc.isEnabledStream;

  @override
  bool get isHaveAtLeastOneError =>
      durationDateTimeValueFormFieldBloc.isHaveAtLeastOneError;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      durationDateTimeValueFormFieldBloc.isHaveAtLeastOneErrorStream;

  @override
  bool get isNullValuePossible =>
      durationDateTimeValueFormFieldBloc.isNullValuePossible;

  @override
  bool get isSomethingChanged =>
      durationDateTimeValueFormFieldBloc.isSomethingChanged;

  @override
  Stream<bool> get isSomethingChangedStream =>
      durationDateTimeValueFormFieldBloc.isSomethingChangedStream;

  @override
  Duration? get maxDuration => durationDateTimeValueFormFieldBloc.maxDuration;

  @override
  Duration? get minDuration => durationDateTimeValueFormFieldBloc.minDuration;

  @override
  Duration? get originValue =>
      durationDateTimeValueFormFieldBloc.originValue?.duration;

  @override
  void updateValidators(List<FormValueFieldValidation<Duration?>> validators) {
    durationDateTimeValueFormFieldBloc.updateValidators(
      validators
          .map(
            (validator) => (DurationDateTime? durationDateTime) => validator(
                  durationDateTime?.duration,
                ),
          )
          .toList(),
    );
  }

  @override
  List<FormValueFieldValidation<Duration?>> get validators =>
      durationDateTimeValueFormFieldBloc.validators
          .map(
            (validator) => (Duration? duration) => validator(
                  DurationDateTime(
                    duration: duration,
                    dateTime: null,
                  ),
                ),
          )
          .toList();
}
