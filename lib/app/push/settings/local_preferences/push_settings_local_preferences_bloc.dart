import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSettingsLocalPreferencesBloc
    implements LocalPreferenceBloc<PushSettingsLocalPreferences> {
  static IPushSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
