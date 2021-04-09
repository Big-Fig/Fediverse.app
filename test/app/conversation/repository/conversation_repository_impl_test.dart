import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model_adapter.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_dao.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../conversation_model_helper.dart';
import '../database/conversation_database_model_helper.dart';
import 'conversation_repository_model_helper.dart';

void main() {
  late AppDatabase database;
  late ConversationChatRepository conversationRepository;
  late AccountRepository accountRepository;
  late StatusRepository statusRepository;

  late DbStatusPopulated dbStatusPopulated;
  late DbStatus dbStatus;

  late DbConversation dbConversation;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    conversationRepository = ConversationChatRepository(
      appDatabase: database,
      statusRepository: statusRepository,
      accountRepository: accountRepository,
    );

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insertInDbType(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    );

    dbStatusPopulated = await createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );

    var reblogDbAccount = await createTestDbAccount(seed: "seed11");
    await accountRepository.insertInDbType(reblogDbAccount);
    var reblogDbStatus = await createTestDbStatus(
      seed: "seed33",
      dbAccount: reblogDbAccount,
    );
    await statusRepository.insertInDbType(reblogDbStatus);

    dbStatus = dbStatus.copyWith(
      reblogStatusRemoteId: reblogDbStatus.remoteId,
    );

    dbStatusPopulated = DbStatusPopulated(
      dbStatus: dbStatus,
      dbAccount: dbAccount,
      reblogDbStatus: reblogDbStatus,
      reblogDbStatusAccount: reblogDbAccount,
      replyReblogDbStatus: null,
      replyDbStatusAccount: null,
      replyDbStatus: null,
      replyReblogDbStatusAccount: null,
    );

    await statusRepository.insertInDbType(dbStatus);

    dbConversation = await createTestDbConversation(seed: "seed4");
  });

  tearDown(() async {
    await conversationRepository.dispose();
    await statusRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await conversationRepository.insertInDbType(dbConversation);
    assert(id > 0, true);
    expectDbConversation(
      await conversationRepository.findByDbIdInAppType(id),
      dbConversation,
    );
  });

  test('upsertAll', () async {
    var dbConversation1 = (await createTestDbConversation(seed: "seed5"))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbConversation2 = (await createTestDbConversation(seed: "seed6"))
        .copyWith(remoteId: "remoteId1");

    await conversationRepository.upsertAllInDbType([dbConversation1]);

    expect((await conversationRepository.getAllInAppType()).length, 1);

    await conversationRepository.upsertAllInDbType([dbConversation2]);
    expect((await conversationRepository.getAllInAppType()).length, 1);

    expectDbConversation(
      (await conversationRepository.getAllInAppType()).first,
      dbConversation2,
    );
  });

  test('updateById', () async {
    var id = await conversationRepository.insertInDbType(dbConversation);
    assert(id > 0, true);

    await conversationRepository.updateByDbIdInDbType(
      dbId:id,
      dbItem:dbConversation.copyWith(remoteId: "newRemoteId"),
    );

    expect(
        (await conversationRepository.findByDbIdInAppType(id))!.remoteId, "newRemoteId");
  });

  test('updateLocalConversationByRemoteConversation', () async {
    var id = await conversationRepository
        .insertInDbType(dbConversation.copyWith(remoteId: "oldRemoteId"));
    assert(id > 0, true);

    var oldLocalConversation = DbConversationChatPopulatedWrapper(
      dbConversationPopulated: DbConversationPopulated(
        dbConversation: dbConversation.copyWith(
          id: id,
        ),
      ),
    );

    var newRemoteId = "newRemoteId";
    var newAcct = "newAcct";
    var newContent = "newContent";
    var newRemoteConversation = DbConversationChatPopulatedWrapper(
      dbConversationPopulated: DbConversationPopulated(
        dbConversation: dbConversation.copyWith(
          id: id,
          remoteId: newRemoteId,
        ),
      ),
    ).toPleromaConversation(
      lastStatus: DbStatusPopulatedWrapper(
        dbStatusPopulated: DbStatusPopulated(
          dbStatus: dbStatus.copyWith(content: newContent),
          dbAccount: dbAccount.copyWith(acct: newAcct),
          reblogDbStatus: null,
          reblogDbStatusAccount: null,
          replyReblogDbStatus: null,
          replyDbStatusAccount: null,
          replyReblogDbStatusAccount: null,
          replyDbStatus: null,
        ),
      ),
      accounts: [
        DbAccountWrapper(
          dbAccount: dbAccount.copyWith(
            acct: newAcct,
          ),
        ),
      ],
    );
    await conversationRepository.updateLocalConversationByRemoteConversation(
      oldLocalConversation: oldLocalConversation,
      newRemoteConversation: newRemoteConversation,
    );

    expect((await conversationRepository.findByDbIdInAppType(id))!.remoteId, newRemoteId);
    expect(
      (await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId))!.acct,
      newAcct,
    );
    expect(
      (await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId))?.content,
      newContent,
    );
  });

  test('findByRemoteId', () async {
    await conversationRepository.insertInDbType(dbConversation);
    expectDbConversation(
      await conversationRepository.findByRemoteIdInAppType(dbConversation.remoteId),
      dbConversation,
    );
  });

  test('upsertRemoteConversation', () async {
    expect(await conversationRepository.countAll(), 0);

    await conversationRepository.upsertRemoteConversation(
      DbConversationChatPopulatedWrapper(
              dbConversationPopulated:
                  DbConversationPopulated(dbConversation: dbConversation))
          .toPleromaConversation(
        accounts: [
          DbAccountWrapper(
            dbAccount: dbAccount,
          ),
        ],
        lastStatus: DbStatusPopulatedWrapper(
          dbStatusPopulated: dbStatusPopulated,
        ),
      ),
    );

    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
      await conversationRepository.findByRemoteIdInAppType(dbConversation.remoteId),
      dbConversation,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );

    // item with same id updated

    await conversationRepository.upsertRemoteConversation(
      DbConversationChatPopulatedWrapper(
        dbConversationPopulated: DbConversationPopulated(
          dbConversation: dbConversation,
        ),
      ).toPleromaConversation(
        accounts: [
          DbAccountWrapper(
            dbAccount: dbAccount,
          ),
        ],
        lastStatus: DbStatusPopulatedWrapper(
          dbStatusPopulated: dbStatusPopulated,
        ),
      ),
    );
    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
      await conversationRepository.findByRemoteIdInAppType(dbConversation.remoteId),
      dbConversation,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('upsertRemoteConversations', () async {
    expect(await conversationRepository.countAll(), 0);
    await conversationRepository.upsertRemoteConversations(
      [
        DbConversationChatPopulatedWrapper(
          dbConversationPopulated: DbConversationPopulated(
            dbConversation: dbConversation,
          ),
        ).toPleromaConversation(
          accounts: [
            DbAccountWrapper(
              dbAccount: dbAccount,
            ),
          ],
          lastStatus: DbStatusPopulatedWrapper(
            dbStatusPopulated: dbStatusPopulated,
          ),
        ),
      ],
    );

    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
      await conversationRepository.findByRemoteIdInAppType(dbConversation.remoteId),
      dbConversation,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );

    await conversationRepository.upsertRemoteConversations(
      [
        DbConversationChatPopulatedWrapper(
          dbConversationPopulated: DbConversationPopulated(
            dbConversation: dbConversation,
          ),
        ).toPleromaConversation(
          accounts: [
            DbAccountWrapper(
              dbAccount: dbAccount,
            ),
          ],
          lastStatus: DbStatusPopulatedWrapper(
            dbStatusPopulated: dbStatusPopulated,
          ),
        ),
      ],
    );
    // update item with same id
    expect(await conversationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbConversation(
      await conversationRepository.findByRemoteIdInAppType(dbConversation.remoteId),
      dbConversation,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('createQuery empty', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
      withLastMessage: false,
    );

    expect((await query.get()).length, 0);

    await conversationRepository
        .insertInDbType((await createTestDbConversation(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await conversationRepository
        .insertInDbType((await createTestDbConversation(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await conversationRepository
        .insertInDbType((await createTestDbConversation(seed: "seed3")).copyWith());

    expect((await query.get()).length, 3);
  });

//  test('createQuery withAccount', () async {
//    var query = conversationRepository.createQuery(
//        olderThan: null,
//        newerThan: null,
//        limit: null,
//        offset: null,
//        orderingTermData: null,
//        withAccount: DbAccountWrapper(dbAccount: dbAccount));
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
//            accounts: [DbAccountWrapper(dbAccount: dbAccount)]));
//
//    expect((await query.get()).length, 1);
//  });

  test(
    'createQuery newerThan',
    () async {
      var query = conversationRepository.createQuery(
        filters: null,
        pagination: RepositoryPagination<IConversationChat>(
          newerThanItem: await createTestConversation(
            seed: "remoteId5",
            remoteId: "remoteId5",
          ),
        ),
        orderingTermData: ConversationChatOrderingTermData.updatedAtDesc,
        withLastMessage: false,
      );

      await insertDbConversation(
        conversationRepository,
        (await createTestDbConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"),
      );

      expect((await query.get()).length, 0);

      await insertDbConversation(
        conversationRepository,
        (await createTestDbConversation(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"),
      );

      expect((await query.get()).length, 0);

      await insertDbConversation(
        conversationRepository,
        (await createTestDbConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"),
      );

      expect((await query.get()).length, 1);
      await insertDbConversation(
        conversationRepository,
        (await createTestDbConversation(seed: "seed1"))
            .copyWith(remoteId: "remoteId7"),
      );

      expect((await query.get()).length, 2);
    },
  );

  test('createQuery notNewerThan', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IConversationChat>(
        olderThanItem: await createTestConversation(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: ConversationChatOrderingTermData.updatedAtDesc,
      withLastMessage: false,
    );

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);
    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed1"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IConversationChat>(
        newerThanItem: await createTestConversation(
          seed: "remoteId2",
          remoteId: "remoteId2",
        ),
        olderThanItem: await createTestConversation(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: ConversationChatOrderingTermData.updatedAtDesc,
      withLastMessage: false,
    );

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );

    expect((await query.get()).length, 0);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );

    expect((await query.get()).length, 0);
    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed4"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed5"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed6"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: ConversationChatOrderingTermData.remoteIdAsc,
      withLastMessage: false,
    );

    var conversation2 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var conversation1 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var conversation3 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var dbConversations = (await query.get()).toDbConversationChatPopulatedList(
      dao: conversationRepository.dao,
    );
    var actualList = dbConversations.toDbConversationChatPopulatedWrapperList();
    expect(actualList.length, 3);

    expectDbConversation(actualList[0], conversation1);
    expectDbConversation(actualList[1], conversation2);
    expectDbConversation(actualList[2], conversation3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: ConversationChatOrderingTermData.remoteIdDesc,
      withLastMessage: false,
    );

    var conversation2 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var conversation1 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var conversation3 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var dbConversations = (await query.get()).toDbConversationChatPopulatedList(
      dao: conversationRepository.dao,
    );
    var actualList = dbConversations.toDbConversationChatPopulatedWrapperList();
    expect(actualList.length, 3);

    expectDbConversation(actualList[0], conversation3);
    expectDbConversation(actualList[1], conversation2);
    expectDbConversation(actualList[2], conversation1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = conversationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IConversationChat>(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: ConversationChatOrderingTermData.remoteIdDesc,
      withLastMessage: false,
    );

    var conversation2 = await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    await insertDbConversation(
      conversationRepository,
      (await createTestDbConversation(seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var dbConversations = (await query.get()).toDbConversationChatPopulatedList(
      dao: conversationRepository.dao,
    );
    var actualList = dbConversations.toDbConversationChatPopulatedWrapperList();
    expect(actualList.length, 1);

    expectDbConversation(actualList[0], conversation2);
  });
}
