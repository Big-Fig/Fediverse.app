import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

var dbAccount1 = DbAccount(
    id: null,
    remoteId: "remoteId1",
    username: "username1",
    url: "url1",
    note: "note1",
    locked: true,
    headerStatic: "headerStatic1",
    header: "header1",
    followingCount: 11,
    followersCount: 12,
    statusesCount: 13,
    displayName: "displayName1",
    createdAt: DateTime(11),
    avatarStatic: "avatarStatic1",
    avatar: "avatar1",
    acct: "acct1",
    lastStatusAt: DateTime(12));
var dbAccount2 = DbAccount(
    id: null,
    remoteId: "remoteId2",
    username: "username2",
    url: "url2",
    note: "note2",
    locked: true,
    headerStatic: "headerStatic2",
    header: "header2",
    followingCount: 22,
    followersCount: 22,
    statusesCount: 23,
    displayName: "displayName2",
    createdAt: DateTime(22),
    avatarStatic: "avatarStatic2",
    avatar: "avatar2",
    acct: "acct2",
    lastStatusAt: DateTime(22));


expectDbAccount(IAccount actual, DbAccount except) {
  expect(actual.localId != null, true);
  expect(actual.remoteId, except.remoteId);
  expect(actual.username, except.username);
  expect(actual.url, except.url);
  expect(actual.note, except.note);
  expect(actual.locked, except.locked);
  expect(actual.headerStatic, except.headerStatic);
  expect(actual.header, except.header);
  expect(actual.followingCount, except.followingCount);
  expect(actual.followersCount, except.followersCount);
  expect(actual.statusesCount, except.statusesCount);
  expect(actual.displayName, except.displayName);
  expect(actual.avatarStatic, except.avatarStatic);
  expect(actual.avatar, except.avatar);
  expect(actual.acct, except.acct);
  expect(actual.lastStatusAt, except.lastStatusAt);
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
