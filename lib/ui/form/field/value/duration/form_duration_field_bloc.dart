import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';

abstract class IFormDurationFieldBloc extends IFormValueFieldBloc<Duration> {
  Duration get minDuration;

  Duration get maxDuration;
}
