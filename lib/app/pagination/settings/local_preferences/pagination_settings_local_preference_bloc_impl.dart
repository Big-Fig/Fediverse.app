import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class PaginationSettingsLocalPreferenceBloc<
        T extends PaginationSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IPaginationSettingsLocalPreferenceBloc<T> {
  PaginationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => PaginationSettings.fromJson(json) as T,
        );
}
