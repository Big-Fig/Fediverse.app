import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'account_repository_model_helper.dart';

var dbAccount1 = createTestAccount(seed:"seed1");
var dbAccount2 = createTestAccount(seed:"seed2");

void main() {
  AppDatabase database;
  AccountRepository accountRepository;

  setUp(() {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
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

  test('findByRemoteId', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);

    expectDbAccount(await accountRepository.findByRemoteId(dbAccount1.remoteId),
        dbAccount1);
  });

  test('createQuery searchQuery', () async {


    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: "qu",
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository
        .insert(createTestAccount(seed:"seed1").copyWith(acct: "qu"));


    expect((await query.get()).length, 1);

    await accountRepository
        .insert(createTestAccount(seed:"seed2").copyWith(acct: "qur"));

    expect((await query.get()).length, 2);

    await accountRepository
        .insert(createTestAccount(seed:"seed3").copyWith(acct: "q"));

    expect((await query.get()).length, 2);
  });
}

DbAccountWrapper createFakeAccountWithRemoteId(String remoteId) {
  return DbAccountWrapper(DbAccount(
      id: null,
      remoteId: remoteId,
      username: null,
      url: null,
      note: null,
      locked: null,
      headerStatic: null,
      header: null,
      followingCount: null,
      followersCount: null,
      statusesCount: null,
      displayName: null,
      createdAt: null,
      avatarStatic: null,
      avatar: null,
      acct: null));
}
