import 'package:fedi/app/push/settings/filter/push_filter_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPushFilterSettingsBloc
    implements IEditInstanceSettingsBloc<PushFilterSettings?> {
  static IEditPushFilterSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditPushFilterSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get blockFromStrangersFieldBloc;

  IBoolValueFormFieldBloc get hideNotificationContentsFieldBloc;
}
