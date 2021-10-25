import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../id/mastodon_api_id_mock_helper.dart';
import '../mention/mastodon_api_mention_model_impl_mock_helper.dart';
import '../status/mastodon_api_status_model_impl_mock_helper.dart';
import '../tag/mastodon_api_tag_model_impl_mock_helper.dart';
import 'emoji_reaction/mastodon_api_announcement_emoji_reaction_model_impl_mock_helper.dart';
import 'mastodon_api_announcement_model_impl.dart';

class MastodonApiAnnouncementMockHelper {
  static MastodonApiAnnouncement generate({
    required String seed,
  }) =>
      MastodonApiAnnouncement(
        id: MastodonApiIdMockHelper.generate(seed: seed),
        content: seed + 'content',
        allDay: BoolMockHelper.generate(seed: seed + 'allDay'),
        publishedAt: DateTimeMockHelper.generate(seed: seed + 'publishedAt'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        read: BoolMockHelper.generate(seed: seed + 'read'),
        reactions: [
          MastodonApiAnnouncementEmojiReactionMockHelper.generate(
            seed: seed + 'react1',
          ),
          MastodonApiAnnouncementEmojiReactionMockHelper.generate(
            seed: seed + 'react2',
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
        statuses: [
          MastodonApiStatusMockHelper.generate(
            seed: seed + 'status1',
          ),
          MastodonApiStatusMockHelper.generate(
            seed: seed + 'status2',
          ),
        ],
        tags: [
          MastodonApiTagMockHelper.generate(seed: seed + 'tag1'),
          MastodonApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        scheduledAt: DateTimeMockHelper.generate(seed: seed + 'scheduledAt'),
        startsAt: DateTimeMockHelper.generate(seed: seed + 'startsAt'),
        endsAt: DateTimeMockHelper.generate(seed: seed + 'endsAt'),
      );
}
