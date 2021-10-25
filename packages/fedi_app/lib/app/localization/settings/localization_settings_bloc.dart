import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
import 'package:fedi_app/app/settings/global/global_settings_bloc.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalizationSettingsBloc
    implements IGlobalSettingsBloc<LocalizationSettings> {
  static ILocalizationSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILocalizationSettingsBloc>(context, listen: listen);

  LocalizationLocale? get localizationLocale;

  Stream<LocalizationLocale?> get localizationLocaleStream;

  Future<void> changeLocalizationLocale(LocalizationLocale? value);
}
