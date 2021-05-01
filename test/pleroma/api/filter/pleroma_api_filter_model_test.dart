import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_filter_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiFilter equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiFilterTestHelper.createTestPleromaApiFilter(
        seed: seed,
      ),
    );
  });

  test('PleromaApiFilter toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiFilterTestHelper.createTestPleromaApiFilter(
        seed: seed,
      ),
      PleromaApiFilter.fromJson,
    );
  });

  test('PleromaApiFilter copyWith', () async {
    var obj1 = PleromaApiFilterTestHelper.createTestPleromaApiFilter(
      seed: "seed1",
    );
    var obj2 = PleromaApiFilterTestHelper.createTestPleromaApiFilter(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      context: obj2.context,
      expiresAt: obj2.expiresAt,
      id: obj2.id,
      irreversible: obj2.irreversible,
      phrase: obj2.phrase,
      wholeWord: obj2.wholeWord,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('PleromaApiFilter hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiFilterTestHelper.createTestPleromaApiFilter(
        seed: seed,
      ),
    );
  });

  test('PleromaApiFilter hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiFilterAdapter(),
    );
  });

  test('PleromaApiAccount copyWith', () async {
    var obj1 = PleromaApiFilterTestHelper.createTestPleromaApiFilter(
      seed: "seed1",
    );
    var obj2 = PleromaApiFilterTestHelper.createTestPleromaApiFilter(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      context: obj2.context,
      expiresAt: obj2.expiresAt,
      id: obj2.id,
      irreversible: obj2.irreversible,
      phrase: obj2.phrase,
      wholeWord: obj2.wholeWord,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('PostPleromaApiFilter equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
        seed: seed,
      ),
    );
  });

  test('PostPleromaApiFilter toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
        seed: seed,
      ),
      PostPleromaApiFilter.fromJson,
    );
  });

  test('PostPleromaApiFilter copyWith', () async {
    var obj1 = PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
      seed: "seed1",
    );
    var obj2 = PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      context: obj2.context,
      expiresInSeconds: obj2.expiresInSeconds,
      irreversible: obj2.irreversible,
      phrase: obj2.phrase,
      wholeWord: obj2.wholeWord,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('PostPleromaApiFilter copyWith', () async {
    var obj1 = PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
      seed: "seed1",
    );
    var obj2 = PleromaApiFilterTestHelper.createTestPostPleromaApiFilter(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      context: obj2.context,
      expiresInSeconds: obj2.expiresInSeconds,
      irreversible: obj2.irreversible,
      phrase: obj2.phrase,
      wholeWord: obj2.wholeWord,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });
}
