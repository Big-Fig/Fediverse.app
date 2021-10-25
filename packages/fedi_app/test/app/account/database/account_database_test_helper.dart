import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account_test_helper.dart';

class AccountDatabaseMockHelper {
// ignore_for_file: no-magic-number
  static Future<DbAccount> createTestDbAccount({
    required String seed,
    String? remoteId,
    String? acct,
  }) async =>
      DbAccount(
        id: null,
        remoteId: remoteId ?? seed + 'remoteId1',
        username: seed + 'username1',
        url: seed + 'url1',
        note: seed + 'note1',
        locked: true,
        headerStatic: seed + 'headerStatic1',
        header: seed + 'header1',
        followingCount: seed.hashCode + 11,
        followersCount: seed.hashCode + 12,
        statusesCount: seed.hashCode + 13,
        displayName: seed + 'displayName1',
        createdAt: DateTime(11),
        avatarStatic: seed + 'avatarStatic1',
        avatar: seed + 'avatar1',
        acct: acct ?? (seed + 'acct1'),
        lastStatusAt: DateTime(12),
        bot: false,
        fields: null,
        emojis: null,
        tags: null,
        relationship:
            AccountMockHelper.createTestAccountRelationship(seed: seed),
        isAdmin: true,
        isModerator: false,
        confirmationPending: true,
        hideFavorites: false,
        hideFollowers: true,
        hideFollows: false,
        hideFollowersCount: true,
        hideFollowsCount: false,
        deactivated: false,
        allowFollowingMove: true,
        skipThreadContainment: true,
        backgroundImage: '$seed backgroundImage',
      );

  static void expectDbAccount(IAccount? actual, DbAccount? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.localId != null, true);
    expect(actual.remoteId, expected!.remoteId);
    expect(actual.username, expected.username);
    expect(actual.url, expected.url);
    expect(actual.note, expected.note);
    expect(actual.locked, expected.locked);
    expect(actual.headerStatic, expected.headerStatic);
    expect(actual.header, expected.header);
    expect(actual.followingCount, expected.followingCount);
    expect(actual.followersCount, expected.followersCount);
    expect(actual.statusesCount, expected.statusesCount);
    expect(actual.displayName, expected.displayName);
    expect(actual.avatarStatic, expected.avatarStatic);
    expect(actual.avatar, expected.avatar);
    expect(actual.acct, expected.acct);
    expect(actual.lastStatusAt, expected.lastStatusAt);

    expect(actual.bot, expected.bot);
    expect(actual.fields, expected.fields);
    expect(actual.emojis, expected.emojis);

    expect(actual.tags, expected.tags);
    expect(actual.relationship, expected.relationship);
    expect(actual.isAdmin, expected.isAdmin);
    expect(actual.isModerator, expected.isModerator);
    expect(
      actual.confirmationPending,
      expected.confirmationPending,
    );
    expect(actual.hideFavorites, expected.hideFavorites);
    expect(actual.hideFollowers, expected.hideFollowers);
    expect(actual.hideFollows, expected.hideFollows);
    expect(
      actual.hideFollowersCount,
      expected.hideFollowersCount,
    );
    expect(actual.hideFollowsCount, expected.hideFollowsCount);
    expect(actual.deactivated, expected.deactivated);
    expect(
      actual.allowFollowingMove,
      expected.allowFollowingMove,
    );
    expect(
      actual.skipThreadContainment,
      expected.skipThreadContainment,
    );
  }
}
