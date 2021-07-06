import 'package:fedi/app/push/settings/relay/local_preferences/instance/instance_push_relay_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/relay/local_preferences/push_relay_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstancePushRelaySettingsLocalPreferenceBloc
    extends PushRelaySettingsLocalPreferenceBloc<PushRelaySettings?>
    implements IInstancePushRelaySettingsLocalPreferenceBloc {
  InstancePushRelaySettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          '$userAtHost.push.relay',
        );

  static const PushRelaySettings? defaultValue = null;

  @override
  PushRelaySettings? get defaultPreferenceValue => defaultValue;
}
