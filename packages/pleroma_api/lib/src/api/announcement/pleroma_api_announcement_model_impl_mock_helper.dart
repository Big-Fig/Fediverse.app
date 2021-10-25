import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../id/pleroma_api_id_mock_helper.dart';
import '../mention/pleroma_api_mention_model_impl_mock_helper.dart';
import '../status/pleroma_api_status_model_impl_mock_helper.dart';
import '../tag/pleroma_api_tag_model_impl_mock_helper.dart';
import 'emoji_reaction/pleroma_api_announcement_emoji_reaction_model_impl_mock_helper.dart';
import 'pleroma_api_announcement_model_impl.dart';

class PleromaApiAnnouncementMockHelper {
  static PleromaApiAnnouncement generate({
    required String seed,
  }) =>
      PleromaApiAnnouncement(
        id: PleromaApiIdMockHelper.generate(seed: seed),
        content: seed + 'content',
        allDay: BoolMockHelper.generate(seed: seed + 'allDay'),
        publishedAt: DateTimeMockHelper.generate(seed: seed + 'publishedAt'),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        read: BoolMockHelper.generate(seed: seed + 'read'),
        reactions: [
          PleromaApiAnnouncementEmojiReactionMockHelper.generate(
            seed: seed + 'react1',
          ),
          PleromaApiAnnouncementEmojiReactionMockHelper.generate(
            seed: seed + 'react2',
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
        statuses: [
          PleromaApiStatusMockHelper.generate(
            seed: seed + 'status1',
          ),
          PleromaApiStatusMockHelper.generate(
            seed: seed + 'status2',
          ),
        ],
        tags: [
          PleromaApiTagMockHelper.generate(seed: seed + 'tag1'),
          PleromaApiTagMockHelper.generate(seed: seed + 'tag2'),
        ],
        scheduledAt: DateTimeMockHelper.generate(seed: seed + 'scheduledAt'),
        startsAt: DateTimeMockHelper.generate(seed: seed + 'startsAt'),
        endsAt: DateTimeMockHelper.generate(seed: seed + 'endsAt'),
      );
}
