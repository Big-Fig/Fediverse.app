import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'account_repository_model_helper.dart';

var dbAccount1 = createTestAccount(seed: "seed1");
var dbAccount2 = createTestAccount(seed: "seed2");

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

  test('updateLocalAccountByRemoteAccount', () async {
    var id =
        await accountRepository.insert(dbAccount1.copyWith(acct: "oldAcct"));
    assert(id != null, true);

    var oldLocalAccount = DbAccountWrapper(dbAccount1.copyWith(id: id));
    var newAcct = "newAcct";
    var newRemoteAccount = mapLocalAccountToRemoteAccount(
        DbAccountWrapper(dbAccount1.copyWith(id: id, acct: newAcct)));
    await accountRepository.updateLocalAccountByRemoteAccount(
      oldLocalAccount: oldLocalAccount,
      newRemoteAccount: newRemoteAccount,
    );

    expect((await accountRepository.findById(id)).acct, newAcct);
  });

  test('findByRemoteId', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);

    expectDbAccount(await accountRepository.findByRemoteId(dbAccount1.remoteId),
        dbAccount1);
  });

  test('upsertRemoteAccount', () async {
    expect(await accountRepository.countAll(), 0);

    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
        conversationRemoteId: null);

    expect(await accountRepository.countAll(), 1);
    expectDbAccount(await accountRepository.findByRemoteId(dbAccount1.remoteId),
        dbAccount1);

    // item with same id updated
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
        conversationRemoteId: null);
    expect(await accountRepository.countAll(), 1);
  });

  test('upsertRemoteAccounts', () async {
    expect(await accountRepository.countAll(), 0);
    await accountRepository.upsertRemoteAccounts([
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
    ], conversationRemoteId: null);

    expect(await accountRepository.countAll(), 1);
    expectDbAccount(await accountRepository.findByRemoteId(dbAccount1.remoteId),
        dbAccount1);

    await accountRepository.upsertRemoteAccounts([
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2)),
    ], conversationRemoteId: null);

    // update item with same id
    expect(await accountRepository.countAll(), 2);
    expectDbAccount(await accountRepository.findByRemoteId(dbAccount1.remoteId),
        dbAccount1);
    expectDbAccount(await accountRepository.findByRemoteId(dbAccount2.remoteId),
        dbAccount2);
  });

  test('createQuery empty', () async {
    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository.insert(createTestAccount(seed: "seed1").copyWith());

    expect((await query.get()).length, 1);

    await accountRepository.insert(createTestAccount(seed: "seed2").copyWith());

    expect((await query.get()).length, 2);

    await accountRepository.insert(createTestAccount(seed: "seed3").copyWith());

    expect((await query.get()).length, 3);
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
        .insert(createTestAccount(seed: "seed1").copyWith(acct: "qu"));

    expect((await query.get()).length, 1);

    await accountRepository
        .insert(createTestAccount(seed: "seed2").copyWith(acct: "qur"));

    expect((await query.get()).length, 2);

    await accountRepository
        .insert(createTestAccount(seed: "seed3").copyWith(acct: "q"));

    expect((await query.get()).length, 2);
  });
}
