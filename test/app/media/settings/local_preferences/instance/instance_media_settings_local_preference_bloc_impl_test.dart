// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../media_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<MediaSettings,
        InstanceMediaSettingsLocalPreferenceBloc>(
      defaultValue: InstanceMediaSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          InstanceMediaSettingsLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          MediaSettingsModelMockHelper.createTestMediaSettings(
        seed: seed,
      ),
    );
  });
}
