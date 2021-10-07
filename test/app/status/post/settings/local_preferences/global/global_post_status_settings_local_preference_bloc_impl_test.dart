import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../post_status_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<PostStatusSettings,
        GlobalPostStatusSettingsLocalPreferenceBloc>(
      defaultValue: GlobalPostStatusSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalPostStatusSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
        seed: seed,
      ),
    );
  });
}
