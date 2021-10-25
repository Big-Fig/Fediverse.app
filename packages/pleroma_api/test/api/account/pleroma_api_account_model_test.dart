import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/account/pleroma_api_account_model_impl.dart';
import 'package:pleroma_api/src/api/account/pleroma_api_account_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/account/relationship/pleroma_api_account_relationship_model_impl.dart';
import 'package:pleroma_api/src/api/account/relationship/pleroma_api_account_relationship_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/account/report/pleroma_api_account_report_model_impl.dart';
import 'package:pleroma_api/src/api/account/report/pleroma_api_account_report_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid-ignoring-return-values

void main() {
  test('PleromaApiAccount toPleromaApiAccount', () async {
    var original = PleromaApiAccountMockHelper.generate(
      seed: 'seed',
    );
    var obj = original.toPleromaApiAccount(forceNewObject: true);

    expect(original, obj);
  });
  test(
    'PleromaApiAccountReport toPleromaApiAccountReport',
    () async {
      var original = PleromaApiAccountReportMockHelper.generate(
        seed: 'seed',
      );
      var obj = original.toPleromaApiAccountReport(forceNewObject: true);

      expect(original, obj);
    },
  );

  test('PleromaApiAccount equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiAccountMockHelper.generate,
    );
  });

  test('PleromaApiAccount toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiAccountMockHelper.generate,
      (json) => PleromaApiAccount.fromJson(json),
    );
  });

  test(
    'PleromaApiAccountReport equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiAccountReportMockHelper.generate,
      );
    },
  );

  test('PleromaApiAccountReport toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiAccountReportMockHelper.generate,
      (json) => PleromaApiAccountReport.fromJson(json),
    );
  });

  test('PleromaApiAccount hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiAccountMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiAccount hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiAccountAdapter(),
    );
  });

  test('PleromaApiAccount copyWith', () async {
    var obj1 = PleromaApiAccountMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = PleromaApiAccountMockHelper.generate(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      suspended: obj2.suspended,
      muteExpiresAt: obj2.muteExpiresAt,
      username: obj2.username,
      url: obj2.url,
      statusesCount: obj2.statusesCount,
      note: obj2.note,
      locked: obj2.locked,
      id: obj2.id,
      headerStatic: obj2.headerStatic,
      header: obj2.header,
      followingCount: obj2.followingCount,
      followersCount: obj2.followersCount,
      fields: obj2.fields,
      emojis: obj2.emojis,
      displayName: obj2.displayName,
      createdAt: obj2.createdAt,
      bot: obj2.bot,
      avatarStatic: obj2.avatarStatic,
      avatar: obj2.avatar,
      acct: obj2.acct,
      pleroma: obj2.pleroma,
      lastStatusAt: obj2.lastStatusAt,
      fqn: obj2.fqn,
    );
    var obj1Clone = obj1.copyWith();

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1Clone);
  });

  test('PleromaApiAccountPleromaPart hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiAccountPleromaPartMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiAccountPleromaPart hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiAccountPleromaPartAdapter(),
    );
  });

  test('PleromaApiAccountRelationship hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiAccountRelationshipMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test(
    'PleromaApiAccountRelationship hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiAccountRelationshipAdapter(),
      );
    },
  );
}
