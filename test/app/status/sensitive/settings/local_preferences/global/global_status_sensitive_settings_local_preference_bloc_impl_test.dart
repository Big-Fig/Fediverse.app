// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../status_sensitive_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<StatusSensitiveSettings,
        GlobalStatusSensitiveSettingsLocalPreferenceBloc>(
      defaultValue:
          GlobalStatusSensitiveSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalStatusSensitiveSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          StatusSensitiveSettingsModelMockHelper
              .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });
}
