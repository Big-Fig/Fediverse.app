// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';

import '../../../date_time/date_time_test_helper.dart';
import '../mention/pleroma_api_mention_test_helper.dart';
import '../status/pleroma_api_status_test_helper.dart';
import '../tag/pleroma_api_tag_test_helper.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiAnnouncementTestHelper {
  static PleromaApiAnnouncement createTestPleromaApiAnnouncement({
    required String seed,
  }) =>
      PleromaApiAnnouncement(
        id: seed + 'id',
        content: seed + 'content',
        allDay: seed.hashCode % 2 == 0,
        publishedAt: DateTimeTestHelper.createTestDateTime(seed: seed + '1'),
        updatedAt: DateTimeTestHelper.createTestDateTime(seed: seed + '2'),
        read: seed.hashCode % 2 == 1,
        reactions: [
          createTestPleromaPleromaApiAnnouncementReaction(seed: seed + '1'),
          createTestPleromaPleromaApiAnnouncementReaction(seed: seed + '1'),
        ],
        tags: [
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + '1'),
          PleromaApiTagTestHelper.createTestPleromaApiTag(seed: seed + '2'),
        ],
        statuses: [
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + '1',
          ),
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + '2',
          ),
        ],
        mentions: [
          PleromaApiMentionTestHelper.createTestPleromaApiMention(
            seed: seed + '1',
          ),
          PleromaApiMentionTestHelper.createTestPleromaApiMention(
            seed: seed + '2',
          ),
        ],
        scheduledAt: DateTimeTestHelper.createTestDateTime(seed: seed + '3'),
        startsAt: DateTimeTestHelper.createTestDateTime(seed: seed + '4'),
        endsAt: DateTimeTestHelper.createTestDateTime(seed: seed + '5'),
      );

  static PleromaApiAnnouncementReaction
      createTestPleromaPleromaApiAnnouncementReaction({
    required String seed,
  }) =>
          PleromaApiAnnouncementReaction(
            name: seed + 'name',
            count: seed.hashCode,
            me: seed.hashCode % 2 == 0,
            url: seed + 'url',
            staticUrl: seed + 'staticUrl',
          );
}
