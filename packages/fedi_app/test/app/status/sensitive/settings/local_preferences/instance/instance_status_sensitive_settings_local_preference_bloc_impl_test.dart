// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../status_sensitive_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<StatusSensitiveSettings,
        InstanceStatusSensitiveSettingsLocalPreferenceBloc>(
      defaultValue:
          InstanceStatusSensitiveSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          InstanceStatusSensitiveSettingsLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          StatusSensitiveSettingsModelMockHelper
              .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });
}
