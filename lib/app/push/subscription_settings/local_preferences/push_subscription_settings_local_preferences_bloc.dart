import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSubscriptionSettingsLocalPreferencesBloc
    implements LocalPreferenceBloc<PushSubscriptionSettingsLocalPreferences> {
  static IPushSubscriptionSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushSubscriptionSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
