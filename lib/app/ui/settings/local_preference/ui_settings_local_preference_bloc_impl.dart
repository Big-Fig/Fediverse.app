import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class UiSettingsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UiSettings>
    implements IUiSettingsLocalPreferenceBloc {
  UiSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => UiSettings.fromJson(json),
        );
}
