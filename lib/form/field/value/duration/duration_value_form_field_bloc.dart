import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDurationValueFormFieldBloc
    extends IValueFormFieldBloc<Duration?> {
  static IDurationValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDurationValueFormFieldBloc>(context, listen: listen);

  Duration? get maxDuration;

  Duration? get minDuration;

  void deleteValue();
}
