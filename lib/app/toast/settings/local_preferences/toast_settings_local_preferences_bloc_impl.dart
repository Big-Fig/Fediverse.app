import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class ToastSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<ToastSettings?>
    implements IToastSettingsLocalPreferencesBloc {
  ToastSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          // ignore: no-magic-number
          schemaVersion: 3,
          jsonConverter: (json) => ToastSettings.fromJson(json),
        );
}
