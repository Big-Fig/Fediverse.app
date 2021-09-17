import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import '../../../../date_time/date_time_test_helper.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number
class InstanceAnnouncementDatabaseMockHelper {
  static DbInstanceAnnouncement createTestDbInstanceAnnouncement({
    required String seed,
    String? remoteId,
    DateTime? endsAt,
    DateTime? startsAt,
    bool allDay = false,
    bool read = false,
  }) {
    var dbInstanceAnnouncement = DbInstanceAnnouncement(
      id: null,
      remoteId: remoteId ?? seed + 'remoteId',
      allDay: allDay,
      publishedAt: DateTimeMockHelper.createTestDateTime(seed: seed + '1'),
      updatedAt: DateTimeMockHelper.createTestDateTime(seed: seed + '2'),
      read: read,
      content: seed + 'content',
      reactions: [
        UnifediApiEmojiReactionMockHelper
            .generate(
          seed: seed + ' 1',
        ),
        UnifediApiEmojiReactionMockHelper
            .generate(
          seed: seed + ' 2',
        ),
      ],
      mentions: [
        UnifediApiMentionMockHelper.generate(
          seed: seed + '1',
        ),
        UnifediApiMentionMockHelper.generate(
          seed: seed + '2',
        ),
      ],
      tags: [
        UnifediApiTagMockHelper.generate(seed: seed + '1'),
        UnifediApiTagMockHelper.generate(seed: seed + '2'),
      ],
      statuses: [
        UnifediApiStatusMockHelper.generate(
          seed: seed + '1',
        ),
        UnifediApiStatusMockHelper.generate(
          seed: seed + '2',
        ),
      ],
      startsAt: startsAt,
      endsAt: endsAt,
    );

    return dbInstanceAnnouncement;
  }

  static void expectDbInstanceAnnouncementPopulated(
    IInstanceAnnouncement actual,
    DbInstanceAnnouncementPopulated expected,
  ) {
    expect(actual.localId != null, true);
    var dbInstanceAnnouncement = expected.dbInstanceAnnouncement;
    InstanceAnnouncementDatabaseMockHelper.expectDbInstanceAnnouncement(
      actual,
      dbInstanceAnnouncement,
    );
  }

  static void expectDbInstanceAnnouncement(
    IInstanceAnnouncement actual,
    DbInstanceAnnouncement dbInstanceAnnouncement,
  ) {
    expect(
      actual.remoteId,
      dbInstanceAnnouncement.remoteId,
    );

    expect(actual.content, dbInstanceAnnouncement.content);
    expect(actual.allDay, dbInstanceAnnouncement.allDay);
    expect(actual.publishedAt, dbInstanceAnnouncement.publishedAt);
    expect(actual.updatedAt, dbInstanceAnnouncement.updatedAt);
    expect(actual.read, dbInstanceAnnouncement.read);
    expect(
      listEquals(actual.reactions, dbInstanceAnnouncement.reactions),
      true,
    );
    expect(
      listEquals(actual.statuses, dbInstanceAnnouncement.statuses),
      true,
    );
    expect(
      listEquals(actual.mentions, dbInstanceAnnouncement.mentions),
      true,
    );
    expect(
      listEquals(actual.tags, dbInstanceAnnouncement.tags),
      true,
    );
    expect(actual.scheduledAt, dbInstanceAnnouncement.scheduledAt);
    expect(actual.startsAt, dbInstanceAnnouncement.startsAt);
    expect(actual.endsAt, dbInstanceAnnouncement.endsAt);
  }

  static Future<DbInstanceAnnouncementPopulated>
      createTestInstanceAnnouncementPopulated(
    DbInstanceAnnouncement dbInstanceAnnouncement,
  ) async {
    var dbInstanceAnnouncementPopulated = DbInstanceAnnouncementPopulated(
      dbInstanceAnnouncement: dbInstanceAnnouncement,
    );

    return dbInstanceAnnouncementPopulated;
  }
}
