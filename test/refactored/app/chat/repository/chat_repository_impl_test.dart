import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/chat_model_adapter.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/chat/message/repository/chat_message_repository_impl.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository_impl.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../account/database/account_database_model_helper.dart';
import '../chat_model_helper.dart';
import '../database/chat_database_model_helper.dart';
import '../message/database/chat_message_database_model_helper.dart';
import 'chat_repository_model_helper.dart';

void main() {
  AppDatabase database;
  ChatRepository chatRepository;
  AccountRepository accountRepository;
  ChatMessageRepository chatMessageRepository;

  DbChatMessagePopulated dbChatMessagePopulated;
  DbChatMessage dbChatMessage;

  DbChat dbChat;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = ChatMessageRepository(
        appDatabase: database, accountRepository: accountRepository);
    chatRepository = ChatRepository(
        appDatabase: database,
        chatMessageRepository: chatMessageRepository,
        accountRepository: accountRepository);

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbChat = await createTestDbChat(seed: "seed4");

    dbChatMessage = await createTestDbChatMessage(
        seed: "seed3", dbAccount: dbAccount, chatRemoteId: dbChat.remoteId);

    dbChatMessagePopulated = await createTestDbChatMessagePopulated(
        dbChatMessage, accountRepository);

    dbChatMessagePopulated = DbChatMessagePopulated(
        dbChatMessage: dbChatMessage, dbAccount: dbAccount);

    await chatMessageRepository.insert(dbChatMessage);
  });

  tearDown(() async {
    chatRepository.dispose();
    chatMessageRepository.dispose();
    accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await chatRepository.insert(dbChat);
    assert(id != null, true);
    expectDbChat(await chatRepository.findById(id), dbChat);
  });

  test('upsertAll', () async {
    var dbChat1 =
        (await createTestDbChat(seed: "seed5")).copyWith(remoteId: "remoteId1");
    // same remote id
    var dbChat2 =
        (await createTestDbChat(seed: "seed6")).copyWith(remoteId: "remoteId1");

    await chatRepository.upsertAll([dbChat1]);

    expect((await chatRepository.getAll()).length, 1);

    await chatRepository.upsertAll([dbChat2]);
    expect((await chatRepository.getAll()).length, 1);

    expectDbChat((await chatRepository.getAll()).first, dbChat2);
  });

  test('updateById', () async {
    var id = await chatRepository.insert(dbChat);
    assert(id != null, true);

    await chatRepository.updateById(
        id, dbChat.copyWith(remoteId: "newRemoteId"));

    expect((await chatRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('updateLocalChatByRemoteChat', () async {
    var id =
        await chatRepository.insert(dbChat.copyWith(remoteId: "oldRemoteId"));
    assert(id != null, true);

    var oldLocalChat = DbChatWrapper(dbChat.copyWith(id: id));

    var newRemoteId = "newRemoteId";
    var newAcct = "newAcct";
    var newContent = "newContent";
    var newRemoteChat = mapLocalChatToRemoteChat(
        DbChatWrapper(dbChat.copyWith(id: id, remoteId: newRemoteId)),
        lastChatMessage: DbChatMessagePopulatedWrapper(DbChatMessagePopulated(
            dbChatMessage: dbChatMessage.copyWith(content: newContent),
            dbAccount: dbAccount.copyWith(acct: newAcct))),
        accounts: [DbAccountWrapper(dbAccount.copyWith(acct: newAcct))]);
    await chatRepository.updateLocalChatByRemoteChat(
      oldLocalChat: oldLocalChat,
      newRemoteChat: newRemoteChat,
    );

    expect((await chatRepository.findById(id)).remoteId, newRemoteId);
    expect((await accountRepository.findByRemoteId(dbAccount.remoteId)).acct,
        newAcct);
    expect(
        (await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId))
            .content,
        newContent);
  });

  test('findByRemoteId', () async {
    await chatRepository.insert(dbChat);
    expectDbChat(await chatRepository.findByRemoteId(dbChat.remoteId), dbChat);
  });

  test('upsertRemoteChat', () async {
    expect(await chatRepository.countAll(), 0);

    await chatRepository.upsertRemoteChat(
      mapLocalChatToRemoteChat(DbChatWrapper(dbChat),
          accounts: [DbAccountWrapper(dbAccount)],
          lastChatMessage:
              DbChatMessagePopulatedWrapper(dbChatMessagePopulated)),
    );

    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(await chatRepository.findByRemoteId(dbChat.remoteId), dbChat);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);

    // item with same id updated

    await chatRepository.upsertRemoteChat(
      mapLocalChatToRemoteChat(DbChatWrapper(dbChat),
          accounts: [DbAccountWrapper(dbAccount)],
          lastChatMessage:
              DbChatMessagePopulatedWrapper(dbChatMessagePopulated)),
    );
    expect(await chatRepository.countAll(), 1);
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(await chatRepository.findByRemoteId(dbChat.remoteId), dbChat);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);
  });

  test('upsertRemoteChates', () async {
    expect(await chatRepository.countAll(), 0);
    await chatRepository.upsertRemoteChats([
      mapLocalChatToRemoteChat(DbChatWrapper(dbChat),
          accounts: [DbAccountWrapper(dbAccount)],
          lastChatMessage:
              DbChatMessagePopulatedWrapper(dbChatMessagePopulated)),
    ]);

    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(await chatRepository.findByRemoteId(dbChat.remoteId), dbChat);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);

    await chatRepository.upsertRemoteChats([
      mapLocalChatToRemoteChat(DbChatWrapper(dbChat),
          accounts: [DbAccountWrapper(dbAccount)],
          lastChatMessage:
              DbChatMessagePopulatedWrapper(dbChatMessagePopulated)),
    ]);
    // update item with same id
    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(await chatRepository.findByRemoteId(dbChat.remoteId), dbChat);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);
  });

  test('createQuery empty', () async {
    var query = chatRepository.createQuery(
        olderThan: null,
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    expect((await query.get()).length, 0);

    await chatRepository
        .insert((await createTestDbChat(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await chatRepository
        .insert((await createTestDbChat(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await chatRepository
        .insert((await createTestDbChat(seed: "seed3")).copyWith());

    expect((await query.get()).length, 3);
  });

  test('createQuery newerThan', () async {
    var query = chatRepository.createQuery(
      newerThan: await createTestChat(
          seed: "remoteId5",
          remoteId: "remoteId5"
              "",
          updatedAt: DateTime(2005)),
      limit: null,
      offset: null,
      orderingTermData: ChatOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: ChatOrderByType.updatedAt),
      olderThan: null,
    );

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)));

    expect((await query.get()).length, 0);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)));

    expect((await query.get()).length, 0);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)));

    expect((await query.get()).length, 1);
    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId7", updatedAt: DateTime(2007)));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan', () async {
    var query = chatRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: ChatOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatOrderByType.updatedAt),
        olderThan: await createTestChat(
            seed: "remoteId5",
            remoteId: "remoteId5",
            updatedAt: DateTime(2005)));

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId3", updatedAt: DateTime(2003)));

    expect((await query.get()).length, 1);
    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)));

    expect((await query.get()).length, 2);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)));

    expect((await query.get()).length, 2);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = chatRepository.createQuery(
        newerThan: await createTestChat(
            seed: "remoteId2",
            remoteId: "remoteId2",
            updatedAt: DateTime(2002)),
        limit: null,
        offset: null,
        orderingTermData: ChatOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ChatOrderByType.updatedAt),
        olderThan: await createTestChat(
            seed: "remoteId5",
            remoteId: "remoteId5",
            updatedAt: DateTime(2005)));

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId1", updatedAt: DateTime(2001)));

    expect((await query.get()).length, 0);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId2", updatedAt: DateTime(2002)));

    expect((await query.get()).length, 0);
    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed3"))
            .copyWith(remoteId: "remoteId3", updatedAt: DateTime(2003)));

    expect((await query.get()).length, 1);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed4"))
            .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)));

    expect((await query.get()).length, 2);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed5"))
            .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)));

    expect((await query.get()).length, 2);

    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed6"))
            .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = chatRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: ChatOrderingTermData(
            orderByType: ChatOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        olderThan: null);

    var chat2 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var chat1 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var chat3 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbChats = await query.get();
    var actualList = dbChats
        .map((dbChat) => chatRepository.mapDataClassToItem(dbChat))
        .toList();
    expect(actualList.length, 3);

    expectDbChat(actualList[0], chat1);
    expectDbChat(actualList[1], chat2);
    expectDbChat(actualList[2], chat3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = chatRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: ChatOrderingTermData(
            orderByType: ChatOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThan: null);

    var chat2 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var chat1 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var chat3 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbChats = await query.get();
    var actualList = dbChats
        .map((dbChat) => chatRepository.mapDataClassToItem(dbChat))
        .toList();
    expect(actualList.length, 3);

    expectDbChat(actualList[0], chat3);
    expectDbChat(actualList[1], chat2);
    expectDbChat(actualList[2], chat1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = chatRepository.createQuery(
        newerThan: null,
        limit: 1,
        offset: 1,
        orderingTermData: ChatOrderingTermData(
            orderByType: ChatOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThan: null);

    var chat2 = await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    await insertDbChat(
        chatRepository,
        (await createTestDbChat(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbChats = await query.get();
    var actualList = dbChats
        .map((dbChat) => chatRepository.mapDataClassToItem(dbChat))
        .toList();
    expect(actualList.length, 1);

    expectDbChat(actualList[0], chat2);
  });
}
