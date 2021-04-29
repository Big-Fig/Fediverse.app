import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalizationSettingsLocalPreferenceBloc<
    T extends LocalizationSettings?> implements ILocalPreferenceBloc<T> {
  static ILocalizationSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILocalizationSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
