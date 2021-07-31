import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/instance/pleroma_api_instance_test_helper.dart';
import 'package:test/test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiInstance toPleromaApiInstance', () async {
    var original = PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
      seed: 'seed',
    );
    var obj = original.toPleromaApiInstance(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiInstance equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
        seed: seed,
      ),
    );
  });

  test('PleromaApiInstance toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
        seed: seed,
      ),
      PleromaApiInstance.fromJson,
    );
  });

  test('PleromaApiInstanceHistory equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstanceActivityItem(
        seed: seed,
      ),
    );
  });

  test('PleromaApiInstanceActivityItem toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstanceActivityItem(
        seed: seed,
      ),
      PleromaApiInstanceActivityItem.fromJson,
    );
  });

  test('PleromaApiInstancePleromaPartAdapter hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstancePleromaPart(
        seed: seed,
      ),
    );
  });

  test('PleromaApiInstancePleromaPartAdapter hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiInstancePleromaPartAdapter());
  });
  test(
    'PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        ({
          required String seed,
        }) =>
            PleromaApiInstanceTestHelper
                .createTestPleromaApiInstancePleromaPartMetadataFieldLimits(
          seed: seed,
        ),
        skipHiveInit: true,
      );
    },
  );

  test(
    'PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter(),
      );
    },
  );
  test('PleromaApiInstancePleromaPartMetadata hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => PleromaApiInstanceTestHelper
          .createTestPleromaApiInstancePleromaPartMetadata(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiInstancePleromaPartMetadataAdapter hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiInstancePleromaPartMetadataAdapter(),
    );
  });
}
