import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'pleroma_api_my_account_test_helper.dart';

void main() {
  test('PleromaApiMyAccount toPleromaApiMyAccount', () async {
    var original = PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
      seed: "seed",
    );
    var obj = original.toPleromaApiMyAccount(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiMyAccount equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMyAccount toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
      PleromaApiMyAccount.fromJson,
    );
  });

  test('PleromaApiMyAccount hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccount(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMyAccount hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountAdapter(),
    );
  });

  test('PleromaApiMyAccount copyWith', () async {
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
    expect(obj1, obj1.copyWith());
  });

  test('PleromaApiMyAccount hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountAdapter(),
    );
  });

  test('PleromaApiMyAccountEdit equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountEdit(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMyAccountEdit toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountEdit(
        seed: seed,
      ),
      PleromaApiMyAccountEdit.fromJson,
    );
  });

  test('PleromaApiMyAccountEdit copyWith', () async {
    var obj1 = PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountEdit(
      seed: "seed1",
    );
    var obj2 = PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountEdit(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      bot: obj2.bot,
      discoverable: obj2.discoverable,
      displayName: obj2.displayName,
      fieldsAttributes: obj2.fieldsAttributes,
      locked: obj2.locked,
      note: obj2.note,
      source: obj2.source,
      actorType: obj2.actorType,
      allowFollowingMove: obj2.allowFollowingMove,
      acceptsChatMessages: obj2.acceptsChatMessages,
      defaultScope: obj2.defaultScope,
      hideFavorites: obj2.hideFavorites,
      hideFollowers: obj2.hideFollowers,
      hideFollowersCount: obj2.hideFollowersCount,
      hideFollows: obj2.hideFollows,
      hideFollowsCount: obj2.hideFollowsCount,
      pleromaBackgroundImage: obj2.pleromaBackgroundImage,
      pleromaSettingsStore: obj2.pleromaSettingsStore,
      showRole: obj2.showRole,
      skipThreadContainment: obj2.skipThreadContainment,
      alsoKnownAs: obj2.alsoKnownAs,
      noRichText: obj2.noRichText,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('PleromaApiMyAccountPleromaPart copyWith', () async {
    var obj1 =
        PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountPleromaPart(
      seed: "seed1",
    );
    var obj2 =
        PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountPleromaPart(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      backgroundImage: obj2.backgroundImage,
      tags: obj2.tags,
      relationship: obj2.relationship,
      isAdmin: obj2.isAdmin,
      isModerator: obj2.isModerator,
      confirmationPending: obj2.confirmationPending,
      hideFavorites: obj2.hideFavorites,
      hideFollowers: obj2.hideFollowers,
      hideFollows: obj2.hideFollows,
      hideFollowersCount: obj2.hideFollowersCount,
      hideFollowsCount: obj2.hideFollowsCount,
      settingsStore: obj2.settingsStore,
      chatToken: obj2.chatToken,
      deactivated: obj2.deactivated,
      allowFollowingMove: obj2.allowFollowingMove,
      unreadConversationCount: obj2.unreadConversationCount,
      notificationSettings: obj2.notificationSettings,
      skipThreadContainment: obj2.skipThreadContainment,
      acceptsChatMessages: obj2.acceptsChatMessages,
      isConfirmed: obj2.isConfirmed,
      favicon: obj2.favicon,
      apId: obj2.apId,
      alsoKnownAs: obj2.alsoKnownAs,
      unreadNotificationsCount: obj2.unreadNotificationsCount,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('PleromaApiMyAccountSource hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiMyAccountTestHelper.createTestPleromaApiMyAccountSource(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiMyAccountSource hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountSourceAdapter(),
    );
  });

  test('PleromaApiMyAccountSourcePleromaPart hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => PleromaApiMyAccountTestHelper
          .createTestPleromaApiMyAccountSourcePleromaPart(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiMyAccountSourcePleromaPart hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountSourcePleromaPartAdapter(),
    );
  });

  test(
    'PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        ({
          required String seed,
        }) =>
            PleromaApiMyAccountTestHelper
                .createTestPleromaApiMyAccountPleromaPartNotificationsSettings(
          seed: seed,
        ),
        skipHiveInit: true,
      );
    },
  );

  test(
    'PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter(),
      );
    },
  );
}
