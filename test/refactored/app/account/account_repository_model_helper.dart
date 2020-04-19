import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

DbAccount createTestAccount(String seed) => DbAccount(
      id: null,
      remoteId: seed + "remoteId1",
      username: seed + "username1",
      url: seed + "url1",
      note: seed + "note1",
      locked: true,
      headerStatic: seed + "headerStatic1",
      header: seed + "header1",
      followingCount: seed.hashCode + 11,
      followersCount: seed.hashCode + 12,
      statusesCount: seed.hashCode + 13,
      displayName: seed + "displayName1",
      createdAt: DateTime( 11),
      avatarStatic: seed + "avatarStatic1",
      avatar: seed + "avatar1",
      acct: seed + "acct1",
      lastStatusAt: DateTime(12),
      bot: false,
      fields: null,
      emojis: null,
      pleromaTags: null,
      pleromaRelationship: null,
      pleromaIsAdmin: true,
      pleromaIsModerator: false,
      pleromaConfirmationPending: true,
      pleromaHideFavorites: false,
      pleromaHideFollowers: true,
      pleromaHideFollows: false,
      pleromaHideFollowersCount: true,
      pleromaHideFollowsCount: false,
      pleromaDeactivated: false,
      pleromaAllowFollowingMove: true,
      pleromaSkipThreadContainment: true,
    );


expectDbAccount(IAccount actual, DbAccount expected) {
      expect(actual.localId != null, true);
      expect(actual.remoteId, expected.remoteId);
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

      expect(actual.pleromaTags, expected.pleromaTags);
      expect(actual.pleromaRelationship, expected.pleromaRelationship);
      expect(actual.pleromaIsAdmin, expected.pleromaIsAdmin);
      expect(actual.pleromaIsModerator, expected.pleromaIsModerator);
      expect(actual.pleromaConfirmationPending, expected.pleromaConfirmationPending);
      expect(actual.pleromaHideFavorites, expected.pleromaHideFavorites);
      expect(actual.pleromaHideFollowers, expected.pleromaHideFollowers);
      expect(actual.pleromaHideFollows, expected.pleromaHideFollows);
      expect(actual.pleromaHideFollowersCount, expected.pleromaHideFollowersCount);
      expect(actual.pleromaHideFollowsCount, expected.pleromaHideFollowsCount);
      expect(actual.pleromaDeactivated, expected.pleromaDeactivated);
      expect(actual.pleromaAllowFollowingMove, expected.pleromaAllowFollowingMove);
      expect(actual.pleromaSkipThreadContainment, expected.pleromaSkipThreadContainment);

}
