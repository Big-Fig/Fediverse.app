import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalLocalizationSettingsLocalPreferenceBloc
    implements ILocalizationSettingsLocalPreferenceBloc<LocalizationSettings> {
  static IGlobalLocalizationSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalLocalizationSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
