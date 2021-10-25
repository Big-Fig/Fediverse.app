import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../emoji/reaction/unifedi_api_emoji_reaction_model_impl_mock_helper.dart';
import '../mention/unifedi_api_mention_model_impl_mock_helper.dart';
import '../status/unifedi_api_status_model_impl_mock_helper.dart';
import '../tag/unifedi_api_tag_model_impl_mock_helper.dart';
import 'unifedi_api_announcement_model_impl.dart';

class UnifediApiAnnouncementMockHelper {
  static UnifediApiAnnouncement generate({
    required String seed,
  }) =>
      UnifediApiAnnouncement(
        id: seed + 'id',
        content: seed + 'content',
        allDay: BoolMockHelper.generate(seed: seed + 'allDay'),
        publishedAt: DateTimeMockHelper.generate(seed: seed + 'publishedAt'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        read: BoolMockHelper.generate(seed: seed + 'read'),
        reactions: [
          UnifediApiEmojiReactionMockHelper.generate(
            seed: seed + 'react1',
          ),
          UnifediApiEmojiReactionMockHelper.generate(
            seed: seed + 'react2',
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
        statuses: [
          UnifediApiStatusMockHelper.generate(
            seed: seed + 'status1',
          ),
          UnifediApiStatusMockHelper.generate(
            seed: seed + 'status2',
          ),
        ],
        tags: [
          UnifediApiTagMockHelper.generate(seed: seed + 'tag1'),
          UnifediApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        scheduledAt: DateTimeMockHelper.generate(seed: seed + 'scheduledAt'),
        startsAt: DateTimeMockHelper.generate(seed: seed + 'startsAt'),
        endsAt: DateTimeMockHelper.generate(seed: seed + 'endsAt'),
      );
}
