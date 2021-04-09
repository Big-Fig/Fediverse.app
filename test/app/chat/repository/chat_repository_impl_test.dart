import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_model_helper.dart';
import '../chat_model_helper.dart';
import '../database/chat_database_model_helper.dart';
import '../message/database/chat_message_database_model_helper.dart';
import 'chat_repository_model_helper.dart';

void main() {
  late AppDatabase database;
  late PleromaChatRepository chatRepository;
  late AccountRepository accountRepository;
  late PleromaChatMessageRepository chatMessageRepository;

  late DbChatMessagePopulated dbChatMessagePopulated;
  late DbChatMessage dbChatMessage;

  late DbChat dbChat;
  late DbPleromaChatPopulated dbChatPopulated;
  late IPleromaChat chat;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    chatRepository = PleromaChatRepository(
      appDatabase: database,
      chatMessageRepository: chatMessageRepository,
      accountRepository: accountRepository,
    );

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insertInDbType(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbChat = await createTestDbChat(
      seed: "seed4",
      dbAccount: dbAccount,
    );
    dbChatPopulated = DbPleromaChatPopulated(
      dbChat: dbChat,
      dbAccount: dbAccount,
    );

    chat = DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated);
    dbChatMessage = await createTestDbChatMessage(
      seed: "seed3",
      dbAccount: dbAccount,
      chatRemoteId: dbChat.remoteId,
    );

    dbChatMessagePopulated = await createTestDbChatMessagePopulated(
      dbChatMessage,
      accountRepository,
    );

    dbChatMessagePopulated = DbChatMessagePopulated(
      dbChatMessage: dbChatMessage,
      dbAccount: dbAccount,
    );

    await chatMessageRepository.insertInDbType(dbChatMessage);
  });

  tearDown(() async {
    await chatRepository.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await chatRepository.insertInDbType(dbChat);
    assert(id > 0, true);
    expectDbChat(
      await chatRepository.findByDbIdInAppType(id),
      dbChat,
    );
  });

  test('upsertAll', () async {
    var dbChat1 = (await createTestDbChat(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(
      remoteId: "remoteId1",
    );
    // same remote id
    var dbChat2 = (await createTestDbChat(
      seed: "seed6",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");

    await chatRepository.upsertAllInDbType([dbChat1]);

    expect((await chatRepository.getAllInAppType()).length, 1);

    await chatRepository.upsertAllInDbType([dbChat2]);
    expect((await chatRepository.getAllInAppType()).length, 1);

    expectDbChat(
      (await chatRepository.getAllInAppType()).first,
      dbChat2,
    );
  });

  test('updateById', () async {
    var id = await chatRepository.insertInDbType(dbChat);
    assert(id > 0, true);

    await chatRepository.updateByDbIdInDbType(
      dbId:id,
      dbItem:dbChat.copyWith(remoteId: "newRemoteId"),
    );

    expect(
      (await chatRepository.findByDbIdInAppType(id))!.remoteId,
      "newRemoteId",
    );
  });

  test('updateLocalChatByRemoteChat', () async {
    var id =
        await chatRepository.insertInDbType(dbChat.copyWith(remoteId: "oldRemoteId"));
    assert(id > 0, true);

    var oldLocalChat = chat.copyWith(id: id);

    var newRemoteId = "newRemoteId";
    var newAcct = "newAcct";
    var newContent = "newContent";

    var newRemoteChat = chat
        .copyWith(
      id: id,
      remoteId: newRemoteId,
    )
        .toPleromaChat(
      lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
        dbChatMessagePopulated: DbChatMessagePopulated(
          dbChatMessage: dbChatMessage.copyWith(content: newContent),
          dbAccount: dbAccount.copyWith(
            acct: newAcct,
          ),
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

    await chatRepository.updateLocalChatByRemoteChat(
      oldLocalChat: oldLocalChat,
      newRemoteChat: newRemoteChat,
    );

    expect(
      (await chatRepository.findByDbIdInAppType(id))!.remoteId,
      newRemoteId,
    );
    expect(
      (await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId))!.acct,
      newAcct,
    );
    expect(
      (await chatMessageRepository.findByRemoteIdInAppType(dbChatMessage.remoteId))!
          .content,
      newContent,
    );
  });

  test('findByRemoteId', () async {
    await chatRepository.insertInDbType(dbChat);
    expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
  });

  test('upsertRemoteChat', () async {
    expect(await chatRepository.countAll(), 0);

    await chatRepository.upsertRemoteChat(
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: dbChatPopulated,
      ).toPleromaChat(
        accounts: [
          DbAccountWrapper(
            dbAccount: dbAccount,
          ),
        ],
        lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ),
      ),
    );

    expect(await chatRepository.countAll(), 1);

    expect(
      await chatMessageRepository.countAll(),
      1,
    );
    expect(
      await accountRepository.countAll(),
      1,
    );
    expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );

    // item with same id updated

    await chatRepository.upsertRemoteChat(
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: dbChatPopulated,
      ).toPleromaChat(
        accounts: [
          DbAccountWrapper(
            dbAccount: dbAccount,
          ),
        ],
        lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ),
      ),
    );
    expect(await chatRepository.countAll(), 1);
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
  });

  test('upsertRemoteChats', () async {
    expect(await chatRepository.countAll(), 0);
    await chatRepository.upsertRemoteChats(
      [
        DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated)
            .toPleromaChat(
          accounts: [
            DbAccountWrapper(
              dbAccount: dbAccount,
            ),
          ],
          lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
            dbChatMessagePopulated: dbChatMessagePopulated,
          ),
        ),
      ],
    );

    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );

    await chatRepository.upsertRemoteChats([
      DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated)
          .toPleromaChat(
        accounts: [
          DbAccountWrapper(
            dbAccount: dbAccount,
          ),
        ],
        lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ),
      ),
    ]);
    // update item with same id
    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
  });

  test('createQuery empty', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
      withLastMessage: false,
    );

    expect((await query.get()).length, 0);

    await chatRepository.insertInDbType((await createTestDbChat(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith());

    expect((await query.get()).length, 1);

    await chatRepository.insertInDbType((await createTestDbChat(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith());

    expect((await query.get()).length, 2);

    await chatRepository.insertInDbType((await createTestDbChat(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith());

    expect((await query.get()).length, 3);
  });

  test('createQuery newerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await createTestChat(
          seed: "remoteId5",
          remoteId: "remoteId5"
              "",
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatOrderingTermData.updatedAtDesc,
      withLastMessage: false,
    );

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 0);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 0);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 1);
    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId7", updatedAt: DateTime(2007)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await createTestChat(
          seed: "remoteId5",
          remoteId: "remoteId5"
              "",
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatOrderingTermData.updatedAtDesc,
      withLastMessage: false,
    );

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3", updatedAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);
    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await createTestChat(
          seed: "remoteId2",
          remoteId: "remoteId2"
              "",
          updatedAt: DateTime(2002),
        ),
        olderThanItem: await createTestChat(
          seed: "remoteId5",
          remoteId: "remoteId5"
              "",
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatOrderingTermData.updatedAtDesc,
      withLastMessage: false,
    );

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1", updatedAt: DateTime(2001)),
    );

    expect((await query.get()).length, 0);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2", updatedAt: DateTime(2002)),
    );

    expect((await query.get()).length, 0);
    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3", updatedAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4", updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed5",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5", updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed6",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6", updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatOrderingTermData.remoteIdAsc,
      withLastMessage: false,
    );

    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var chat1 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var chat3 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbPleromaChatPopulated> actualList =
        (await query.get()).toDbPleromaChatPopulatedList(
      dao: chatRepository.dao,
    );
    expect(actualList.length, 3);

    expect(actualList[0].dbChat, chat1);
    expect(actualList[1].dbChat, chat2);
    expect(actualList[2].dbChat, chat3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatOrderingTermData.remoteIdDesc,
      withLastMessage: false,
    );

    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var chat1 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var chat3 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbPleromaChatPopulated> actualList =
        (await query.get()).toDbPleromaChatPopulatedList(
      dao: chatRepository.dao,
    );
    expect(actualList.length, 3);

    expect(actualList[0].dbChat, chat3);
    expect(actualList[1].dbChat, chat2);
    expect(actualList[2].dbChat, chat1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: PleromaChatOrderingTermData.remoteIdDesc,
      withLastMessage: false,
    );

    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbPleromaChatPopulated> actualList =
        (await query.get()).toDbPleromaChatPopulatedList(
      dao: chatRepository.dao,
    );
    expect(actualList.length, 1);

    expect(actualList[0].dbChat, chat2);
  });

  test('incrementUnreadCount', () async {
    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2", unread: 1),
    );
    var chat3 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3", unread: 1),
    );

    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat2.remoteId,
      updatedAt: DateTime.now(),
    );

    expect((await chatRepository.findByRemoteIdInAppType(chat2.remoteId))!.unread, 2);
    expect((await chatRepository.findByRemoteIdInAppType(chat3.remoteId))!.unread, 1);
  });

  test('incrementUnreadCount', () async {
    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2", unread: 1),
    );
    var chat3 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3", unread: 1),
    );

    await chatRepository.markAsRead(
      chat: DbPleromaChatPopulatedWrapper(
        dbChatPopulated: DbPleromaChatPopulated(
          dbChat: chat2,
          dbAccount: dbAccount,
        ),
      ),
    );

    expect(
      (await chatRepository.findByRemoteIdInAppType(chat2.remoteId))!.unread,
      0,
    );
    expect(
      (await chatRepository.findByRemoteIdInAppType(chat3.remoteId))!.unread,
      1,
    );
  });
  test('totalUnreadCount', () async {
    int? listened;
    var subscription = chatRepository.watchTotalUnreadCount().listen((event) {
      listened = event;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(await chatRepository.getTotalUnreadCount(), 0);
    expect(listened, 0);

    var chat2 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2", unread: 1),
    );
    var chat3 = await insertDbChat(
      chatRepository,
      (await createTestDbChat(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3", unread: 1),
    );

    await Future.delayed(Duration(milliseconds: 1));
    expect(await chatRepository.getTotalUnreadCount(), 2);
    expect(listened, 2);

    await chatRepository.markAsRead(
      chat: DbPleromaChatPopulatedWrapper(
        dbChatPopulated: DbPleromaChatPopulated(
          dbChat: chat2,
          dbAccount: dbAccount,
        ),
      ),
    );
    await Future.delayed(Duration(milliseconds: 1));
    expect(await chatRepository.getTotalUnreadCount(), 1);
    expect(listened, 1);
    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat2.remoteId,
      updatedAt: DateTime.now(),
    );
    await Future.delayed(Duration(milliseconds: 1));
    expect(await chatRepository.getTotalUnreadCount(), 2);
    expect(listened, 2);
    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat3.remoteId,
      updatedAt: DateTime.now(),
    );
    await Future.delayed(Duration(milliseconds: 1));
    expect(await chatRepository.getTotalUnreadCount(), 3);
    expect(listened, 3);

    await subscription.cancel();
  });
}
