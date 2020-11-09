import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalizationCurrentLocaleLocalPreferencesBloc
    extends ILocalPreferenceBloc<LocalizationLocale> {
  static ILocalizationCurrentLocaleLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ILocalizationCurrentLocaleLocalPreferencesBloc>(context,
          listen: listen);
}
