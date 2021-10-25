import 'package:fedi_app/app/toast/settings/local_preferences/toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

abstract class ToastSettingsLocalPreferenceBloc<T extends ToastSettings?>
    extends ObjectLocalPreferenceBloc<T>
    implements IToastSettingsLocalPreferenceBloc<T> {
  ToastSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          // ignore: no-magic-number
          schemaVersion: 3,
          jsonConverter: (json) => ToastSettings.fromJson(json) as T,
        );
}
