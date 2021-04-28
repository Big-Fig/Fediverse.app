import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePushSettingsLocalPreferencesBloc
    implements IPushSettingsLocalPreferencesBloc<PushSettings> {
  static IPushSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushSettingsLocalPreferencesBloc>(context, listen: listen);
}
