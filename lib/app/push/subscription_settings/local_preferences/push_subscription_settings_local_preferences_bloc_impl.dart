import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class PushSubscriptionSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushSubscriptionSettingsLocalPreferences>
    implements IPushSubscriptionSettingsLocalPreferencesBloc {
  PushSubscriptionSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService, String userAtHost)
      : super(preferencesService, "$userAtHost.push.subscription", 1);

  @override
  PushSubscriptionSettingsLocalPreferences get defaultValue =>
      PushSubscriptionSettingsLocalPreferences.defaultAllEnabled();
}
