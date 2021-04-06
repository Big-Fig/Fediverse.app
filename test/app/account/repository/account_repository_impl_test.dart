import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/database/account_database_dao.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../conversation/conversation_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../account_model_helper.dart';
import '../database/account_database_model_helper.dart';
import 'account_repository_model_helper.dart';

void main() {
//  initTestLog();

  late AppDatabase database;
  late AccountRepository accountRepository;

  late DbAccount dbAccount1;
  late DbAccount dbAccount2;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
    accountRepository = AccountRepository(appDatabase: database);
    dbAccount1 = await createTestDbAccount(seed: "seed1");
    dbAccount2 = await createTestDbAccount(seed: "seed2");
  });

  tearDown(() async {
    await accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id > 0, true);
    expectDbAccount(await accountRepository.findById(id), dbAccount1);
  });

  test('updateById', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id > 0, true);

    await accountRepository.updateById(id, dbAccount2);
    expectDbAccount(await accountRepository.findById(id), dbAccount2);
  });

  test('updateLocalAccountByRemoteAccount', () async {
    var id =
        await accountRepository.insert(dbAccount1.copyWith(acct: "oldAcct"));
    assert(id > 0, true);

    var oldLocalAccount =
        DbAccountWrapper(dbAccount: dbAccount1.copyWith(id: id));
    var newAcct = "newAcct";
    var newRemoteAccount = DbAccountWrapper(
      dbAccount: dbAccount1.copyWith(
        id: id,
        acct: newAcct,
      ),
    ).toPleromaAccount();
    await accountRepository.updateLocalAccountByRemoteAccount(
      oldLocalAccount: oldLocalAccount,
      newRemoteAccount: newRemoteAccount,
    );

    expect((await accountRepository.findById(id))!.acct, newAcct);
  });

  test('findByRemoteId', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id > 0, true);

    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount1.remoteId),
      dbAccount1,
    );
  });

  test('upsertRemoteAccount', () async {
    expect(await accountRepository.countAll(), 0);

    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: null,
      chatRemoteId: null,
    );

    expect(await accountRepository.countAll(), 1);
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount1.remoteId),
      dbAccount1,
    );

    // item with same id updated
    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    expect(await accountRepository.countAll(), 1);
  });

  test('upsertRemoteAccounts', () async {
    expect(await accountRepository.countAll(), 0);
    await accountRepository.upsertRemoteAccounts(
      [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      ],
      conversationRemoteId: null,
      chatRemoteId: null,
    );

    expect(await accountRepository.countAll(), 1);
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount1.remoteId),
      dbAccount1,
    );

    await accountRepository.upsertRemoteAccounts(
      [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
      conversationRemoteId: null,
      chatRemoteId: null,
    );

    // update item with same id
    expect(await accountRepository.countAll(), 2);
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount1.remoteId),
      dbAccount1,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount2.remoteId),
      dbAccount2,
    );
  });

  test('createQuery empty', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository
        .insert((await createTestDbAccount(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await accountRepository
        .insert((await createTestDbAccount(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await accountRepository
        .insert((await createTestDbAccount(seed: "seed3")).copyWith());

    expect((await query.get()).length, 3);
  });

  test('createQuery searchQuery', () async {
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        searchQuery: "qu",
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.insert(
      (await createTestDbAccount(seed: "seed1")).copyWith(acct: "qu"),
    );

    expect((await query.get()).length, 1);

    await accountRepository.insert(
      (await createTestDbAccount(seed: "seed2")).copyWith(acct: "qur"),
    );

    expect((await query.get()).length, 2);

    await accountRepository
        .insert((await createTestDbAccount(seed: "seed3")).copyWith(acct: "q"));

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInStatusFavouritedBy', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var dbStatus =
        await createTestDbStatus(seed: "seedStatus", dbAccount: dbAccount1);
    var status = await createTestDbStatusPopulated(dbStatus, accountRepository);
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        onlyInStatusFavouritedBy:
            DbStatusPopulatedWrapper(dbStatusPopulated: status),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.updateStatusFavouritedBy(
      statusRemoteId: dbStatus.remoteId,
      favouritedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      ],
    );

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusFavouritedBy(
      statusRemoteId: dbStatus.remoteId,
      favouritedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusFavouritedBy(
      statusRemoteId: dbStatus.remoteId,
      favouritedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInStatusRebloggedBy', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var dbStatus =
        await createTestDbStatus(seed: "seedStatus", dbAccount: dbAccount1);
    var status = await createTestDbStatusPopulated(dbStatus, accountRepository);
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        onlyInStatusRebloggedBy:
            DbStatusPopulatedWrapper(dbStatusPopulated: status),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.updateStatusRebloggedBy(
      statusRemoteId: dbStatus.remoteId,
      rebloggedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      ],
    );

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusRebloggedBy(
      statusRemoteId: dbStatus.remoteId,
      rebloggedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusRebloggedBy(
      statusRemoteId: dbStatus.remoteId,
      rebloggedByAccounts: [
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInAccountFollowers', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        onlyInAccountFollowers: DbAccountWrapper(dbAccount: dbAccount1),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.addAccountFollowers(
      accountRemoteId: dbAccount1.remoteId,
      followers: [DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount()],
    );
    expect((await query.get()).length, 1);

    await accountRepository.addAccountFollowers(
      accountRemoteId: dbAccount1.remoteId,
      followers: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInAccountFollowing', () async {
    await accountRepository.insert(dbAccount1);
    await accountRepository.insert(dbAccount2);

    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        onlyInAccountFollowing: DbAccountWrapper(dbAccount: dbAccount1),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.addAccountFollowings(
      accountRemoteId: dbAccount1.remoteId,
      followings: [DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount()],
    );
    expect((await query.get()).length, 1);

    await accountRepository.addAccountFollowings(
      accountRemoteId: dbAccount1.remoteId,
      followings: [
        DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
        DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      ],
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInConversation', () async {
    var conversationRemoteId = "conversationRemoteId";

    var conversation = DbConversationChatPopulatedWrapper(
      dbConversationPopulated: DbConversationPopulated(
        dbConversation: DbConversation(
          id: null,
          remoteId: conversationRemoteId,
          unread: false,
        ),
      ),
    );

    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters(
        onlyInConversation: conversation,
      ),
      pagination: null,
      orderingTermData: null,
    );

    // not associated with conversation
    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    expect((await query.get()).length, 0);

    // associated with conversation
    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: conversationRemoteId,
      chatRemoteId: null,
    );
    expect((await query.get()).length, 1);

    // duplicated
    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: conversationRemoteId,
      chatRemoteId: null,
    );

    expect((await query.get()).length, 1);

    // additional account associated with conversation
    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount2).toPleromaAccount(),
      conversationRemoteId: conversationRemoteId,
      chatRemoteId: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanAccount', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        newerThanItem:
            await createTestAccount(seed: "seed5", remoteId: "remoteId5"),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 0);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 0);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 1);
    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId7"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery olderThanItem', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        olderThanItem:
            await createTestAccount(seed: "seed5", remoteId: "remoteId5"),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);
    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanAccount & newerThanAccount', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        olderThanItem:
            await createTestAccount(seed: "seed5", remoteId: "remoteId5"),
        newerThanItem:
            await createTestAccount(seed: "seed2", remoteId: "remoteId2"),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );

    expect((await query.get()).length, 0);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );

    expect((await query.get()).length, 0);
    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed4"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed5"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed6"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    var account2 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var account1 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var account3 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get())
        .toDbAccountList(dao: accountRepository.dao)
        .toDbAccountWrapperList();

    expect(actualList.length, 3);

    expectDbAccount(actualList[0], account1);
    expectDbAccount(actualList[1], account2);
    expectDbAccount(actualList[2], account3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdDesc,
    );

    var account2 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var account1 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var account3 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get())
        .toDbAccountList(dao: accountRepository.dao)
        .toDbAccountWrapperList();
    expect(actualList.length, 3);

    expectDbAccount(actualList[0], account3);
    expectDbAccount(actualList[1], account2);
    expectDbAccount(actualList[2], account1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdDesc,
    );

    var account2 = await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    await insertDbAccount(
      accountRepository,
      (await createTestDbAccount(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get())
        .toDbAccountList(dao: accountRepository.dao)
        .toDbAccountWrapperList();
    expect(actualList.length, 1);

    expectDbAccount(actualList[0], account2);
  });

  test('upsertRemoteAccount conversationRemoteId', () async {
    var conversationRemoteId = "conversationRemoteId123";

    expect(await accountRepository.countAll(), 0);

    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: conversationRemoteId,
      chatRemoteId: null,
    );

    var conversation = await createTestConversation(
      seed: "seed1",
      remoteId: conversationRemoteId,
    );

    expect(await accountRepository.countAll(), 1);
    expect(
      (await accountRepository.getAccounts(
        pagination: null,
        filters: null,
      ))
          .length,
      1,
    );
    expect(
      (await accountRepository.conversationAccountsDao.getAll().get()).length,
      1,
    );

    expect(
      (await accountRepository.getAccounts(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
      ))
          .length,
      1,
    );

    var accounts = (await accountRepository.getConversationAccounts(
      conversation: conversation,
    ));
    expect(accounts.length, 1);

    await accountRepository.upsertRemoteAccount(
      DbAccountWrapper(dbAccount: dbAccount1).toPleromaAccount(),
      conversationRemoteId: conversationRemoteId,
      chatRemoteId: null,
    );
    expect(await accountRepository.countAll(), 1);
    expect(
      (await accountRepository.getAccounts(
        pagination: null,
        filters: null,
      ))
          .length,
      1,
    );
    expect(
      (await accountRepository.getConversationAccounts(
        conversation: await createTestConversation(
          seed: "seed2",
          remoteId: conversationRemoteId,
        ),
      ))
          .length,
      1,
    );
  });
}
