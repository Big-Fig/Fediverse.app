import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FormDateTimeFieldBloc extends FormValueFieldBloc<DateTime>
    implements IFormDateTimeFieldBloc {
  final DateTime minDate;
  final DateTime maxDate;
  FormDateTimeFieldBloc({
    @required DateTime originValue,
    @required this.minDate,
    @required this.maxDate,
  }) : super(originValue: originValue, validators: []);
}
