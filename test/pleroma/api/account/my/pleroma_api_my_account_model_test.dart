import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'pleroma_api_my_account_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
      PleromaApiMyAccount.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountAdapter(),
    );
  });

  test('copyWith', () async {
    var obj1 = PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
      seed: "seed1",
    );
    var obj2 = PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
      seed: "seed2",
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
      // see myAccountPleroma
      pleroma: null,
      lastStatusAt: obj2.lastStatusAt,
      fqn: obj2.fqn,
      // ignore: no-equal-arguments
      myAccountPleroma: obj2.pleroma,
      discoverable: obj2.discoverable,
      followRequestsCount: obj2.followRequestsCount,
      source: obj2.source,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountAdapter(),
    );
  });
}
