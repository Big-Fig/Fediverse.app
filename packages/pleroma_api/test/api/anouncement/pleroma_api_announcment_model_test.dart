import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/announcement/pleroma_api_announcement_model_impl.dart';
import 'package:pleroma_api/src/api/announcement/pleroma_api_announcement_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test('PleromaApiAnnouncement equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiAnnouncementMockHelper.generate,
    );
  });

  test('PleromaApiAnnouncement toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiAnnouncementMockHelper.generate,
      (json) => PleromaApiAnnouncement.fromJson(json),
    );
  });

  test('PleromaApiAnnouncement copyWith', () async {
    var obj1 = PleromaApiAnnouncementMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = PleromaApiAnnouncementMockHelper.generate(
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
