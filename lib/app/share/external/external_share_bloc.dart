import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IExternalShareBloc extends IShareBloc {
  static IExternalShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IExternalShareBloc>(context, listen: listen);

  IShareMessageInputBloc get shareMessageInputBloc;

  IBoolValueFormFieldBloc get asLinkBoolField;
}
