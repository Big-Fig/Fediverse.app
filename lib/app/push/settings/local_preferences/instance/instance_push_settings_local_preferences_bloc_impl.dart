import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstancePushSettingsLocalPreferencesBloc
    extends PushSettingsLocalPreferencesBloc<PushSettings>
    implements IInstancePushSettingsLocalPreferencesBloc {
  InstancePushSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "$userAtHost.push.subscription",
        );

  static final defaultValue = PushSettings.defaultAllDisabled();

  @override
  PushSettings get defaultPreferenceValue => defaultValue;
}
