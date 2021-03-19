import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalLocalizationSettingsLocalPreferencesBloc
    implements ILocalizationSettingsLocalPreferencesBloc {
  static IGlobalLocalizationSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalLocalizationSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
