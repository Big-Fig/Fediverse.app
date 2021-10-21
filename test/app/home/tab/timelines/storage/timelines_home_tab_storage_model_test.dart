// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'timelines_home_tab_storage_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) => TimelinesHomeTabStorageModelMockHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) => TimelinesHomeTabStorageModelMockHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
      (json) => TimelinesHomeTabStorage.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) => TimelinesHomeTabStorageModelMockHelper
          .createTestTimelinesHomeTabStorage(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => TimelinesHomeTabStorageAdapter(),
    );
  });

  test('TimelinesHomeTabStorage copyWith', () async {
    var obj1 = TimelinesHomeTabStorageModelMockHelper
        .createTestTimelinesHomeTabStorage(
      seed: 'seed1',
    );
    var obj2 = TimelinesHomeTabStorageModelMockHelper
        .createTestTimelinesHomeTabStorage(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      timelineIds: obj2.timelineIds,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });
}
