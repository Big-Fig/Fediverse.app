import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model_adapter.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_impl.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../account/repository/account_repository_model_helper.dart';
import '../../status/repository/status_repository_model_helper.dart';
import 'conversation_repository_model_helper.dart';

void main() {
  AppDatabase database;
  ConversationRepository conversationRepository;
  AccountRepository accountRepository;
  StatusRepository statusRepository;

  DbStatusPopulated dbStatusPopulated;
  DbStatus dbStatus;

  DbConversation dbConversation;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
        appDatabase: database, accountRepository: accountRepository);
    conversationRepository = ConversationRepository(
        appDatabase: database,
        statusRepository: statusRepository,
        accountRepository: accountRepository);

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestStatus(seed: "seed3", dbAccount: dbAccount);

    dbStatusPopulated =
        await createTestStatusPopulated(dbStatus, accountRepository);

    var reblogDbAccount = await createTestDbAccount(seed: "seed11");
    accountRepository.insert(reblogDbAccount);
    var reblogDbStatus =
        await createTestStatus(seed: "seed33", dbAccount: reblogDbAccount);
    await statusRepository.insert(reblogDbStatus);

    dbStatus = dbStatus.copyWith(reblogStatusRemoteId: reblogDbStatus.remoteId);

    dbStatusPopulated = DbStatusPopulated(
        status: dbStatus,
        account: dbAccount,
        rebloggedStatus: reblogDbStatus,
        rebloggedStatusAccount: reblogDbAccount);

    await statusRepository.insert(dbStatus);

    dbConversation = await createTestConversation(seed: "seed4");
  });

  tearDown(() async {
    conversationRepository.dispose();
    statusRepository.dispose();
    accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await conversationRepository.insert(dbConversation);
    assert(id != null, true);
    expectDbConversation(
        await conversationRepository.findById(id), dbConversation);
  });

  test('upsertAll', () async {
    var dbConversation1 = (await createTestConversation(seed: "seed5"))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbConversation2 = (await createTestConversation(seed: "seed6"))
        .copyWith(remoteId: "remoteId1");

    await conversationRepository.upsertAll([dbConversation1]);

    expect((await conversationRepository.getAll()).length, 1);

    await conversationRepository.upsertAll([dbConversation2]);
    expect((await conversationRepository.getAll()).length, 1);

    expectDbConversation(
        (await conversationRepository.getAll()).first, dbConversation2);
  });

  test('updateById', () async {
    var id = await conversationRepository.insert(dbConversation);
    assert(id != null, true);

    await conversationRepository.updateById(
        id, dbConversation.copyWith(remoteId: "newRemoteId"));

    expect((await conversationRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('updateLocalConversationByRemoteConversation', () async {
    var id = await conversationRepository
        .insert(dbConversation.copyWith(remoteId: "oldRemoteId"));
    assert(id != null, true);

    var oldLocalConversation =
        DbConversationWrapper(dbConversation.copyWith(id: id));

    var newRemoteId = "newRemoteId";
    var newAcct = "newAcct";
    var newContent = "newContent";
    var newRemoteConversation = mapLocalConversationToRemoteConversation(
        DbConversationWrapper(
            dbConversation.copyWith(id: id, remoteId: newRemoteId)),
        lastStatus: DbStatusPopulatedWrapper(DbStatusPopulated(
            status: dbStatus.copyWith(content: newContent),
            account: dbAccount.copyWith(acct: newAcct),
            rebloggedStatus: null,
            rebloggedStatusAccount: null)),
        accounts: [DbAccountWrapper(dbAccount.copyWith(acct: newAcct))]);
    await conversationRepository.updateLocalConversationByRemoteConversation(
      oldLocalConversation: oldLocalConversation,
      newRemoteConversation: newRemoteConversation,
    );

    expect((await conversationRepository.findById(id)).remoteId, newRemoteId);
    expect((await accountRepository.findByRemoteId(dbAccount.remoteId)).acct,
        newAcct);
    expect((await statusRepository.findByRemoteId(dbStatus.remoteId)).content,
        newContent);
  });

  test('findByRemoteId', () async {
    await conversationRepository.insert(dbConversation);
    expectDbConversation(
        await conversationRepository.findByRemoteId(dbConversation.remoteId),
        dbConversation);
  });

  test('upsertRemoteConversation', () async {
    expect(await conversationRepository.countAll(), 0);

    await conversationRepository.upsertRemoteConversation(
      mapLocalConversationToRemoteConversation(
          DbConversationWrapper(dbConversation),
          accounts: [DbAccountWrapper(dbAccount)],
          lastStatus: DbStatusPopulatedWrapper(dbStatusPopulated)),
    );

    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
        await conversationRepository.findByRemoteId(dbConversation.remoteId),
        dbConversation);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);

    // item with same id updated

    await conversationRepository.upsertRemoteConversation(
      mapLocalConversationToRemoteConversation(
          DbConversationWrapper(dbConversation),
          accounts: [DbAccountWrapper(dbAccount)],
          lastStatus: DbStatusPopulatedWrapper(dbStatusPopulated)),
    );
    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
        await conversationRepository.findByRemoteId(dbConversation.remoteId),
        dbConversation);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);
  });

  test('upsertRemoteConversationes', () async {
    expect(await conversationRepository.countAll(), 0);
    await conversationRepository.upsertRemoteConversations([
      mapLocalConversationToRemoteConversation(
          DbConversationWrapper(dbConversation),
          accounts: [DbAccountWrapper(dbAccount)],
          lastStatus: DbStatusPopulatedWrapper(dbStatusPopulated)),
    ]);

    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
        await conversationRepository.findByRemoteId(dbConversation.remoteId),
        dbConversation);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);

    await conversationRepository.upsertRemoteConversations([
      mapLocalConversationToRemoteConversation(
          DbConversationWrapper(dbConversation),
          accounts: [DbAccountWrapper(dbAccount)],
          lastStatus: DbStatusPopulatedWrapper(dbStatusPopulated)),
    ]);
    // update item with same id
    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
        await conversationRepository.findByRemoteId(dbConversation.remoteId),
        dbConversation);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);
  });

  test('createQuery empty', () async {
    var query = conversationRepository.createQuery(
        olderThanConversation: null,
        newerThanConversation: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await conversationRepository
        .insert((await createTestConversation(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await conversationRepository
        .insert((await createTestConversation(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await conversationRepository
        .insert((await createTestConversation(seed: "seed3")).copyWith());

    expect((await query.get()).length, 3);
  });

//  test('createQuery withAccount', () async {
//    var query = conversationRepository.createQuery(
//        olderThanConversation: null,
//        newerThanConversation: null,
//        limit: null,
//        offset: null,
//        orderingTermData: null,
//        withAccount: DbAccountWrapper(dbAccount));
//
//    expect((await query.get()).length, 0);
//
//    await conversationRepository.upsertRemoteConversation(
//        mapLocalConversationToRemoteConversation(
//            DbConversationWrapper(dbConversation),
//            lastStatus: null,
//            accounts: []));
//
//    expect((await query.get()).length, 0);
//
//    await conversationRepository.upsertRemoteConversation(
//        mapLocalConversationToRemoteConversation(
//            DbConversationWrapper(dbConversation),
//            lastStatus: null,
//            accounts: [DbAccountWrapper(dbAccount)]));
//
//    expect((await query.get()).length, 1);
//  });

  test('createQuery newerThanConversation', () async {
    var query = conversationRepository.createQuery(
      newerThanConversation: createFakeConversationWithRemoteId("remoteId5"),
      limit: null,
      offset: null,
      orderingTermData: null,
      olderThanConversation: null,
    );

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanConversation', () async {
    var query = conversationRepository.createQuery(
        newerThanConversation: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanConversation: createFakeConversationWithRemoteId("remoteId5"));

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanConversation & newerThanConversation',
      () async {
    var query = conversationRepository.createQuery(
        newerThanConversation: createFakeConversationWithRemoteId("remoteId2"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanConversation: createFakeConversationWithRemoteId("remoteId5"));

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed4"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed5"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed6"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = conversationRepository.createQuery(
        newerThanConversation: null,
        limit: null,
        offset: null,
        orderingTermData: ConversationOrderingTermData(
            orderByType: ConversationOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        olderThanConversation: null);

    var conversation2 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var conversation1 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var conversation3 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbConversations = await query.get();
    var actualList = dbConversations
        .map((dbConversation) =>
            conversationRepository.mapDataClassToItem(dbConversation))
        .toList();
    expect(actualList.length, 3);

    expectDbConversation(actualList[0], conversation1);
    expectDbConversation(actualList[1], conversation2);
    expectDbConversation(actualList[2], conversation3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = conversationRepository.createQuery(
        newerThanConversation: null,
        limit: null,
        offset: null,
        orderingTermData: ConversationOrderingTermData(
            orderByType: ConversationOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanConversation: null);

    var conversation2 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var conversation1 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var conversation3 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbConversations = await query.get();
    var actualList = dbConversations
        .map((dbConversation) =>
            conversationRepository.mapDataClassToItem(dbConversation))
        .toList();
    expect(actualList.length, 3);

    expectDbConversation(actualList[0], conversation3);
    expectDbConversation(actualList[1], conversation2);
    expectDbConversation(actualList[2], conversation1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = conversationRepository.createQuery(
        newerThanConversation: null,
        limit: 1,
        offset: 1,
        orderingTermData: ConversationOrderingTermData(
            orderByType: ConversationOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanConversation: null);

    var conversation2 = await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    await insertDbConversation(
        conversationRepository,
        (await createTestConversation(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbConversations = await query.get();
    var actualList = dbConversations
        .map((dbConversation) =>
            conversationRepository.mapDataClassToItem(dbConversation))
        .toList();
    expect(actualList.length, 1);

    expectDbConversation(actualList[0], conversation2);
  });
}
