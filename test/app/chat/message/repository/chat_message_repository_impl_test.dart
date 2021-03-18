import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../../account/database/account_database_model_helper.dart';
import '../../chat_model_helper.dart';
import '../chat_message_model_helper.dart';
import '../database/chat_message_database_model_helper.dart';
import 'chat_message_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

void main() {
  late AppDatabase database;
  late AccountRepository accountRepository;
  late PleromaChatMessageRepository chatMessageRepository;

  late DbChatMessagePopulated dbChatMessagePopulated;
  late DbChatMessage dbChatMessage;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    dbAccount = await createTestDbAccount(seed: "seed1");

    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbChatMessage =
        await createTestDbChatMessage(seed: "seed3", dbAccount: dbAccount);

    dbChatMessagePopulated = await createTestDbChatMessagePopulated(
      dbChatMessage,
      accountRepository,
    );
  });

  tearDown(() async {
    await accountRepository.dispose();
    await chatMessageRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await chatMessageRepository.insert(dbChatMessage);
    assert(id > 0, true);
    expectDbChatMessagePopulated(
        await chatMessageRepository.findById(id), dbChatMessagePopulated);
  });

  test('upsertRemoteChatMessage', () async {
    expect(await chatMessageRepository.countAll(), 0);

    await chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
              dbChatMessagePopulated: dbChatMessagePopulated)
          .toPleromaChatMessage(),
    );

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
      dbChatMessage,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );

    // item with same id updated
    await chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
              dbChatMessagePopulated: dbChatMessagePopulated)
          .toPleromaChatMessage(),
    );
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChatMessage(
      await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
      dbChatMessage,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('upsertRemoteChatMessages', () async {
    expect(await chatMessageRepository.countAll(), 0);
    await chatMessageRepository.upsertRemoteChatMessages(
      [
        DbChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toPleromaChatMessage(),
      ],
    );

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);

    await chatMessageRepository.upsertRemoteChatMessages([
      DbChatMessagePopulatedWrapper(
              dbChatMessagePopulated: dbChatMessagePopulated)
          .toPleromaChatMessage(),
    ]);

    // update item with same id
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessage);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
  });

  test('upsertAll', () async {
    var dbChatMessage1 = (await createTestDbChatMessage(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbChatMessage2 = (await createTestDbChatMessage(
      seed: "seed6",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");

    await chatMessageRepository.upsertAll([dbChatMessage1]);

    expect((await chatMessageRepository.getAll()).length, 1);

    await chatMessageRepository.upsertAll([dbChatMessage2]);
    expect((await chatMessageRepository.getAll()).length, 1);

    expectDbChatMessagePopulated(
        (await chatMessageRepository.getAll()).first,
        await createTestDbChatMessagePopulated(
          dbChatMessage2,
          accountRepository,
        ));
  });

  test('updateById', () async {
    var id = await chatMessageRepository.insert(dbChatMessage);
    assert(id > 0, true);

    await chatMessageRepository.updateById(
        id, dbChatMessage.copyWith(remoteId: "newRemoteId"));

    expect((await chatMessageRepository.findById(id))!.remoteId, "newRemoteId");
  });

  test('updateLocalChatMessageByRemoteChatMessage', () async {
    var id = await chatMessageRepository
        .insert(dbChatMessage.copyWith(content: "oldContent"));
    assert(id > 0, true);

    var oldLocalChatMessage = DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: DbChatMessagePopulated(
            dbChatMessage: dbChatMessage.copyWith(id: id),
            dbAccount: dbAccount));
    var newContent = "newContent";
    var newRemoteChatMessage = DbChatMessagePopulatedWrapper(
      dbChatMessagePopulated: DbChatMessagePopulated(
        dbChatMessage: dbChatMessage.copyWith(id: id, content: newContent),
        dbAccount: dbAccount,
      ),
    ).toPleromaChatMessage();
    await chatMessageRepository.updateLocalChatMessageByRemoteChatMessage(
      oldLocalChatMessage: oldLocalChatMessage,
      newRemoteChatMessage: newRemoteChatMessage,
    );

    expect((await chatMessageRepository.findById(id))!.content, newContent);
  });

  test('findByRemoteId', () async {
    await chatMessageRepository.insert(dbChatMessage);
    expectDbChatMessagePopulated(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessagePopulated);
  });

  test('createQuery empty', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith());

    expect((await query.get()).length, 1);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith());
    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await createTestChatMessage(
          seed: "remoteId5",
          remoteId: "remoteId5",
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
    );

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4", createdAt: DateTime(2004)));

    expect((await query.get()).length, 0);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5", createdAt: DateTime(2005)));

    expect((await query.get()).length, 0);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6", createdAt: DateTime(2006)));

    expect((await query.get()).length, 1);
    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId7", createdAt: DateTime(2007)));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await createTestChatMessage(
          seed: "remoteId5",
          remoteId: "remoteId5",
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
    );

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3", createdAt: DateTime(2003)));

    expect((await query.get()).length, 1);
    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4", createdAt: DateTime(2004)));

    expect((await query.get()).length, 2);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5", createdAt: DateTime(2005)));

    expect((await query.get()).length, 2);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6", createdAt: DateTime(2006)));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanChatMessage & newerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await createTestChatMessage(
          seed: "remoteId2",
          remoteId: "remoteId2",
          createdAt: DateTime(2002),
        ),
        olderThanItem: await createTestChatMessage(
          seed: "remoteId5",
          remoteId: "remoteId5",
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
    );

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1", createdAt: DateTime(2001)));

    expect((await query.get()).length, 0);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2", createdAt: DateTime(2002)));

    expect((await query.get()).length, 0);
    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3", createdAt: DateTime(2003)));

    expect((await query.get()).length, 1);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed4", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4", createdAt: DateTime(2004)));

    expect((await query.get()).length, 2);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed5", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5", createdAt: DateTime(2005)));

    expect((await query.get()).length, 2);

    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed6", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6", createdAt: DateTime(2006)));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatMessageOrderingTermData.remoteIdAsc,
    );

    var chatMessage2 = await insertDbChatMessage(
      chatMessageRepository,
      (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
          .copyWith(remoteId: "remoteId2"),
    );
    var chatMessage1 = await insertDbChatMessage(
      chatMessageRepository,
      (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
          .copyWith(remoteId: "remoteId1"),
    );
    var chatMessage3 = await insertDbChatMessage(
      chatMessageRepository,
      (await createTestDbChatMessage(seed: "seed3", dbAccount: dbAccount))
          .copyWith(remoteId: "remoteId3"),
    );

    var typedResultList = await query.get();
    List<DbChatMessagePopulated> actualList =
        typedResultList.toDbChatMessagePopulatedList(
      dao: chatMessageRepository.dao,
    );
    expect(actualList.length, 3);

    expect(actualList[0].dbChatMessage, chatMessage1);
    expect(actualList[1].dbChatMessage, chatMessage2);
    expect(actualList[2].dbChatMessage, chatMessage3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatMessageOrderingTermData.remoteIdDesc,
    );

    var chatMessage2 = await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var chatMessage1 = await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var chatMessage3 = await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    var typedResultList = await query.get();
    List<DbChatMessagePopulated> actualList =
        typedResultList.toDbChatMessagePopulatedList(
      dao: chatMessageRepository.dao,
    );
    expect(actualList.length, 3);

    expect(actualList[0].dbChatMessage, chatMessage3);
    expect(actualList[1].dbChatMessage, chatMessage2);
    expect(actualList[2].dbChatMessage, chatMessage1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: PleromaChatMessageOrderingTermData.remoteIdAsc,
    );

    var chatMessage2 = await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));
    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));
    await insertDbChatMessage(
        chatMessageRepository,
        (await createTestDbChatMessage(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    var typedResultList = await query.get();
    List<DbChatMessagePopulated> actualList =
        typedResultList.toDbChatMessagePopulatedList(
      dao: chatMessageRepository.dao,
    );
    expect(actualList.length, 1);

    expect(actualList[0].dbChatMessage, chatMessage2);
  });

  test('createQuery onlyInChat', () async {
    var chatRemoteId = "chatRemoteId";
    var query = chatMessageRepository.createQuery(
      filters: PleromaChatMessageRepositoryFilters(
        onlyInChats: [
          DbPleromaChatPopulatedWrapper(
            dbChatPopulated: DbPleromaChatPopulated(
              dbChat: DbChat(
                  remoteId: chatRemoteId,
                  unread: 0,
                  id: null,
                  updatedAt: DateTime.now(),
                  accountRemoteId: dbAccount.remoteId),
              dbAccount: dbAccount,
            ),
          )
        ],
        onlyPendingStatePublishedOrNull: true,
        onlyNotDeleted: false,
        onlyNotHiddenLocallyOnDevice: false,
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbChatMessage1 = (await createTestDbChatMessage(
            seed: "seed1", dbAccount: dbAccount, chatRemoteId: "invalidChatId"))
        .copyWith();
    await insertDbChatMessage(chatMessageRepository, dbChatMessage1);

    expect((await query.get()).length, 0);

    var dbChatMessage2 = (await createTestDbChatMessage(
            seed: "seed2", dbAccount: dbAccount, chatRemoteId: "invalidChatId"))
        .copyWith();
    await insertDbChatMessage(chatMessageRepository, dbChatMessage2);

    expect((await query.get()).length, 0);

    var dbChatMessage3 = (await createTestDbChatMessage(
            seed: "seed3", dbAccount: dbAccount, chatRemoteId: chatRemoteId))
        .copyWith();
    await insertDbChatMessage(chatMessageRepository, dbChatMessage3);

    expect((await query.get()).length, 1);

    // duplicate adding. Should be skipped
    await chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: DbChatMessagePopulated(
          dbChatMessage: await createTestDbChatMessage(
              seed: "seed3", dbAccount: dbAccount, chatRemoteId: chatRemoteId),
          dbAccount: dbAccount,
        ),
      ).toPleromaChatMessage(),
    );

    expect((await query.get()).length, 1);

    var dbChatMessage4 = (await createTestDbChatMessage(
            seed: "seed4", dbAccount: dbAccount, chatRemoteId: chatRemoteId))
        .copyWith();
    await insertDbChatMessage(chatMessageRepository, dbChatMessage4);

    expect((await query.get()).length, 2);
  });

  test('getChatLastChatMessage', () async {
    var chatRemoteId = "chatRemoteId";

    var chat = await createTestChat(seed: chatRemoteId, remoteId: chatRemoteId);

    // 1 is not related to chat
    await chatMessageRepository
        .upsertRemoteChatMessage(DbChatMessagePopulatedWrapper(
      dbChatMessagePopulated: await createTestDbChatMessagePopulated(
        dbChatMessage.copyWith(
          remoteId: "chatMessage1",
          createdAt: DateTime(
            2001,
          ),
        ),
        accountRepository,
      ),
    ).toPleromaChatMessage());

    expect(
        await chatMessageRepository.getChatLastChatMessage(chat: chat), null);

    // 2 is related to chat
    await chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
            remoteId: "chatMessage2",
            chatRemoteId: chatRemoteId,
            createdAt: DateTime(
              2002,
            ),
          ),
          accountRepository,
        ),
      ).toPleromaChatMessage(),
    );

    expect(
      (await chatMessageRepository.getChatLastChatMessage(
        chat: chat,
      ))!
          .remoteId,
      "chatMessage2",
    );

    // 4 is newer than 2
    await chatMessageRepository
        .upsertRemoteChatMessage(DbChatMessagePopulatedWrapper(
      dbChatMessagePopulated: await createTestDbChatMessagePopulated(
        dbChatMessage.copyWith(
            remoteId: "chatMessage4",
            chatRemoteId: chatRemoteId,
            createdAt: DateTime(2004)),
        accountRepository,
      ),
    ).toPleromaChatMessage());
    expect(
        (await chatMessageRepository.getChatLastChatMessage(chat: chat))!
            .remoteId,
        "chatMessage4");

    // remain 4
    await chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
              remoteId: "chatMessage3",
              chatRemoteId: chatRemoteId,
              createdAt: DateTime(2003)),
          accountRepository,
        ),
      ).toPleromaChatMessage(),
    );

    expect(
        (await chatMessageRepository.getChatLastChatMessage(chat: chat))!
            .remoteId,
        "chatMessage4");
  });

  test('upsertRemoteChatMessage duplicated parallel upsert', () async {
    expect(await chatMessageRepository.countAll(), 0);

    var chatRemoteId = "chatRemoteId";

    dbChatMessagePopulated =
        dbChatMessagePopulated.copyWith(chatRemoteId: chatRemoteId);

    await chatMessageRepository.upsertRemoteChatMessages([
      DbChatMessagePopulatedWrapper(
              dbChatMessagePopulated: dbChatMessagePopulated)
          .toPleromaChatMessage()
    ]);
    await chatMessageRepository.upsertRemoteChatMessages(
      [
        DbChatMessagePopulatedWrapper(
                dbChatMessagePopulated: dbChatMessagePopulated)
            .toPleromaChatMessage()
      ],
    );

    var future1 = chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toPleromaChatMessage(),
    );
    var future2 = chatMessageRepository.upsertRemoteChatMessage(
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toPleromaChatMessage(),
    );

    var future3 = chatMessageRepository.upsertRemoteChatMessages(
      [
        DbChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toPleromaChatMessage(),
      ],
    );
    var future4 = chatMessageRepository.upsertRemoteChatMessages([
      DbChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toPleromaChatMessage(),
    ]);

    await future1;
    await future2;
    await future3;
    await future4;

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expect((await chatMessageRepository.dao.countAll().get()).length, 1);
    expect(
        (await chatMessageRepository.getChatMessages(
          filters: PleromaChatMessageRepositoryFilters(
            onlyInChats: [
              await createTestChat(seed: "seed5", remoteId: chatRemoteId)
            ],
            onlyPendingStatePublishedOrNull: true,
            onlyNotDeleted: false,
            onlyNotHiddenLocallyOnDevice: false,
          ),
          pagination: null,
        ))
            .length,
        1);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbChatMessage(
        await chatMessageRepository.findByRemoteId(dbChatMessage.remoteId),
        dbChatMessagePopulated.dbChatMessage);
  });
}
