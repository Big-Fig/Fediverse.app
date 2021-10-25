// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../chat_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<ChatSettings,
        GlobalChatSettingsLocalPreferenceBloc>(
      defaultValue: GlobalChatSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalChatSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          ChatSettingsModelMockHelper.createTestChatSettings(
        seed: seed,
      ),
    );
  });
}
