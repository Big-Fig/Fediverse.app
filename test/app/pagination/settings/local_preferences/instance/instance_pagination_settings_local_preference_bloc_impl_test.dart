import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../pagination_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<PaginationSettings,
        InstancePaginationSettingsLocalPreferenceBloc>(
      defaultValue: InstancePaginationSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          InstancePaginationSettingsLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          PaginationSettingsModelTestHelper.createTestPaginationSettings(
        seed: seed,
      ),
    );
  });
}
