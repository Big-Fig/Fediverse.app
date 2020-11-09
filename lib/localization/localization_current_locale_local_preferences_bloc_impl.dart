import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/localization/localization_current_locale_local_preferences_bloc.dart';
import 'package:fedi/localization/localization_model.dart';

class LocalizationCurrentLocaleLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<LocalizationLocale>
    implements ILocalizationCurrentLocaleLocalPreferencesBloc {
  LocalizationCurrentLocaleLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(
          preferencesService,
          "locale.current",
          1,
          (json) => LocalizationLocale.fromJson(json),
        );
}
