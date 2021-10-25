import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../emoji/pleroma_api_emoji_model_impl_mock_helper.dart';
import '../../field/pleroma_api_field_model_impl_mock_helper.dart';
import '../../tag/pleroma_api_tag_model_impl_mock_helper.dart';
import '../relationship/pleroma_api_account_relationship_model_impl_mock_helper.dart';
import 'notifications_settings/pleroma_api_my_account_notifications_settings_model_impl_mock_helper.dart';
import 'pleroma_api_my_account_model_impl.dart';
import 'source/pleroma_api_my_account_source_model_impl_mock_helper.dart';
// ignore_for_file: no-magic-number, no-equal-arguments

class PleromaApiMyAccountPleromaPartMockHelper {
  static PleromaApiMyAccountPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiMyAccountPleromaPart(
        backgroundImage: seed + 'backgroundImage',
        tags: [
          PleromaApiTagMockHelper.generate(seed: seed + '1'),
          PleromaApiTagMockHelper.generate(seed: seed + '2'),
        ],
        relationship: PleromaApiAccountRelationshipMockHelper.generate(
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
            PleromaApiMyAccountNotificationsSettingsMockHelper.generate(
          seed: seed,
        ),
        settingsStore: <String, dynamic>{
          'seed': seed,
        },
      );
}

class PleromaApiMyAccountMockHelper {
  static PleromaApiMyAccount generate({
    required String seed,
  }) =>
      PleromaApiMyAccount(
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
          PleromaApiFieldMockHelper.generate(seed: seed + '1'),
          PleromaApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        emojis: [
          PleromaApiEmojiMockHelper.generate(seed: seed + '1'),
          PleromaApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        displayName: seed + 'displayName',
        createdAt: DateTime(seed.hashCode % 2000),
        bot: seed.hashCode % 2 == 1,
        avatarStatic: seed + 'avatarStatic',
        avatar: seed + 'avatar',
        acct: seed + 'acct',
        pleroma: PleromaApiMyAccountPleromaPartMockHelper.generate(
          seed: seed,
        ),
        lastStatusAt: DateTime(seed.hashCode % 2000 + 1),
        fqn: seed + 'fqn',
        followRequestsCount: seed.hashCode + 10,
        source: PleromaApiMyAccountSourceMockHelper.generate(
          seed: seed,
        ),
        discoverable: seed.hashCode % 2 == 0,
        suspended: BoolMockHelper.generate(seed: seed + 'suspended'),
        muteExpiresAt:
            DateTimeMockHelper.generate(seed: seed + 'muteExpiresAt'),
      );
}
