import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSettingsLocalPreferenceBloc<T extends PushSettings?>
    implements LocalPreferenceBloc<T> {
  static IPushSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushSettingsLocalPreferenceBloc>(context, listen: listen);
}
