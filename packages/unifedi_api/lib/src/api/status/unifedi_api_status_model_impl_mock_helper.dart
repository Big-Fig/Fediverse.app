import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import '../application/unifedi_api_application_model_impl_mock_helper.dart';
import '../card/unifedi_api_card_model_impl_mock_helper.dart';
import '../content/variants/unifedi_api_content_variants_model_impl_mock_helper.dart';
import '../emoji/reaction/unifedi_api_emoji_reaction_model_impl_mock_helper.dart';
import '../emoji/unifedi_api_emoji_model_impl_mock_helper.dart';
import '../media/attachment/unifedi_api_media_attachment_model_impl_mock_helper.dart';
import '../mention/unifedi_api_mention_model_impl_mock_helper.dart';
import '../poll/unifedi_api_poll_model_impl_mock_helper.dart';
import '../tag/unifedi_api_tag_model_impl_mock_helper.dart';
import '../visibility/unifedi_api_visibility_sealed_mock_helper.dart';
import 'unifedi_api_status_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

abstract class UnifediApiStatusMockHelper {
  // ignore: long-method
  static UnifediApiStatus generate({
    required String seed,
  }) =>
      UnifediApiStatus(
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
            : UnifediApiStatusMockHelper.generate(
                seed: seed + 'reblog',
              ),
        application: UnifediApiApplicationMockHelper.generate(
          seed: seed,
        ),
        account: UnifediApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        mediaAttachments: [
          UnifediApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        mentions: [
          UnifediApiMentionMockHelper.generate(
            seed: seed + 'mention1',
          ),
          UnifediApiMentionMockHelper.generate(
            seed: seed + 'mention2',
          ),
        ],
        tags: [
          UnifediApiTagMockHelper.generate(seed: seed + 'tag1'),
          UnifediApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        emojis: [
          UnifediApiEmojiMockHelper.generate(
            seed: seed + 'emoji1',
          ),
          UnifediApiEmojiMockHelper.generate(
            seed: seed + 'emoji2',
          ),
        ],
        poll: UnifediApiPollMockHelper.generate(seed: seed),
        card: UnifediApiCardMockHelper.generate(seed: seed),
        visibility: UnifediApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        language: seed + 'language',
        contentVariants: UnifediApiContentVariantsMockHelper.generate(
          seed: seed + 'content',
        ),
        conversationId: seed.hashCode % 10,
        directConversationId: seed.hashCode % 5,
        inReplyToAccountAcct: seed + 'inReplyToAccountAcct',
        local: seed.hashCode % 2 == 0,
        spoilerTextVariants: UnifediApiContentVariantsMockHelper.generate(
          seed: seed + 'spoilerText',
        ),
        expiresAt: DateTime(2000 + seed.hashCode % 10),
        threadMuted: seed.hashCode % 2 == 1,
        emojiReactions: [
          UnifediApiEmojiReactionMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiEmojiReactionMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
