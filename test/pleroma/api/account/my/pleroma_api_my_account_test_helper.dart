import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';

import '../../emoji/pleroma_api_emoji_test_helper.dart';
import '../../field/pleroma_api_field_test_helper.dart';
import '../../tag/pleroma_api_tag_test_helper.dart';
import '../pleroma_api_account_test_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class PleromaApiMyAccountTestHelper {
  static PleromaApiMyAccountPleromaPartNotificationsSettings
      createTestPleromaApiMyAccountPleromaPartNotificationsSettings({
    required String seed,
  }) =>
          PleromaApiMyAccountPleromaPartNotificationsSettings(
            followers: seed.hashCode % 2 == 1,
            follows: seed.hashCode % 2 == 0,
            nonFollowers: seed.hashCode % 2 == 1,
            nonFollows: seed.hashCode % 2 == 0,
            blockFromStrangers: seed.hashCode % 2 == 1,
            hideNotificationContents: seed.hashCode % 2 == 0,
          );

  static PleromaApiMyAccountSourcePleromaPart
      createTestPleromaApiMyAccountSourcePleromaPart({
    required String seed,
  }) =>
          PleromaApiMyAccountSourcePleromaPart(
            noRichText: seed.hashCode % 2 == 1,
            showRole: seed.hashCode % 2 == 0,
            discoverable: seed.hashCode % 2 == 1,
            actorType: seed + "actorType",
          );

  static PleromaApiMyAccountSource createTestPleromaApiMyAccountSource({
    required String seed,
  }) =>
      PleromaApiMyAccountSource(
        pleroma: createTestPleromaApiMyAccountSourcePleromaPart(
          seed: seed,
        ),
        followRequestsCount: seed.hashCode + 1,
        fields: [
          PleromaApiFieldTestHelper.createTestPleromaApiField(seed: seed + "1"),
          PleromaApiFieldTestHelper.createTestPleromaApiField(seed: seed + "2"),
        ],
        note: seed + "note",
        privacy: seed + "privacy",
        language: seed + "language",
        sensitive: seed.hashCode % 2 == 1,
      );

  static PleromaApiMyAccountPleromaPart
      createTestPleromaApiMyAccountPleromaPart({
    required String seed,
  }) =>
          PleromaApiMyAccountPleromaPart(
            backgroundImage: seed + "backgroundImage",
            tags: [
              PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + "1"),
              PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + "2"),
            ],
            relationship: PleromaApiAccountTestHelper
                .createTestPleromaApiAccountRelationship(
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
            favicon: seed + "favicon",
            apId: seed + "apId",
            alsoKnownAs: [
              seed + "known1",
              seed + "known2",
            ],
            chatToken: seed + "chatToken",
            unreadNotificationsCount: seed.hashCode + 11,
            unreadConversationCount: seed.hashCode + 12,
            notificationSettings:
                createTestPleromaApiMyAccountPleromaPartNotificationsSettings(
              seed: seed,
            ),
            settingsStore: {
              "seed": seed,
            },
          );

  static PleromaApiMyAccount createTestPleromaApiMyAccount({
    required String seed,
  }) =>
      PleromaApiMyAccount(
        username: seed + "username",
        url: seed + "url",
        statusesCount: seed.hashCode + 1,
        note: seed + "note",
        locked: seed.hashCode % 2 == 0,
        id: seed + "id",
        headerStatic: seed + "headerStatic",
        header: seed + "header",
        followingCount: seed.hashCode + 2,
        followersCount: seed.hashCode + 3,
        fields: [
          PleromaApiFieldTestHelper.createTestPleromaApiField(seed: seed + "1"),
          PleromaApiFieldTestHelper.createTestPleromaApiField(seed: seed + "2"),
        ],
        emojis: [
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(seed: seed + "1"),
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(seed: seed + "2"),
        ],
        displayName: seed + "displayName",
        createdAt: DateTime(seed.hashCode % 2000),
        bot: seed.hashCode % 2 == 1,
        avatarStatic: seed + "avatarStatic",
        avatar: seed + "avatar",
        acct: seed + 'acct',
        pleroma: createTestPleromaApiMyAccountPleromaPart(
          seed: seed,
        ),
        lastStatusAt: DateTime(seed.hashCode % 2000 + 1),
        fqn: seed + "fqn",
        followRequestsCount: seed.hashCode + 10,
        source: createTestPleromaApiMyAccountSource(
          seed: seed,
        ),
        discoverable: seed.hashCode % 2 == 0,
      );

  static PleromaApiMyAccountEditSource createTestPleromaApiMyAccountEditSource({
    required String seed,
  }) =>
      PleromaApiMyAccountEditSource(
        language: seed + "language",
        privacy: seed + "privacy",
        sensitive: seed.hashCode % 2 == 1,
      );

  static PleromaApiMyAccountEdit createTestPleromaApiMyAccountEdit({
    required String seed,
  }) =>
      PleromaApiMyAccountEdit(
        bot: seed.hashCode % 2 == 0,
        discoverable: seed.hashCode % 2 == 1,
        displayName: seed + "displayName",
        fieldsAttributes: {
          0: PleromaApiFieldTestHelper.createTestPleromaApiField(
            seed: seed + "1",
          ),
          1: PleromaApiFieldTestHelper.createTestPleromaApiField(
            seed: seed + "2",
          ),
        },
        locked: seed.hashCode % 2 == 0,
        note: seed + "note",
        source: createTestPleromaApiMyAccountEditSource(seed: seed + "source"),
        actorType: seed + "actorType",
        allowFollowingMove: seed.hashCode % 2 == 0,
        acceptsChatMessages: seed.hashCode % 2 == 1,
        defaultScope: seed + "defaultScope",
        hideFavorites: seed.hashCode % 2 == 0,
        hideFollowers: seed.hashCode % 2 == 1,
        hideFollowersCount: seed.hashCode % 2 == 0,
        hideFollows: seed.hashCode % 2 == 1,
        hideFollowsCount: seed.hashCode % 2 == 0,
        noRichText: seed.hashCode % 2 == 1,
        pleromaBackgroundImage: seed + "pleromaBackgroundImage",
        pleromaSettingsStore: {
          "seed1": seed + "1",
          "seed2": seed + "2",
        },
        showRole: seed.hashCode % 2 == 0,
        skipThreadContainment: seed.hashCode % 2 == 1,
        alsoKnownAs: [
          seed + "1",
          seed + "2",
        ],
      );
}
