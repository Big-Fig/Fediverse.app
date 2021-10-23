import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFormFieldBloc extends IFormItemBloc {
  static IFormFieldBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFormFieldBloc>(context, listen: listen);

  bool get isEnabled;

  Stream<bool> get isEnabledStream;

  // ignore: avoid_positional_boolean_parameters
  void changeIsEnabled(bool enabled);
}
