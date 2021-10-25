import 'package:fedi_app/app/toast/settings/local_preferences/toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalToastSettingsLocalPreferenceBloc
    implements IToastSettingsLocalPreferenceBloc<ToastSettings> {
  static IGlobalToastSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalToastSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
