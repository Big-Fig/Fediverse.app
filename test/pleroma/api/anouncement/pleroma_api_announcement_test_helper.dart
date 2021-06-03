// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';

import '../../../date_time/date_time_test_helper.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiAnnouncementTestHelper {
  static PleromaApiAnnouncement createTestPleromaApiAnnouncement({
    required String seed,
  }) =>
      PleromaApiAnnouncement(
        id: seed + "id",
        text: seed + "text",
        published: seed.hashCode % 2 == 0,
        allDay: seed.hashCode % 2 == 0,
        createdAt: DateTimeTestHelper.createTestDateTime(seed: seed + "1"),
        updatedAt: DateTimeTestHelper.createTestDateTime(seed: seed + "2"),
        read: seed.hashCode % 2 == 1,
        reactions: [
          createTestPleromaPleromaApiAnnouncementReaction(seed: seed + "1"),
          createTestPleromaPleromaApiAnnouncementReaction(seed: seed + "1"),
        ],
        scheduledAt: DateTimeTestHelper.createTestDateTime(seed: seed + "3"),
        startsAt: DateTimeTestHelper.createTestDateTime(seed: seed + "4"),
        endsAt: DateTimeTestHelper.createTestDateTime(seed: seed + "5"),
      );

  static PleromaApiAnnouncementReaction
      createTestPleromaPleromaApiAnnouncementReaction({
    required String seed,
  }) =>
          PleromaApiAnnouncementReaction(
            name: seed + "name",
            count: seed.hashCode,
            me: seed.hashCode % 2 == 0,
            url: seed + "url",
            staticUrl: seed + "staticUrl",
          );

}
