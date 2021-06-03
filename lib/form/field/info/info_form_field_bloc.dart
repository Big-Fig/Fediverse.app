import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInfoFormFieldBloc<T> extends IFormFieldBloc {
  static IInfoFormFieldBloc<T> of<T>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInfoFormFieldBloc<T>>(context, listen: listen);

  T get currentValue;

  Stream<T> get currentValueStream;

  Future recalculate();
}
