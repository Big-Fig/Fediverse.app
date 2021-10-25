import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/status/pleroma_api_status_model_impl.dart';
import 'package:pleroma_api/src/api/status/pleroma_api_status_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/status/post/pleroma_api_post_status_model_impl.dart';
import 'package:pleroma_api/src/api/status/post/pleroma_api_post_status_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/status/post/schedule/pleroma_api_schedule_post_status_model_impl.dart';
import 'package:pleroma_api/src/api/status/post/schedule/pleroma_api_schedule_post_status_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/status/scheduled/pleroma_api_scheduled_status_model_impl.dart';
import 'package:pleroma_api/src/api/status/scheduled/pleroma_api_scheduled_status_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test('PleromaApiStatus toPleromaApiStatus', () async {
    var original = PleromaApiStatusMockHelper.generate(
      seed: 'seed',
    );
    var obj = original.toPleromaApiStatus(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiStatusMockHelper.generate,
    );
  });

  test('PleromaApiStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiStatusMockHelper.generate,
      (json) => PleromaApiStatus.fromJson(json),
    );
  });
  test('PleromaApiPostStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiPostStatusMockHelper.generate,
    );
  });

  test('PleromaApiPostStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiPostStatusMockHelper.generate,
      (json) => PleromaApiPostStatus.fromJson(json),
    );
  });
  test(
    'PleromaApiSchedulePostStatus equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiStatusMockHelper.generate,
      );
    },
  );

  test('PleromaApiSchedulePostStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiSchedulePostStatusMockHelper.generate,
      (json) => PleromaApiSchedulePostStatus.fromJson(json),
    );
  });
  test(
    'PleromaApiScheduledStatus equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiStatusMockHelper.generate,
      );
    },
  );

  test('PleromaApiScheduledStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiScheduledStatusMockHelper.generate,
      (json) => PleromaApiScheduledStatus.fromJson(json),
    );
  });
}
