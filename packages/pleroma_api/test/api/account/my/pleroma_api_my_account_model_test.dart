import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/account/my/notifications_settings/pleroma_api_my_account_notifications_settings_model_impl.dart';
import 'package:pleroma_api/src/api/account/my/notifications_settings/pleroma_api_my_account_notifications_settings_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/account/my/pleroma_api_my_account_model_impl.dart';
import 'package:pleroma_api/src/api/account/my/pleroma_api_my_account_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/account/my/source/pleroma_api_my_account_source_model_impl.dart';
import 'package:pleroma_api/src/api/account/my/source/pleroma_api_my_account_source_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiMyAccount toPleromaApiMyAccount', () async {
    var original = PleromaApiMyAccountMockHelper.generate(
      seed: 'seed',
    );

    var obj = original.toPleromaApiMyAccount(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiMyAccount equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiMyAccountMockHelper.generate,
    );
  });

  test('PleromaApiMyAccount toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiMyAccountMockHelper.generate,
      (json) => PleromaApiMyAccount.fromJson(json),
    );
  });

  test('PleromaApiMyAccount hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiMyAccountMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiMyAccount hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountAdapter(),
    );
  });

  test('PleromaApiMyAccount copyWith', () async {
    var obj1 = PleromaApiMyAccountMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = PleromaApiMyAccountMockHelper.generate(
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
      source: obj2.source,
      discoverable: obj2.discoverable,
      followRequestsCount: obj2.followRequestsCount,
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

  test('PleromaApiMyAccountPleromaPart copyWith', () async {
    var obj1 = PleromaApiMyAccountPleromaPartMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = PleromaApiMyAccountPleromaPartMockHelper.generate(
      seed: 'seed2',
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
      PleromaApiMyAccountSourceMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiMyAccountSource hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountSourceAdapter(),
    );
  });

  test(
    'PleromaApiMyAccountSourcePleromaPart hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        PleromaApiMyAccountSourcePleromaPartMockHelper.generate,
        nestedTypeRegistryAdapters: [
          PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
        ],
      );
    },
  );

  test('PleromaApiMyAccountSourcePleromaPart hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiMyAccountSourcePleromaPartAdapter(),
    );
  });

  test(
    'PleromaApiMyAccountNotificationsSettings hive save&load',
    () async {
      await HiveTestHelper.testHiveSaveAndLoad(
        PleromaApiMyAccountNotificationsSettingsMockHelper.generate,
        nestedTypeRegistryAdapters: [
          PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
        ],
      );
    },
  );

  test(
    'PleromaApiMyAccountNotificationsSettingsAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiMyAccountNotificationsSettingsAdapter(),
      );
    },
  );
}
