import 'package:fedi/app/push/settings/push_settings_model.dart';
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
