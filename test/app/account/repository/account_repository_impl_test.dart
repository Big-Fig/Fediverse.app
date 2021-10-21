// ignore_for_file: prefer_const_constructors

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import '../../conversation/conversation_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';
import '../account_test_helper.dart';
import '../database/account_database_test_helper.dart';
import 'account_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
//  initTestLog();

  late AppDatabase database;
  late AccountRepository accountRepository;

  late DbAccount dbAccount1;
  late DbAccount dbAccount2;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
    accountRepository = AccountRepository(appDatabase: database);
    dbAccount1 =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1');
    dbAccount2 =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2');
  });

  tearDown(() async {
    await accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    assert(id > 0, true);
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByDbIdInAppType(id),
      dbAccount1,
    );
  });

  test('updateById', () async {
    var id = await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    assert(id > 0, true);

    await accountRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbAccount2,
      batchTransaction: null,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByDbIdInAppType(id),
      dbAccount2,
    );
  });

  test('updateLocalAccountByRemoteAccount', () async {
    var id = await accountRepository.insertInDbType(
      dbAccount1.copyWith(
        acct: 'oldAcct',
      ),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalAccount = DbAccountPopulatedWrapper(
      dbAccountPopulated: DbAccountPopulated(
        dbAccount: dbAccount1.copyWith(id: id),
      ),
    );
    var newAcct = 'newAcct';
    var newRemoteAccount = DbAccountPopulatedWrapper(
      dbAccountPopulated: DbAccountPopulated(
        dbAccount: dbAccount1.copyWith(
          id: id,
          acct: newAcct,
        ),
      ),
    ).toUnifediApiAccount();
    await accountRepository.updateAppTypeByRemoteType(
      appItem: oldLocalAccount,
      remoteItem: newRemoteAccount,
      batchTransaction: null,
    );

    expect((await accountRepository.findByDbIdInAppType(id))!.acct, newAcct);
  });

  test('findByRemoteId', () async {
    var id = await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    assert(id > 0, true);

    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount1.remoteId),
      dbAccount1,
    );
  });

  test('upsertRemoteAccount', () async {
    expect(await accountRepository.countAll(), 0);

    await accountRepository.upsertInRemoteType(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
    );

    expect(await accountRepository.countAll(), 1);
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount1.remoteId),
      dbAccount1,
    );

    // item with same id updated
    await accountRepository.upsertInRemoteType(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
    );
    expect(await accountRepository.countAll(), 1);
  });

  test('upsertRemoteAccounts', () async {
    expect(await accountRepository.countAll(), 0);
    await accountRepository.upsertAllInRemoteType(
      [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    expect(await accountRepository.countAll(), 1);
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount1.remoteId),
      dbAccount1,
    );

    await accountRepository.upsertAllInRemoteType(
      [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    // update item with same id
    expect(await accountRepository.countAll(), 2);
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount1.remoteId),
      dbAccount1,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount2.remoteId),
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

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 1);

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 2);

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery searchQuery', () async {
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters.only(
        searchQuery: 'qu',
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(acct: 'qu'),
      mode: null,
    );

    expect((await query.get()).length, 1);

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(acct: 'qur'),
      mode: null,
    );

    expect((await query.get()).length, 2);

    await accountRepository.insertInDbType(
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(acct: 'q'),
      mode: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInStatusFavouritedBy', () async {
    await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    await accountRepository.insertInDbType(
      dbAccount2,
      mode: null,
    );

    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seedStatus',
      dbAccount: dbAccount1,
    );
    var status = await StatusDatabaseMockHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters.only(
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
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusFavouritedBy(
      statusRemoteId: dbStatus.remoteId,
      favouritedByAccounts: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusFavouritedBy(
      statusRemoteId: dbStatus.remoteId,
      favouritedByAccounts: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInStatusRebloggedBy', () async {
    await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    await accountRepository.insertInDbType(
      dbAccount2,
      mode: null,
    );

    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seedStatus',
      dbAccount: dbAccount1,
    );
    var status = await StatusDatabaseMockHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );
    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters.only(
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
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    await accountRepository.updateStatusRebloggedBy(
      statusRemoteId: dbStatus.remoteId,
      rebloggedByAccounts: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);

    await accountRepository.updateStatusRebloggedBy(
      statusRemoteId: dbStatus.remoteId,
      rebloggedByAccounts: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyInAccountFollowers', () async {
    await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    await accountRepository.insertInDbType(
      dbAccount2,
      mode: null,
    );

    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters.only(
        onlyInAccountFollowers: DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.addAccountFollowers(
      accountRemoteId: dbAccount1.remoteId,
      followers: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);

    await accountRepository.addAccountFollowers(
      accountRemoteId: dbAccount1.remoteId,
      followers: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInAccountFollowing', () async {
    await accountRepository.insertInDbType(
      dbAccount1,
      mode: null,
    );
    await accountRepository.insertInDbType(
      dbAccount2,
      mode: null,
    );

    var query = accountRepository.createQuery(
      filters: AccountRepositoryFilters.only(
        onlyInAccountFollowing: DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await accountRepository.addAccountFollowings(
      accountRemoteId: dbAccount1.remoteId,
      followings: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);

    await accountRepository.addAccountFollowings(
      accountRemoteId: dbAccount1.remoteId,
      followings: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount1,
          ),
        ).toUnifediApiAccount(),
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount2,
          ),
        ).toUnifediApiAccount(),
      ],
      batchTransaction: null,
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInConversation', () async {
    var conversationRemoteId = 'conversationRemoteId';

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
      filters: AccountRepositoryFilters.only(
        onlyInConversation: conversation,
      ),
      pagination: null,
      orderingTermData: null,
    );

    // not associated with conversation
    await accountRepository.upsertInRemoteType(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
    );
    expect((await query.get()).length, 0);

    // associated with conversation
    await accountRepository.upsertConversationRemoteAccount(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);

    // duplicated
    await accountRepository.upsertConversationRemoteAccount(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    // additional account associated with conversation
    await accountRepository.upsertConversationRemoteAccount(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount2,
        ),
      ).toUnifediApiAccount(),
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanAccount', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        newerThanItem: await AccountMockHelper.createTestAccount(
          seed: 'seed5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId4'),
    );

    expect((await query.get()).length, 0);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId5'),
    );

    expect((await query.get()).length, 0);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId6'),
    );

    expect((await query.get()).length, 1);
    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId7'),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery olderThanItem', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        olderThanItem: await AccountMockHelper.createTestAccount(
          seed: 'seed5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId3'),
    );

    expect((await query.get()).length, 1);
    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId4'),
    );

    expect((await query.get()).length, 2);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId5'),
    );

    expect((await query.get()).length, 2);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId6'),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanAccount & newerThanAccount', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IAccount>(
        olderThanItem: await AccountMockHelper.createTestAccount(
          seed: 'seed5',
          remoteId: 'remoteId5',
        ),
        newerThanItem: await AccountMockHelper.createTestAccount(
          seed: 'seed2',
          remoteId: 'remoteId2',
        ),
      ),
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(
        remoteId: 'remoteId1',
      ),
    );

    expect((await query.get()).length, 0);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );

    expect((await query.get()).length, 0);
    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    expect((await query.get()).length, 1);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed4'))
          .copyWith(remoteId: 'remoteId4'),
    );

    expect((await query.get()).length, 2);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed5'))
          .copyWith(remoteId: 'remoteId5'),
    );

    expect((await query.get()).length, 2);

    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed6'))
          .copyWith(remoteId: 'remoteId6'),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdAsc,
    );

    var account2 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    var account1 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    var account3 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    AccountDatabaseMockHelper.expectDbAccount(actualList[0], account1);
    AccountDatabaseMockHelper.expectDbAccount(actualList[1], account2);
    AccountDatabaseMockHelper.expectDbAccount(actualList[2], account3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = accountRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: AccountRepositoryOrderingTermData.remoteIdDesc,
    );

    var account2 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    var account1 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    var account3 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 3);

    AccountDatabaseMockHelper.expectDbAccount(actualList[0], account3);
    AccountDatabaseMockHelper.expectDbAccount(actualList[1], account2);
    AccountDatabaseMockHelper.expectDbAccount(actualList[2], account1);
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

    var account2 = await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    await AccountRepositoryMockHelper.insertDbAccount(
      accountRepository,
      (await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 1);

    AccountDatabaseMockHelper.expectDbAccount(actualList[0], account2);
  });

  test('upsertRemoteAccount conversationRemoteId', () async {
    var conversationRemoteId = 'conversationRemoteId123';

    expect(await accountRepository.countAll(), 0);

    await accountRepository.upsertConversationRemoteAccount(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );

    var conversation = await ConversationMockHelper.createTestConversation(
      seed: 'seed1',
      remoteId: conversationRemoteId,
    );

    expect(await accountRepository.countAll(), 1);
    expect(
      (await accountRepository.findAllInAppType(
        pagination: null,
        filters: null,
        orderingTerms: null,
      ))
          .length,
      1,
    );
    expect(
      (await accountRepository.conversationAccountsDao.getAll()).length,
      1,
    );

    expect(
      (await accountRepository.findAllInAppType(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
        orderingTerms: null,
      ))
          .length,
      1,
    );

    var accounts = await accountRepository.getConversationAccounts(
      conversation: conversation,
    );
    expect(accounts.length, 1);

    await accountRepository.upsertConversationRemoteAccount(
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount1,
        ),
      ).toUnifediApiAccount(),
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );
    expect(await accountRepository.countAll(), 1);
    expect(
      (await accountRepository.getAllInAppType()).length,
      1,
    );
    expect(
      (await accountRepository.getConversationAccounts(
        conversation: await ConversationMockHelper.createTestConversation(
          seed: 'seed2',
          remoteId: conversationRemoteId,
        ),
      ))
          .length,
      1,
    );
  });

  test('insertInDbTypeBatch duplicated', () async {
    expect(await accountRepository.countAll(), 0);

    var dbItem1 =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1');
    var dbItem1copy =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1');

    await accountRepository.batch((batch) {
      accountRepository.insertInDbTypeBatch(
        dbItem1,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
      // ignore: cascade_invocations
      accountRepository.insertInDbTypeBatch(
        dbItem1copy,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
    });

    expect(await accountRepository.countAll(), 1);
  });

  test('insertInRemoteTypeBatch duplicated', () async {
    expect(await accountRepository.countAll(), 0);

    var account1 = await AccountMockHelper.createTestAccount(seed: 'seed1');
    var account1Copy = await AccountMockHelper.createTestAccount(seed: 'seed1');

    var remoteAccount1 = account1.toUnifediApiAccount();
    var remoteAccount1Copy = account1Copy.toUnifediApiAccount();

    await accountRepository.batch((batch) {
      accountRepository
        ..insertInRemoteTypeBatch(
          remoteAccount1,
          mode: InsertMode.insertOrReplace,
          batchTransaction: batch,
        )
        ..insertInRemoteTypeBatch(
          remoteAccount1Copy,
          mode: InsertMode.insertOrReplace,
          batchTransaction: batch,
        );
    });

    expect(await accountRepository.countAll(), 1);
  });
  test('insertInRemoteTypeBatch duplicated', () async {
    expect(await accountRepository.countAll(), 0);

    var account1 = await AccountMockHelper.createTestAccount(seed: 'seed1');
    var account1Copy = await AccountMockHelper.createTestAccount(seed: 'seed1');

    var remoteAccount1 = account1.toUnifediApiAccount();
    var remoteAccount1Copy = account1Copy.toUnifediApiAccount();

    await accountRepository.insertAllInRemoteType(
      [remoteAccount1, remoteAccount1Copy],
      mode: InsertMode.insertOrReplace,
      batchTransaction: null,
    );

    expect(await accountRepository.countAll(), 1);
  });
}
