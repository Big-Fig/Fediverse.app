import 'package:fedi/form/field/value/date_time/date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class DateTimeValueFormFieldBloc extends ValueFormFieldBloc<DateTime>
    implements IDateTimeValueFormFieldBloc {
  @override
  final DateTime minDateTime;
  @override
  final DateTime maxDateTime;
  DateTimeValueFormFieldBloc({
    @required DateTime originValue,
    @required this.minDateTime,
    @required this.maxDateTime,
  }) : super(originValue: originValue, validators: []);
}
