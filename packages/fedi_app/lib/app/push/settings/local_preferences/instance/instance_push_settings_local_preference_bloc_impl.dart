import 'package:fedi_app/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/push/settings/local_preferences/push_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class InstancePushSettingsLocalPreferenceBloc
    extends PushSettingsLocalPreferenceBloc<PushSettings>
    implements IInstancePushSettingsLocalPreferenceBloc {
  InstancePushSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          '$userAtHost.push.subscription',
        );

  static final defaultValue = PushSettings.defaultAllDisabled();

  @override
  PushSettings get defaultPreferenceValue => defaultValue;
}
