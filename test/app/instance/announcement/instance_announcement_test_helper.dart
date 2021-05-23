import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/instance_announcement_database_test_helper.dart';

class InstanceAnnouncementTestHelper {
  static Future<DbInstanceAnnouncementPopulatedWrapper>
      createTestInstanceAnnouncement({
    required String seed,
    String? remoteId,
  }) async {
    return DbInstanceAnnouncementPopulatedWrapper(
      dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
        dbInstanceAnnouncement: InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: seed,
          remoteId: remoteId,
        ),
      ),
    );
  }

  static void expectInstanceAnnouncement(
    IInstanceAnnouncement? actual,
    IInstanceAnnouncement? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);

    expect(actual.content, expected.content);
    expect(actual.allDay, expected.allDay);
    expect(actual.publishedAt, expected.publishedAt);
    expect(actual.updatedAt, expected.updatedAt);
    expect(actual.read, expected.read);
    expect(listEquals(actual.reactions, expected.reactions), true);
    expect(listEquals(actual.statuses, expected.statuses), true);
    expect(listEquals(actual.mentions, expected.mentions), true);
    expect(listEquals(actual.tags, expected.tags), true);
    expect(actual.scheduledAt, expected.scheduledAt);
    expect(actual.startsAt, expected.startsAt);
    expect(actual.endsAt, expected.endsAt);
  }
}
