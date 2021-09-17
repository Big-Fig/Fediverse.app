import 'package:fedi/app/account/account_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/account_database_test_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class AccountMockHelper {
  static Future<DbAccountPopulatedWrapper> createTestAccount({
    required String seed,
    String? remoteId,
  }) async =>
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: await AccountDatabaseMockHelper.createTestDbAccount(
            seed: seed,
            remoteId: remoteId,
          ),
        ),
      );

  static UnifediApiAccountRelationship createTestAccountRelationship({
    required String seed,
  }) =>
      UnifediApiAccountRelationship(
        blocking: seed.hashCode % 2 == 0,
        domainBlocking: seed.hashCode % 3 == 0,
        endorsed: seed.hashCode % 4 == 0,
        followedBy: seed.hashCode % 2 == 0,
        following: seed.hashCode % 3 == 0,
        muting: seed.hashCode % 4 == 0,
        mutingNotifications: seed.hashCode % 2 == 0,
        requested: seed.hashCode % 3 == 0,
        showingReblogs: seed.hashCode % 4 == 0,
        subscribing: seed.hashCode % 2 == 0,
        blockedBy: seed.hashCode % 4 == 0,
        notifying: seed.hashCode % 5 == 0,
        note: null,
        id: null,
      );

  static void expectAccount(IAccount? actual, IAccount? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);
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
