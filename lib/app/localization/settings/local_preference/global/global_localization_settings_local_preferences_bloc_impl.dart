import 'package:fedi/app/localization/settings/local_preference/global/global_localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalLocalizationSettingsLocalPreferencesBloc
    extends LocalizationSettingsLocalPreferencesBloc
    implements IGlobalLocalizationSettingsLocalPreferencesBloc {
  GlobalLocalizationSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "localization.settings.global");
}
