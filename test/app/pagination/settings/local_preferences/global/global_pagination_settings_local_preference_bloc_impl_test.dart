import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../pagination_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<PaginationSettings,
        GlobalPaginationSettingsLocalPreferenceBloc>(
      defaultValue: GlobalPaginationSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalPaginationSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          PaginationSettingsModelTestHelper.createTestPaginationSettings(
        seed: seed,
      ),
    );
  });
}
