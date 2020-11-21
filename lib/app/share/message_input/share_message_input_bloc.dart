import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareMessageInputBloc implements IDisposable {
  static IShareMessageInputBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IShareMessageInputBloc>(context, listen: listen);

  IStringValueFormFieldBloc get messageField;
}
