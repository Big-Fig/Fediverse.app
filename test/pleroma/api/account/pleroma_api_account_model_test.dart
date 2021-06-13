import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_account_test_helper.dart';

void main() {
  test('PleromaApiAccount toPleromaApiAccount', () async {
    var original = PleromaApiAccountTestHelper.createTestPleromaApiAccount(
      seed: 'seed',
    );
    var obj = original.toPleromaApiAccount(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiAccountReport toPleromaApiAccountReport', () async {
    var original =
        PleromaApiAccountTestHelper.createTestPleromaApiAccountReport(
      seed: 'seed',
    );
    var obj = original.toPleromaApiAccountReport(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiAccount equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
        seed: seed,
      ),
    );
  });

  test('PleromaApiAccount toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
        seed: seed,
      ),
      PleromaApiAccount.fromJson,
    );
  });

  test('PleromaApiAccountReport equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccountReport(
        seed: seed,
      ),
    );
  });

  test('PleromaApiAccountReport toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccountReport(
        seed: seed,
      ),
      PleromaApiAccountReport.fromJson,
    );
  });

  test('PleromaApiAccount hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
        seed: seed,
      ),
    );
  });

  test('PleromaApiAccount hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiAccountAdapter(),
    );
  });

  test('PleromaApiAccount copyWith', () async {
    var obj1 = PleromaApiAccountTestHelper.createTestPleromaApiAccount(
      seed: 'seed1',
    );
    var obj2 = PleromaApiAccountTestHelper.createTestPleromaApiAccount(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
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
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccountPleromaPart(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiAccountPleromaPart hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiAccountPleromaPartAdapter());
  });
  test('PleromaApiAccountRelationship hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiAccountTestHelper.createTestPleromaApiAccountRelationship(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiAccountRelationship hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiAccountRelationshipAdapter());
  });
}
