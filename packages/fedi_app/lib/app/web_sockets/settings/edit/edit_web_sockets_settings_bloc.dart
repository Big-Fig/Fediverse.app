import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditWebSocketsSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<WebSocketsSettings> {
  static IEditWebSocketsSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditWebSocketsSettingsBloc>(context, listen: listen);

  IWebSocketsModeSingleFromListValueFormFieldBloc get typeFieldBloc;
}
