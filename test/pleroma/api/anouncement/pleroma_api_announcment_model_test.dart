import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_announcement_test_helper.dart';

void main() {
  test('PleromaApiAnnouncement equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiAnnouncementTestHelper.createTestPleromaApiAnnouncement(
        seed: seed,
      ),
    );
  });

  test('PleromaApiAnnouncement toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiAnnouncementTestHelper.createTestPleromaApiAnnouncement(
        seed: seed,
      ),
      PleromaApiAnnouncement.fromJson,
    );
  });

  test('PleromaApiAnnouncement copyWith', () async {
    var obj1 =
        PleromaApiAnnouncementTestHelper.createTestPleromaApiAnnouncement(
      seed: 'seed1',
    );
    var obj2 =
        PleromaApiAnnouncementTestHelper.createTestPleromaApiAnnouncement(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      id: obj2.id,
      content: obj2.content,
      allDay: obj2.allDay,
      publishedAt: obj2.publishedAt,
      updatedAt: obj2.updatedAt,
      read: obj2.read,
      reactions: obj2.reactions,
      statuses: obj2.statuses,
      mentions: obj2.mentions,
      tags: obj2.tags,
      scheduledAt: obj2.scheduledAt,
      startsAt: obj2.startsAt,
      endsAt: obj2.endsAt,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });
}
