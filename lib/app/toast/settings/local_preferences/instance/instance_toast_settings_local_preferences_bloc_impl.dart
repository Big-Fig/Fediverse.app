import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class InstanceToastSettingsLocalPreferencesBloc
    extends ToastSettingsLocalPreferencesBloc
    implements IInstanceToastSettingsLocalPreferencesBloc {
  InstanceToastSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(preferencesService, "toast.settings.instance.$userAtHost");
}
