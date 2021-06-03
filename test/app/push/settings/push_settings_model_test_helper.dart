import 'package:fedi/app/push/settings/push_settings_model.dart';

// ignore_for_file: no-magic-number
class PushSettingsModelTestHelper {
  static PushSettings createTestPushSettings({
    required String seed,
  }) =>
      PushSettings(
        favourite: seed.hashCode % 2 == 0,
        follow: seed.hashCode % 3 == 1,
        mention: seed.hashCode % 4 == 0,
        reblog: seed.hashCode % 5 == 1,
        poll: seed.hashCode % 6 == 0,
        pleromaChatMention: seed.hashCode % 7 == 1,
        pleromaEmojiReaction: seed.hashCode % 8 == 0,
      );
}
