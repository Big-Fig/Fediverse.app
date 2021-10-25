import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import '../application/pleroma_api_application_model_impl_mock_helper.dart';
import '../card/pleroma_api_card_model_impl_mock_helper.dart';
import '../content/variants/pleroma_api_content_variants_model_impl_mock_helper.dart';
import '../emoji/pleroma_api_emoji_model_impl_mock_helper.dart';
import '../media/attachment/pleroma_api_media_attachment_model_impl_mock_helper.dart';
import '../mention/pleroma_api_mention_model_impl_mock_helper.dart';
import '../poll/pleroma_api_poll_model_impl_mock_helper.dart';
import '../tag/pleroma_api_tag_model_impl_mock_helper.dart';
import '../visibility/pleroma_api_visibility_sealed_mock_helper.dart';
import 'emoji_reaction/pleroma_api_status_emoji_reaction_model_impl_mock_helper.dart';
import 'pleroma_api_status_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

abstract class PleromaApiStatusMockHelper {
  // ignore: long-method
  static PleromaApiStatus generate({
    required String seed,
  }) =>
      PleromaApiStatus(
        id: seed + 'id',
        createdAt: DateTime(2000 + seed.hashCode % 3),
        inReplyToId: seed + 'inReplyToId',
        inReplyToAccountId: seed + 'inReplyToAccountId',
        sensitive: seed.hashCode % 2 == 1,
        spoilerText: seed + 'spoilerText',
        uri: seed + 'uri',
        url: seed + 'url',
        repliesCount: seed.hashCode % 3,
        reblogsCount: seed.hashCode % 3 + 1,
        favouritesCount: seed.hashCode % 3 + 2,
        favourited: seed.hashCode % 2 == 1,
        reblogged: seed.hashCode % 2 == 1,
        muted: seed.hashCode % 2 == 0,
        bookmarked: seed.hashCode % 2 == 1,
        pinned: seed.hashCode % 2 == 0,
        content: seed + 'content',
        reblog: seed.contains('reblog')
            ? null
            : PleromaApiStatusMockHelper.generate(
                seed: seed + 'reblog',
              ),
        application: PleromaApiApplicationMockHelper.generate(
          seed: seed,
        ),
        account: PleromaApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        mediaAttachments: [
          PleromaApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        mentions: [
          PleromaApiMentionMockHelper.generate(
            seed: seed + 'mention1',
          ),
          PleromaApiMentionMockHelper.generate(
            seed: seed + 'mention2',
          ),
        ],
        tags: [
          PleromaApiTagMockHelper.generate(seed: seed + 'tag1'),
          PleromaApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        emojis: [
          PleromaApiEmojiMockHelper.generate(
            seed: seed + 'emoji1',
          ),
          PleromaApiEmojiMockHelper.generate(
            seed: seed + 'emoji2',
          ),
        ],
        poll: PleromaApiPollMockHelper.generate(seed: seed),
        card: PleromaApiCardMockHelper.generate(seed: seed),
        pleroma: PleromaApiStatusPleromaPartMockHelper.generate(seed: seed),
        visibility: PleromaApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        language: seed + 'language',
      );
}

abstract class PleromaApiStatusPleromaPartMockHelper {
  static PleromaApiStatusPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiStatusPleromaPart(
        content: PleromaApiContentVariantsMockHelper.generate(
          seed: seed + 'content',
        ),
        conversationId: seed.hashCode % 10,
        directConversationId: seed.hashCode % 5,
        inReplyToAccountAcct: seed + 'inReplyToAccountAcct',
        local: seed.hashCode % 2 == 0,
        spoilerText: PleromaApiContentVariantsMockHelper.generate(
          seed: seed + 'spoilerText',
        ),
        expiresAt: DateTime(2000 + seed.hashCode % 10),
        threadMuted: seed.hashCode % 2 == 1,
        emojiReactions: [
          PleromaApiStatusEmojiReactionMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiStatusEmojiReactionMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
