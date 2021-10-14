// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../toast_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<ToastSettings,
        GlobalToastSettingsLocalPreferenceBloc>(
      defaultValue: GlobalToastSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalToastSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          ToastSettingsModelMockHelper.createTestToastSettings(
        seed: seed,
      ),
    );
  });
}
