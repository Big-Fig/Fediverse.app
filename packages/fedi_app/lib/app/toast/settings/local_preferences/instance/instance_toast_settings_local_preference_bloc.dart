import 'package:fedi_app/app/toast/settings/local_preferences/toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceToastSettingsLocalPreferenceBloc
    implements IToastSettingsLocalPreferenceBloc<ToastSettings?> {
  static IInstanceToastSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceToastSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
