import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../emoji/unifedi_api_emoji_model_impl_mock_helper.dart';
import '../../field/unifedi_api_field_model_impl_mock_helper.dart';
import '../../tag/unifedi_api_tag_model_impl_mock_helper.dart';
import '../relationship/unifedi_api_account_relationship_model_impl_mock_helper.dart';
import 'notifications_settings/unifedi_api_my_account_notifications_settings_model_impl_mock_helper.dart';
import 'unifedi_api_my_account_model_impl.dart';
// ignore_for_file: no-magic-number, no-equal-arguments

class UnifediApiMyAccountMockHelper {
  // ignore: long-method
  static UnifediApiMyAccount generate({
    required String seed,
  }) =>
      UnifediApiMyAccount(
        username: seed + 'username',
        url: seed + 'url',
        statusesCount: seed.hashCode + 1,
        note: seed + 'note',
        locked: seed.hashCode % 2 == 0,
        id: seed + 'id',
        headerStatic: seed + 'headerStatic',
        header: seed + 'header',
        followingCount: seed.hashCode + 2,
        followersCount: seed.hashCode + 3,
        fields: [
          UnifediApiFieldMockHelper.generate(seed: seed + '1'),
          UnifediApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          UnifediApiEmojiMockHelper.generate(seed: seed + '1'),
          UnifediApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTime(seed.hashCode % 2000),
        bot: seed.hashCode % 2 == 1,
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        lastStatusAt: DateTime(seed.hashCode % 2000 + 1),
        fqn: seed + 'fqn',
        followRequestsCount: seed.hashCode + 10,
        discoverable: seed.hashCode % 2 == 0,
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
        backgroundImage: seed + 'backgroundImage',
        tags: [
          UnifediApiTagMockHelper.generate(seed: seed + '1'),
          UnifediApiTagMockHelper.generate(seed: seed + '2'),
        ],
        relationship: UnifediApiAccountRelationshipMockHelper.generate(
          seed: seed,
        ),
        isAdmin: seed.hashCode % 2 == 1,
        isModerator: seed.hashCode % 2 == 0,
        confirmationPending: seed.hashCode % 2 == 1,
        hideFavorites: seed.hashCode % 2 == 0,
        hideFollowers: seed.hashCode % 2 == 1,
        hideFollows: seed.hashCode % 2 == 0,
        hideFollowersCount: seed.hashCode % 2 == 1,
        hideFollowsCount: seed.hashCode % 2 == 0,
        deactivated: seed.hashCode % 2 == 1,
        allowFollowingMove: seed.hashCode % 2 == 0,
        skipThreadContainment: seed.hashCode % 2 == 1,
        acceptsChatMessages: seed.hashCode % 2 == 0,
        isConfirmed: seed.hashCode % 2 == 1,
        favicon: seed + 'favicon',
        apId: seed + 'apId',
        alsoKnownAs: [
          seed + 'known1',
          seed + 'known2',
        ],
        chatToken: seed + 'chatToken',
        unreadNotificationsCount: seed.hashCode + 11,
        unreadConversationCount: seed.hashCode + 12,
        notificationSettings:
            UnifediApiMyAccountNotificationsSettingsMockHelper.generate(
          seed: seed,
        ),
        settingsStore: <String, dynamic>{
          'seed': seed,
        },
        actorType: seed + 'actorType',
        noRichText: seed.hashCode % 2 == 1,
        language: seed + 'language',
        privacy: seed + 'privacy',
        showRole: seed.hashCode % 2 == 0,
        sensitive: seed.hashCode % 2 == 1,
      );
}
