import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditInstanceAnnouncementSettingsBloc
    implements IEditInstanceSettingsBloc<InstanceAnnouncementSettings?> {
  static IEditInstanceAnnouncementSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditInstanceAnnouncementSettingsBloc>(
        context,
        listen: listen,
      );

  IBoolValueFormFieldBloc get withDismissedFieldBloc;
}
