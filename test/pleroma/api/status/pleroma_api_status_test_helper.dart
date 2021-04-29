import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';

import '../account/pleroma_api_account_test_helper.dart';
import '../application/pleroma_api_application_test_helper.dart';
import '../card/pleroma_api_card_test_helper.dart';
import '../emoji/pleroma_api_emoji_test_helper.dart';
import '../media/pleroma_api_media_test_helper.dart';
import '../mention/pleroma_api_mention_test_helper.dart';
import '../poll/pleroma_api_poll_test_helper.dart';
import '../tag/pleroma_api_tag_test_helper.dart';
import '../visibility/pleroma_api_visibility_test_helper.dart';

// ignore_for_file: no-magic-number
class PleromaApiStatusTestHelper {
  static PleromaApiStatusEmojiReaction createTestPleromaApiStatusEmojiReaction({
    required String seed,
  }) =>
      PleromaApiStatusEmojiReaction(
        name: seed + "name",
        count: seed.hashCode % 5,
        me: seed.hashCode % 2 == 0,
        accounts: [
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + "1",
          ),
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + "2",
          ),
        ],
      );

  static PleromaApiContent createTestPleromaApiContent({
    required String seed,
  }) =>
      PleromaApiContent(textPlain: seed + "textPlain");

  static PleromaApiStatusPleromaPart createTestPleromaApiStatusPleromaPart({
    required String seed,
  }) =>
      PleromaApiStatusPleromaPart(
        content: createTestPleromaApiContent(seed: seed + "content"),
        conversationId: seed.hashCode % 10,
        directConversationId: seed.hashCode % 5,
        inReplyToAccountAcct: seed + "inReplyToAccountAcct",
        local: seed.hashCode % 2 == 0,
        spoilerText: createTestPleromaApiContent(seed: seed + "spoilerText"),
        expiresAt: DateTime(2000 + seed.hashCode % 10),
        threadMuted: seed.hashCode % 2 == 1,
        emojiReactions: [
          createTestPleromaApiStatusEmojiReaction(seed: seed + "1"),
          createTestPleromaApiStatusEmojiReaction(seed: seed + "2"),
        ],
      );

  static PleromaApiStatus createTestPleromaApiStatus({
    required String seed,
  }) =>
      PleromaApiStatus(
        id: seed + "id",
        createdAt: DateTime(2000 + seed.hashCode % 3),
        inReplyToId: seed + "inReplyToId",
        inReplyToAccountId: seed + "inReplyToAccountId",
        sensitive: seed.hashCode % 2 == 1,
        spoilerText: seed + "spoilerText",
        uri: seed + "uri",
        url: seed + "url",
        repliesCount: seed.hashCode % 3,
        reblogsCount: seed.hashCode % 3 + 1,
        favouritesCount: seed.hashCode % 3 + 2,
        favourited: seed.hashCode % 2 == 1,
        reblogged: seed.hashCode % 2 == 1,
        muted: seed.hashCode % 2 == 0,
        bookmarked: seed.hashCode % 2 == 1,
        pinned: seed.hashCode % 2 == 0,
        content: seed + "content",
        reblog: seed.contains("reblog")
            ? null
            : createTestPleromaApiStatus(seed: seed + "reblog"),
        application:
            PleromaApiApplicationTestHelper.createTestPleromaApiApplication(
          seed: seed,
        ),
        account: PleromaApiAccountTestHelper.createTestPleromaApiAccount(
          seed: seed + "account",
        ),
        mediaAttachments: [
          PleromaApiMediaTestHelper.createTestPleromaMediaAttachment(
            seed: seed + "1",
          ),
          PleromaApiMediaTestHelper.createTestPleromaMediaAttachment(
            seed: seed + "2",
          ),
        ],
        mentions: [
          PleromaApiMentionTestHelper.createTestPleromaMention(
            seed: seed + "mention1",
          ),
          PleromaApiMentionTestHelper.createTestPleromaMention(
            seed: seed + "mention2",
          ),
        ],
        tags: [
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + "tag1"),
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + "tag2"),
        ],
        emojis: [
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(
              seed: seed + "emoji1"),
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(
              seed: seed + "emoji2"),
        ],
        poll: PleromaApiPollTestHelper.createTestPleromaPoll(seed: seed),
        card: PleromaApiCardTestHelper.createTestPleromaCard(seed: seed),
        pleroma: createTestPleromaApiStatusPleromaPart(seed: seed),
        visibility:
            PleromaApiVisibilityTestHelper.createTestPleromaApiVisibility(
          seed: seed,
        ).toJsonValue(),
        language: seed + "language",
      );
}
