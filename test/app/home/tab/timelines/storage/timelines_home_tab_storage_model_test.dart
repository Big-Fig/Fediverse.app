import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'timelines_home_tab_storage_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => TimelinesHomeTabStorageModelTestHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => TimelinesHomeTabStorageModelTestHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
      TimelinesHomeTabStorage.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => TimelinesHomeTabStorageModelTestHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => TimelinesHomeTabStorageAdapter(),
    );
  });

  test('TimelinesHomeTabStorage copyWith', () async {
    var obj1 = TimelinesHomeTabStorageModelTestHelper
        .createTestTimelinesHomeTabStorage(
      seed: "seed1",
    );
    var obj2 = TimelinesHomeTabStorageModelTestHelper
        .createTestTimelinesHomeTabStorage(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      timelineIds: obj2.timelineIds,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });
}
