import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalizationSettingsBloc implements IDisposable {
  static ILocalizationSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ILocalizationSettingsBloc>(context, listen: listen);

  LocalizationLocale get localizationLocale;

  Stream<LocalizationLocale> get localizationLocaleStream;

  void changeLocalizationLocale(LocalizationLocale value);
}
