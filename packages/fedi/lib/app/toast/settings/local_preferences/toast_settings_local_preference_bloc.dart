import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IToastSettingsLocalPreferenceBloc<T extends ToastSettings?>
    implements ILocalPreferenceBloc<T> {
  static IToastSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IToastSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
