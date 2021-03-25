import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditStatusSensitiveSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<StatusSensitiveSettings> {
  static IEditStatusSensitiveSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditStatusSensitiveSettingsBloc>(context, listen: listen);

  IDurationValueFormFieldBloc get nsfwDisplayDelayDurationFieldBloc;

  IBoolValueFormFieldBloc get isAlwaysShowSpoilerFieldBloc;

  IBoolValueFormFieldBloc get isAlwaysShowNsfwFieldBloc;
}
