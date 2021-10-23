import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

typedef LocalPreferencesBlocCreator = ILocalPreferenceBloc Function(
  ILocalPreferencesService localPreferencesService,
);

abstract class ILocalPreferencesServiceMigrationBloc {
  Future<List<LocalPreferencesBlocCreator>>
      calculateAllMigrationLocalPreferencesBlocCreators(
    ILocalPreferencesService inputService,
  );

  Future<void> migrateData();
}
