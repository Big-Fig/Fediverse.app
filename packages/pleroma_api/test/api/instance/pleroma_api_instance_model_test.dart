import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/instance/activity/item/pleroma_api_instance_activity_item_model_impl.dart';
import 'package:pleroma_api/src/api/instance/activity/item/pleroma_api_instance_activity_item_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/instance/limits/field/pleroma_api_instance_field_limits_model_impl.dart';
import 'package:pleroma_api/src/api/instance/limits/field/pleroma_api_instance_field_limits_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/instance/metadata/pleroma_api_instance_metadata_model_impl.dart';
import 'package:pleroma_api/src/api/instance/metadata/pleroma_api_instance_metadata_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/instance/pleroma_api_instance_model_impl.dart';
import 'package:pleroma_api/src/api/instance/pleroma_api_instance_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiInstance toPleromaApiInstance', () async {
    var original = PleromaApiInstanceMockHelper.generate(
      seed: 'seed',
    );
    var obj = original.toPleromaApiInstance(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiInstance equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiInstanceMockHelper.generate,
    );
  });

  test('PleromaApiInstance toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiInstanceMockHelper.generate,
      (json) => PleromaApiInstance.fromJson(json),
    );
  });

  test(
    'PleromaApiInstanceActivityItem equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiInstanceActivityItemMockHelper.generate,
      );
    },
  );

  test('PleromaApiInstanceActivityItem toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiInstanceActivityItemMockHelper.generate,
      (json) => PleromaApiInstanceActivityItem.fromJson(json),
    );
  });

  test(
    'PleromaApiInstancePleromaPartAdapter hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        PleromaApiInstancePleromaPartMockHelper.generate,
        nestedTypeRegistryAdapters: [
          PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
        ],
      );
    },
  );

  test(
    'PleromaApiInstancePleromaPartAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiInstancePleromaPartAdapter(),
      );
    },
  );

  test(
    'PleromaApiInstanceMetadataFieldLimits hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        PleromaApiInstanceFieldLimitsMockHelper.generate,
        nestedTypeRegistryAdapters: [
          PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
        ],
      );
    },
  );

  test(
    'PleromaApiInstanceMetadataFieldLimitsAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiInstanceFieldLimitsAdapter(),
      );
    },
  );
  test(
    'PleromaApiInstanceMetadata hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        PleromaApiInstanceMetadataMockHelper.generate,
        nestedTypeRegistryAdapters: [
          PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
        ],
      );
    },
  );

  test(
    'PleromaApiInstanceMetadataAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiInstanceMetadataAdapter(),
      );
    },
  );
}
