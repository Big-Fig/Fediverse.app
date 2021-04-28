import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../media_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<MediaSettings,
        GlobalMediaSettingsLocalPreferencesBloc>(
      defaultValue: GlobalMediaSettingsLocalPreferencesBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalMediaSettingsLocalPreferencesBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          MediaSettingsModelTestHelper.createTestMediaSettings(
        seed: seed,
      ),
    );
  });
}
