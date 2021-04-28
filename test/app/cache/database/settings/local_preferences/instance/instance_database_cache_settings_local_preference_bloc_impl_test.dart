import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preferences_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../database_cache_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<DatabaseCacheSettings,
        InstanceDatabaseCacheSettingsLocalPreferencesBloc>(
      defaultValue:
          InstanceDatabaseCacheSettingsLocalPreferencesBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          InstanceDatabaseCacheSettingsLocalPreferencesBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          DatabaseCacheSettingsModelTestHelper.createTestDatabaseCacheSettings(
        seed: seed,
      ),
    );
  });
}
