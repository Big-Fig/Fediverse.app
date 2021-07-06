import 'package:fedi/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushRelaySettingsLocalPreferenceBloc<
    T extends PushRelaySettings?> implements LocalPreferenceBloc<T> {
  static IPushRelaySettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushRelaySettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
