import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FormDateTimeFieldBloc extends FormValueFieldBloc<DateTime>
    implements IFormDateTimeFieldBloc {
  @override
  final DateTime minDateTime;
  @override
  final DateTime maxDateTime;
  FormDateTimeFieldBloc({
    @required DateTime originValue,
    @required this.minDateTime,
    @required this.maxDateTime,
  }) : super(originValue: originValue, validators: []);
}
