import 'package:fedi_app/app/push/settings/relay/local_preferences/push_relay_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePushRelaySettingsLocalPreferenceBloc
    implements IPushRelaySettingsLocalPreferenceBloc<PushRelaySettings?> {
  static IPushRelaySettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushRelaySettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
