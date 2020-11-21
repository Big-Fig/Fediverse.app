import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditToastSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<ToastSettings> {
  static IEditToastSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditToastSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get notificationForChatAndDmFieldBloc;

  IBoolValueFormFieldBloc get notificationForMentionFieldBloc;
}
