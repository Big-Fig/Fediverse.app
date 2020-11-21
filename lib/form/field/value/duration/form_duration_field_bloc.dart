import 'package:fedi/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFormDurationFieldBloc extends IFormValueFieldBloc<Duration> {
  static IFormDurationFieldBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFormDurationFieldBloc>(context, listen: listen);


  Duration get minDuration;

  Duration get maxDuration;
}
