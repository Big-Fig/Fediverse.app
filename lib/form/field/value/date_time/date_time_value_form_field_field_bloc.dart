import 'package:fedi/form/field/value/value_form_field_bloc.dart';

abstract class IDateTimeValueFormFieldBloc extends IValueFormFieldBloc<DateTime> {
  DateTime get minDateTime;

  DateTime get maxDateTime;
}
