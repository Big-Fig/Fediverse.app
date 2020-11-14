import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class PushSubscriptionSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushSubscriptionSettingsLocalPreferences>
    implements IPushSubscriptionSettingsLocalPreferencesBloc {
  PushSubscriptionSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String userAtHost,
  ) : super(
          preferencesService,
          "$userAtHost.push.subscription",
          1,
          (json) => PushSubscriptionSettingsLocalPreferences.fromJson(json),
        );

  @override
  PushSubscriptionSettingsLocalPreferences get defaultValue =>
      PushSubscriptionSettingsLocalPreferences.defaultAllDisabled();
}
