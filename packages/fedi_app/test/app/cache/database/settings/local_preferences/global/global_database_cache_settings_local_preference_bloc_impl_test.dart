// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi_app/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../database_cache_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<DatabaseCacheSettings,
        GlobalDatabaseCacheSettingsLocalPreferenceBloc>(
      defaultValue: GlobalDatabaseCacheSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalDatabaseCacheSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
        seed: seed,
      ),
    );
  });
}
