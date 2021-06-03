import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../hive/hive_test_helper.dart';
import '../../json/json_test_helper.dart';
import '../../obj/obj_test_helper.dart';
import 'timeline_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => TimelineModelTestHelper.createTestTimeline(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => TimelineModelTestHelper.createTestTimeline(
        seed: seed,
      ),
      Timeline.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => TimelineModelTestHelper.createTestTimeline(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => TimelineAdapter(),
    );
  });
}
