// ignore_for_file: prefer_const_constructors

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
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

import '../../../rxdart/rxdart_test_helper.dart';
import '../../account/database/account_database_test_helper.dart';
import '../chat_test_helper.dart';
import '../database/chat_database_test_helper.dart';
import '../message/database/chat_message_database_test_helper.dart';
import 'chat_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
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

    dbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1');
    var accountId = await accountRepository.insertInDbType(
      dbAccount,
      mode: null,
    );
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbChat = await ChatDatabaseMockHelper.createTestDbChat(
      seed: 'seed4',
      dbAccount: dbAccount,
    );
    dbChatPopulated = DbPleromaChatPopulated(
      dbChat: dbChat,
      dbAccount: dbAccount,
    );

    chat = DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated);
    dbChatMessage = await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed3',
      dbAccount: dbAccount,
      chatRemoteId: dbChat.remoteId,
    );

    dbChatMessagePopulated =
        await ChatMessageDatabaseMockHelper.createTestDbChatMessagePopulated(
      dbChatMessage,
      accountRepository,
    );

    dbChatMessagePopulated = DbChatMessagePopulated(
      dbChatMessage: dbChatMessage,
      dbAccount: dbAccount,
    );

    await chatMessageRepository.insertInDbType(
      dbChatMessage,
      mode: null,
    );
  });

  tearDown(() async {
    await chatRepository.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await chatRepository.insertInDbType(
      dbChat,
      mode: null,
    );
    assert(id > 0, true);
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByDbIdInAppType(id),
      dbChat,
    );
  });

  test('upsertAll', () async {
    var dbChat1 = (await ChatDatabaseMockHelper.createTestDbChat(
      seed: 'seed5',
      dbAccount: dbAccount,
    ))
        .copyWith(
      remoteId: 'remoteId1',
    );
    // same remote id
    var dbChat2 = (await ChatDatabaseMockHelper.createTestDbChat(
      seed: 'seed6',
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: 'remoteId1');

    await chatRepository.upsertAllInDbType(
      [dbChat1],
      batchTransaction: null,
    );

    expect((await chatRepository.getAllInAppType()).length, 1);

    await chatRepository.upsertAllInDbType(
      [dbChat2],
      batchTransaction: null,
    );
    expect((await chatRepository.getAllInAppType()).length, 1);

    ChatDatabaseMockHelper.expectDbChat(
      (await chatRepository.getAllInAppType()).first,
      dbChat2,
    );
  });

  test('updateById', () async {
    var id = await chatRepository.insertInDbType(
      dbChat,
      mode: null,
    );
    assert(id > 0, true);

    await chatRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbChat.copyWith(remoteId: 'newRemoteId'),
      batchTransaction: null,
    );

    expect(
      (await chatRepository.findByDbIdInAppType(id))!.remoteId,
      'newRemoteId',
    );
  });

  test('updateLocalChatByRemoteChat', () async {
    var id = await chatRepository.insertInDbType(
      dbChat.copyWith(remoteId: 'oldRemoteId'),
      mode: null,
    );
    assert(id > 0, true);

    var dbPleromaChatPopulatedWrapper = chat.toDbPleromaChatPopulatedWrapper();
    var oldLocalChat = dbPleromaChatPopulatedWrapper.copyWith(
      dbChatPopulated: dbPleromaChatPopulatedWrapper.dbChatPopulated.copyWith(
        dbChat: dbPleromaChatPopulatedWrapper.dbChatPopulated.dbChat.copyWith(
          id: id,
        ),
      ),
    );

    var newRemoteId = 'newRemoteId';
    var newAcct = 'newAcct';
    var newContent = 'newContent';

    dbPleromaChatPopulatedWrapper = chat.toDbPleromaChatPopulatedWrapper();
    var newRemoteChat = dbPleromaChatPopulatedWrapper
        .copyWith(
      dbChatPopulated: dbPleromaChatPopulatedWrapper.dbChatPopulated.copyWith(
        dbChat: dbPleromaChatPopulatedWrapper.dbChatPopulated.dbChat.copyWith(
          id: id,
          remoteId: newRemoteId,
        ),
      ),
    )
        .toUnifediApiChat(
      lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
        dbChatMessagePopulated: DbChatMessagePopulated(
          dbChatMessage: dbChatMessage.copyWith(content: newContent),
          dbAccount: dbAccount.copyWith(
            acct: newAcct,
          ),
        ),
      ),
      accounts: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount.copyWith(
              acct: newAcct,
            ),
          ),
        ),
      ],
    );

    await chatRepository.updateAppTypeByRemoteType(
      appItem: oldLocalChat,
      remoteItem: newRemoteChat,
      batchTransaction: null,
    );

    expect(
      (await chatRepository.findByDbIdInAppType(id))!.remoteId,
      newRemoteId,
    );
    expect(
      (await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId))!
          .acct,
      newAcct,
    );
    expect(
      (await chatMessageRepository
              .findByRemoteIdInAppType(dbChatMessage.remoteId))!
          .content,
      newContent,
    );
  });

  test('findByRemoteId', () async {
    await chatRepository.insertInDbType(
      dbChat,
      mode: null,
    );
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
  });

  test('upsertRemoteChat', () async {
    expect(await chatRepository.countAll(), 0);

    await chatRepository.upsertInRemoteType(
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: dbChatPopulated,
      ).toUnifediApiChat(
        accounts: [
          DbAccountPopulatedWrapper(
            dbAccountPopulated: DbAccountPopulated(
              dbAccount: dbAccount,
            ),
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
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );

    // item with same id updated

    await chatRepository.upsertInRemoteType(
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: dbChatPopulated,
      ).toUnifediApiChat(
        accounts: [
          DbAccountPopulatedWrapper(
            dbAccountPopulated: DbAccountPopulated(
              dbAccount: dbAccount,
            ),
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
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
  });

  test('upsertRemoteChats', () async {
    expect(await chatRepository.countAll(), 0);
    await chatRepository.upsertAllInRemoteType(
      [
        DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated)
            .toUnifediApiChat(
          accounts: [
            DbAccountPopulatedWrapper(
              dbAccountPopulated: DbAccountPopulated(
                dbAccount: dbAccount,
              ),
            ),
          ],
          lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
            dbChatMessagePopulated: dbChatMessagePopulated,
          ),
        ),
      ],
      batchTransaction: null,
    );

    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );

    await chatRepository.upsertAllInRemoteType(
      [
        DbPleromaChatPopulatedWrapper(dbChatPopulated: dbChatPopulated)
            .toUnifediApiChat(
          accounts: [
            DbAccountPopulatedWrapper(
              dbAccountPopulated: DbAccountPopulated(
                dbAccount: dbAccount,
              ),
            ),
          ],
          lastChatMessage: DbPleromaChatMessagePopulatedWrapper(
            dbChatMessagePopulated: dbChatMessagePopulated,
          ),
        ),
      ],
      batchTransaction: null,
    );
    // update item with same id
    expect(await chatRepository.countAll(), 1);

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatDatabaseMockHelper.expectDbChat(
      await chatRepository.findByRemoteIdInAppType(dbChat.remoteId),
      dbChat,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
  });

  test('createQuery empty', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await chatRepository.insertInDbType(
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 1);

    await chatRepository.insertInDbType(
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 2);

    await chatRepository.insertInDbType(
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery newerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await ChatMockHelper.createTestChat(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatRepositoryOrderingTermData.updatedAtDesc,
    );

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 0);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 0);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId6', updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 1);
    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId7', updatedAt: DateTime(2007)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await ChatMockHelper.createTestChat(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatRepositoryOrderingTermData.updatedAtDesc,
    );

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', updatedAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);
    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId6', updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await ChatMockHelper.createTestChat(
          seed: 'remoteId2',
          remoteId: 'remoteId2',
          updatedAt: DateTime(2002),
        ),
        olderThanItem: await ChatMockHelper.createTestChat(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          updatedAt: DateTime(2005),
        ),
      ),
      orderingTermData: PleromaChatRepositoryOrderingTermData.updatedAtDesc,
    );

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1', updatedAt: DateTime(2001)),
    );

    expect((await query.get()).length, 0);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2', updatedAt: DateTime(2002)),
    );

    expect((await query.get()).length, 0);
    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', updatedAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed4',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', updatedAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed5',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', updatedAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed6',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId6', updatedAt: DateTime(2006)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatRepositoryOrderingTermData.remoteIdAsc,
    );

    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    var chat1 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    var chat3 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 3);

    expect(actualList[0].toDbChat(), chat1);
    expect(actualList[1].toDbChat(), chat2);
    expect(actualList[2].toDbChat(), chat3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: PleromaChatRepositoryOrderingTermData.remoteIdDesc,
    );

    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    var chat1 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    var chat3 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 3);

    expect(actualList[0].toDbChat(), chat3);
    expect(actualList[1].toDbChat(), chat2);
    expect(actualList[2].toDbChat(), chat1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = chatRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: PleromaChatRepositoryOrderingTermData.remoteIdDesc,
    );

    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 1);

    expect(actualList[0].toDbChat(), chat2);
  });

  test('incrementUnreadCount', () async {
    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2', unread: 1),
    );
    var chat3 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', unread: 1),
    );

    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat2.remoteId,
      updatedAt: DateTime.now(),
    );

    expect(
      (await chatRepository.findByRemoteIdInAppType(chat2.remoteId))!.unread,
      2,
    );
    expect(
      (await chatRepository.findByRemoteIdInAppType(chat3.remoteId))!.unread,
      1,
    );
  });

  test('incrementUnreadCount', () async {
    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2', unread: 1),
    );
    var chat3 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', unread: 1),
    );

    await chatRepository.markAsRead(
      chat: DbPleromaChatPopulatedWrapper(
        dbChatPopulated: DbPleromaChatPopulated(
          dbChat: chat2,
          dbAccount: dbAccount,
        ),
      ),
      batchTransaction: null,
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

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(await chatRepository.getTotalUnreadCount(), 0);
    expect(listened, 0);

    var chat2 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2', unread: 1),
    );
    var chat3 = await ChatRepositoryMockHelper.insertDbChat(
      chatRepository,
      (await ChatDatabaseMockHelper.createTestDbChat(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', unread: 1),
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(await chatRepository.getTotalUnreadCount(), 2);
    expect(listened, 2);

    await chatRepository.markAsRead(
      chat: DbPleromaChatPopulatedWrapper(
        dbChatPopulated: DbPleromaChatPopulated(
          dbChat: chat2,
          dbAccount: dbAccount,
        ),
      ),
      batchTransaction: null,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(await chatRepository.getTotalUnreadCount(), 1);
    expect(listened, 1);
    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat2.remoteId,
      updatedAt: DateTime.now(),
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(await chatRepository.getTotalUnreadCount(), 2);
    expect(listened, 2);
    await chatRepository.incrementUnreadCount(
      chatRemoteId: chat3.remoteId,
      updatedAt: DateTime.now(),
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(await chatRepository.getTotalUnreadCount(), 3);
    expect(listened, 3);

    await subscription.cancel();
  });
}
