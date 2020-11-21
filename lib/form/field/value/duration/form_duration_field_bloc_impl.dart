import 'package:fedi/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FormDurationFieldBloc extends FormValueFieldBloc<Duration>
    implements IFormDurationFieldBloc {
  @override
  final Duration minDuration;
  @override
  final Duration maxDuration;

  FormDurationFieldBloc({
    @required Duration originValue,
    @required this.minDuration,
    @required this.maxDuration,
  }) : super(originValue: originValue, validators: []);
}
