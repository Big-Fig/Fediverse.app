import 'package:fedi/app/localization/settings/local_preference/global/global_localization_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../localization_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<LocalizationSettings,
        LocalizationSettingsLocalPreferenceBloc>(
      defaultValue: GlobalLocalizationSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalLocalizationSettingsLocalPreferenceBloc(
              localPreferencesService),
      testObjectCreator: ({required String seed}) =>
          LocalizationSettingsModelTestHelper.createTestLocalizationSettings(
        seed: seed,
      ),
    );
  });
}
