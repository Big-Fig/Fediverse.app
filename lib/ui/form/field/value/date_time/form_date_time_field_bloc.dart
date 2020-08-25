import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';

abstract class IFormDateTimeFieldBloc extends IFormValueFieldBloc<DateTime> {
  DateTime get minDateTime;

  DateTime get maxDateTime;
}
