import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareEntitySettingsBloc implements IDisposable {
  static IShareEntitySettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IShareEntitySettingsBloc>(context, listen: listen);

  ShareEntitySettings get shareEntitySettings;

  IShareMessageInputBloc get shareMessageInputBloc;

  IBoolValueFormFieldBloc get asLinkBoolField;

}
