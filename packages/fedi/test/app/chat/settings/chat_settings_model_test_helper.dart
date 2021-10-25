// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:fedi/app/chat/settings/chat_settings_model.dart';

// ignore_for_file: no-magic-number
class ChatSettingsModelMockHelper {
  static ChatSettings createTestChatSettings({
    required String seed,
  }) =>
      // hack to be sure that seed1 and seed2 wil produce different objects
      ChatSettings(
        replaceConversationsWithUnifediChats: seed == 'seed1'
            ? true
            : seed == 'seed2'
                ? false
                : seed.hashCode % 2 == 0,
        countConversationsInChatsUnreadBadges: seed == 'seed1'
            ? true
            : seed == 'seed2'
                ? false
                : seed.hashCode % 2 == 1,
      );
}
