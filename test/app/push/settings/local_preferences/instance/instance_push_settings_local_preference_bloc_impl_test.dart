import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../push_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<PushSettings,
        PushSettingsLocalPreferenceBloc>(
      defaultValue: InstancePushSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          InstancePushSettingsLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          PushSettingsModelTestHelper.createTestPushSettings(
        seed: seed,
      ),
    );
  });
}
