import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditStatusSensitiveSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc {
  static IEditStatusSensitiveSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditStatusSensitiveSettingsBloc>(context, listen: listen);

  IFormValueFieldBloc<Duration> get nsfwDisplayDelayDurationFieldBloc;

  IFormBoolFieldBloc get isAlwaysShowSpoilerFieldBloc;

  IFormBoolFieldBloc get isAlwaysShowNsfwFieldBloc;
}
