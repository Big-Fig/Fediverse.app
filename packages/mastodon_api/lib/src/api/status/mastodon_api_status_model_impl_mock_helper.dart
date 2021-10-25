import '../account/mastodon_api_account_model_impl_mock_helper.dart';
import '../application/mastodon_api_application_model_impl_mock_helper.dart';
import '../card/mastodon_api_card_model_impl_mock_helper.dart';
import '../emoji/mastodon_api_emoji_model_impl_mock_helper.dart';
import '../media/attachment/mastodon_api_media_attachment_model_impl_mock_helper.dart';
import '../mention/mastodon_api_mention_model_impl_mock_helper.dart';
import '../poll/mastodon_api_poll_model_impl_mock_helper.dart';
import '../tag/mastodon_api_tag_model_impl_mock_helper.dart';
import '../visibility/mastodon_api_visibility_sealed_mock_helper.dart';
import 'mastodon_api_status_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

abstract class MastodonApiStatusMockHelper {
  // ignore: long-method
  static MastodonApiStatus generate({
    required String seed,
  }) =>
      MastodonApiStatus(
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
            : MastodonApiStatusMockHelper.generate(
                seed: seed + 'reblog',
              ),
        application: MastodonApiApplicationMockHelper.generate(
          seed: seed,
        ),
        account: MastodonApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        mediaAttachments: [
          MastodonApiMediaAttachmentMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiMediaAttachmentMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        mentions: [
          MastodonApiMentionMockHelper.generate(
            seed: seed + 'mention1',
          ),
          MastodonApiMentionMockHelper.generate(
            seed: seed + 'mention2',
          ),
        ],
        tags: [
          MastodonApiTagMockHelper.generate(seed: seed + 'tag1'),
          MastodonApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        emojis: [
          MastodonApiEmojiMockHelper.generate(
            seed: seed + 'emoji1',
          ),
          MastodonApiEmojiMockHelper.generate(
            seed: seed + 'emoji2',
          ),
        ],
        poll: MastodonApiPollMockHelper.generate(seed: seed),
        card: MastodonApiCardMockHelper.generate(seed: seed),
        visibility: MastodonApiVisibilityMockHelper.generate(
          seed: seed,
        ).stringValue,
        language: seed + 'language',
      );
}
