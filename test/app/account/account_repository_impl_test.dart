import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'account_repository_model_helper.dart';

var dbAccount1 = createTestAccount("seed1");
var dbAccount2 = createTestAccount("seed2");


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
  expect(actual.source, expected.source);

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
  expect(actual.pleromaChatToken, expected.pleromaChatToken);
  expect(actual.pleromaDeactivated, expected.pleromaDeactivated);
  expect(actual.pleromaAllowFollowingMove, expected.pleromaAllowFollowingMove);
  expect(actual.pleromaUnreadConversationCount, expected.pleromaUnreadConversationCount);
  expect(actual.pleromaSkipThreadContainment, expected.pleromaSkipThreadContainment);
  expect(actual.pleromaNotificationSettings, expected.pleromaNotificationSettings);

}

void main() {
  AppDatabase database;
  AccountRepository accountRepository;

  setUp(() {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(dao: database.accountDao);
  });

  tearDown(() async {
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);
    expectDbAccount(await accountRepository.findById(id), dbAccount1);
  });
  test('updateById', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);

    await accountRepository.updateById(id, dbAccount2);
    expectDbAccount(await accountRepository.findById(id), dbAccount2);
  });
}

