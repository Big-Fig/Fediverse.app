import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../chat_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<ChatSettings,
        GlobalChatSettingsLocalPreferenceBloc>(
      defaultValue: GlobalChatSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalChatSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          ChatSettingsModelTestHelper.createTestChatSettings(
        seed: seed,
      ),
    );
  });
}
