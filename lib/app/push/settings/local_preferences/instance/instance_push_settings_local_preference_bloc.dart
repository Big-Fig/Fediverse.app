import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePushSettingsLocalPreferenceBloc
    implements IPushSettingsLocalPreferenceBloc<PushSettings> {
  static IPushSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushSettingsLocalPreferenceBloc>(context, listen: listen);
}
