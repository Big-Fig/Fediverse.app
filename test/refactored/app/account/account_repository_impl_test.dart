import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../status/status_repository_model_helper.dart';
import 'account_repository_model_helper.dart';

void main() {
  AppDatabase database;
  AccountRepository accountRepository;

  DbAccount dbAccount1;
  DbAccount dbAccount2;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    dbAccount1 = await createTestAccount(seed: "seed1");
    dbAccount2 = await createTestAccount(seed: "seed2");
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

    await accountRepository
        .insert((await createTestAccount(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await accountRepository
        .insert((await createTestAccount(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await accountRepository
        .insert((await createTestAccount(seed: "seed3")).copyWith());

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
        .insert((await createTestAccount(seed: "seed1")).copyWith(acct: "qu"));

    expect((await query.get()).length, 1);

    await accountRepository
        .insert((await createTestAccount(seed: "seed2")).copyWith(acct: "qur"));

    expect((await query.get()).length, 2);

    await accountRepository
        .insert((await createTestAccount(seed: "seed3")).copyWith(acct: "q"));

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInStatusFavouritedBy', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var dbStatus =
        await createTestStatus(seed: "seedStatus", dbAccount: dbAccount1);
    var status = await createTestStatusPopulated(dbStatus, accountRepository);
    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusFavouritedBy: DbStatusPopulatedWrapper(status),
        onlyInStatusRebloggedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository.updateStatusFavouritedBy(
        statusRemoteId: dbStatus.remoteId,
        favouritedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1))
        ]);

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusFavouritedBy(
        statusRemoteId: dbStatus.remoteId,
        favouritedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
        ]);

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusFavouritedBy(
        statusRemoteId: dbStatus.remoteId,
        favouritedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
        ]);
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInStatusRebloggedBy', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var dbStatus =
        await createTestStatus(seed: "seedStatus", dbAccount: dbAccount1);
    var status = await createTestStatusPopulated(dbStatus, accountRepository);
    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusFavouritedBy: null,
        onlyInStatusRebloggedBy: DbStatusPopulatedWrapper(status),
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository.updateStatusRebloggedBy(
        statusRemoteId: dbStatus.remoteId,
        rebloggedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1))
        ]);

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusRebloggedBy(
        statusRemoteId: dbStatus.remoteId,
        rebloggedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
        ]);

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusRebloggedBy(
        statusRemoteId: dbStatus.remoteId,
        rebloggedByAccounts: [
          mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
        ]);
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInAccountFollowers', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusFavouritedBy: null,
        onlyInStatusRebloggedBy: null,
        onlyInAccountFollowers: DbAccountWrapper(dbAccount1),
        onlyInAccountFollowing: null,
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository.updateAccountFollowers(dbAccount1.remoteId,
        [mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))]);
    expect((await query.get()).length, 1);

    await accountRepository.updateAccountFollowers(dbAccount1.remoteId, [
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
    ]);
    expect((await query.get()).length, 2);

    await accountRepository.updateAccountFollowers(dbAccount1.remoteId,
        [mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))]);
    expect((await query.get()).length, 1);
  });


  test('createQuery onlyInAccountFollowing', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: null,
        onlyInStatusFavouritedBy: null,
        onlyInStatusRebloggedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: DbAccountWrapper(dbAccount1),
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await accountRepository.updateAccountFollowings(dbAccount1.remoteId,
        [mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))]);
    expect((await query.get()).length, 1);

    await accountRepository.updateAccountFollowings(dbAccount1.remoteId, [
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
      mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))
    ]);
    expect((await query.get()).length, 2);

    await accountRepository.updateAccountFollowings(dbAccount1.remoteId,
        [mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2))]);
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInConversation', () async {
    var conversationRemoteId = "conversationRemoteId";
    var conversation = DbConversationWrapper(DbConversation(
        id: null, remoteId: conversationRemoteId, unread: false));

    var query = accountRepository.createQuery(
        olderThanAccount: null,
        newerThanAccount: null,
        onlyInConversation: conversation,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    // not associated with conversation
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
        conversationRemoteId: null);
    expect((await query.get()).length, 0);

    // associated with conversation
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
        conversationRemoteId: conversationRemoteId);
    expect((await query.get()).length, 1);

    // duplicated
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount1)),
        conversationRemoteId: conversationRemoteId);

    expect((await query.get()).length, 1);

    // additional account associated with conversation
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(DbAccountWrapper(dbAccount2)),
        conversationRemoteId: conversationRemoteId);

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanAccount', () async {
    var query = accountRepository.createQuery(
      onlyInConversation: null,
      onlyInStatusRebloggedBy: null,
      onlyInStatusFavouritedBy: null,
      onlyInAccountFollowers: null,
      onlyInAccountFollowing: null,
      searchQuery: null,
      newerThanAccount: createFakeAccountWithRemoteId("remoteId5"),
      limit: null,
      offset: null,
      orderingTermData: null,
      olderThanAccount: null,
    );

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanAccount', () async {
    var query = accountRepository.createQuery(
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        newerThanAccount: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanAccount: createFakeAccountWithRemoteId("remoteId5"));

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanAccount & newerThanAccount', () async {
    var query = accountRepository.createQuery(
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        newerThanAccount: createFakeAccountWithRemoteId("remoteId2"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanAccount: createFakeAccountWithRemoteId("remoteId5"));

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed4"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed5"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed6"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = accountRepository.createQuery(
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        newerThanAccount: null,
        limit: null,
        offset: null,
        orderingTermData: AccountOrderingTermData(
            orderByType: AccountOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        olderThanAccount: null);

    var account2 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var account1 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var account3 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var actualList = (await query
        .map(accountRepository.dao.typedResultToPopulated)
        .map((dbAccount) => DbAccountWrapper(dbAccount))
        .get());
    expect(actualList.length, 3);

    expectDbAccount(actualList[0], account1);
    expectDbAccount(actualList[1], account2);
    expectDbAccount(actualList[2], account3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = accountRepository.createQuery(
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        newerThanAccount: null,
        limit: null,
        offset: null,
        orderingTermData: AccountOrderingTermData(
            orderByType: AccountOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanAccount: null);

    var account2 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var account1 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var account3 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var actualList = (await query
        .map(accountRepository.dao.typedResultToPopulated)
        .map((dbAccount) => DbAccountWrapper(dbAccount))
        .get());
    expect(actualList.length, 3);

    expectDbAccount(actualList[0], account3);
    expectDbAccount(actualList[1], account2);
    expectDbAccount(actualList[2], account1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = accountRepository.createQuery(
        onlyInConversation: null,
        onlyInStatusRebloggedBy: null,
        onlyInStatusFavouritedBy: null,
        onlyInAccountFollowers: null,
        onlyInAccountFollowing: null,
        searchQuery: null,
        newerThanAccount: null,
        limit: 1,
        offset: 1,
        orderingTermData: AccountOrderingTermData(
            orderByType: AccountOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanAccount: null);

    var account2 = await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    await insertDbAccount(
        accountRepository,
        (await createTestAccount(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var actualList = (await query
        .map(accountRepository.dao.typedResultToPopulated)
        .map((dbAccount) => DbAccountWrapper(dbAccount))
        .get());
    expect(actualList.length, 1);

    expectDbAccount(actualList[0], account2);
  });
}
