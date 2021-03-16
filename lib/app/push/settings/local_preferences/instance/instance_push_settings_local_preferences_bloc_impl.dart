import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstancePushSettingsLocalPreferencesBloc
    extends PushSettingsLocalPreferencesBloc
    implements IInstancePushSettingsLocalPreferencesBloc {
  InstancePushSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "$userAtHost.push.subscription",
        );

  @override
  PushSettings get defaultValue =>
      PushSettings.defaultAllDisabled();
}
