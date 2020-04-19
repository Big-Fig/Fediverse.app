import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model_adapter.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../account/account_repository_model_helper.dart';
import '../status/status_repository_model_helper.dart';
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

    dbAccount = createTestAccount(seed: "seed1");
    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestStatus(seed: "seed3", dbAccount: dbAccount);

    dbStatusPopulated =
        await createTestStatusPopulated(dbStatus, accountRepository);

    var reblogDbAccount = createTestAccount(seed: "seed11");
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
    throw "Not implemented";
//    var id = await conversationRepository
//        .insert(dbConversation.copyWith(remoteId: "oldRemoteId"));
//    assert(id != null, true);
//
//    var oldLocalConversation = DbConversationPopulatedWrapper(
//        DbConversationPopulated(
//            conversation: dbConversation.copyWith(id: id),
//            account: dbAccount,
//            statusPopulated: dbStatusPopulated));
//    var newContent = "newContent";
//    var newAcct = "newAcct";
//    var newType = MastodonConversationType.reblog;
//    var newRemoteConversation = mapLocalConversationToRemoteConversation(
//        DbConversationPopulatedWrapper(DbConversationPopulated(
//            conversation: dbConversation.copyWith(id: id),
//            account: dbAccount.copyWith(acct: newAcct),
//            statusPopulated: DbStatusPopulated(
//              status: dbStatus.copyWith(content: newContent),
//              account: dbAccount.copyWith(acct: newAcct),
//              rebloggedStatusAccount: null,
//              rebloggedStatus: null,
//            ))));
//    await conversationRepository.updateLocalConversationByRemoteConversation(
//      oldLocalConversation: oldLocalConversation,
//      newRemoteConversation: newRemoteConversation,
//      unread: true,
//    );
//
//    expect(
//        (await conversationRepository.findById(id)).status.content, newContent);
//    expect((await conversationRepository.findById(id)).type, newType);
//    expect((await conversationRepository.findById(id)).account.acct, newAcct);
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
}
