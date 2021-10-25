import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
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
