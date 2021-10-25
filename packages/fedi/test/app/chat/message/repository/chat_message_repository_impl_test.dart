// ignore_for_file: prefer_const_constructors

import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository_model.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../../account/database/account_database_test_helper.dart';
import '../../chat_test_helper.dart';
import '../chat_message_test_helper.dart';
import '../database/chat_message_database_test_helper.dart';
import 'chat_message_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword, no-equal-arguments
// ignore_for_file: avoid-ignoring-return-values
const String baseUrl = 'https://unifedi.com';

void main() {
  late AppDatabase database;
  late AccountRepository accountRepository;
  late UnifediChatMessageRepository chatMessageRepository;

  late DbChatMessagePopulated dbChatMessagePopulated;
  late DbChatMessage dbChatMessage;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = UnifediChatMessageRepository(
      appDatabase: database,
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

    dbChatMessage = await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed3',
      dbAccount: dbAccount,
    );

    dbChatMessagePopulated =
        await ChatMessageDatabaseMockHelper.createTestDbChatMessagePopulated(
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
    var id = await chatMessageRepository.insertInDbType(
      dbChatMessage,
      mode: null,
    );
    assert(id > 0, true);
    ChatMessageDatabaseMockHelper.expectDbChatMessagePopulated(
      await chatMessageRepository.findByDbIdInAppType(id),
      dbChatMessagePopulated,
    );
  });

  test('upsertRemoteChatMessage', () async {
    expect(await chatMessageRepository.countAll(), 0);

    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toUnifediApiChatMessage(),
    );

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );

    // item with same id updated
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toUnifediApiChatMessage(),
    );
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('upsertRemoteChatMessages', () async {
    expect(await chatMessageRepository.countAll(), 0);
    await chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );

    await chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );

    // update item with same id
    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessage,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('upsertAll', () async {
    var dbChatMessage1 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed5',
      dbAccount: dbAccount,
    ))
            .copyWith(remoteId: 'remoteId1');
    // same remote id
    var dbChatMessage2 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed6',
      dbAccount: dbAccount,
    ))
            .copyWith(remoteId: 'remoteId1');

    await chatMessageRepository.upsertAllInDbType(
      [dbChatMessage1],
      batchTransaction: null,
    );

    expect((await chatMessageRepository.getAllInAppType()).length, 1);

    await chatMessageRepository.upsertAllInDbType(
      [dbChatMessage2],
      batchTransaction: null,
    );
    expect((await chatMessageRepository.getAllInAppType()).length, 1);

    ChatMessageDatabaseMockHelper.expectDbChatMessagePopulated(
      (await chatMessageRepository.getAllInAppType()).first,
      await ChatMessageDatabaseMockHelper.createTestDbChatMessagePopulated(
        dbChatMessage2,
        accountRepository,
      ),
    );
  });

  test('updateById', () async {
    var id = await chatMessageRepository.insertInDbType(
      dbChatMessage,
      mode: null,
    );
    assert(id > 0, true);

    await chatMessageRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbChatMessage.copyWith(remoteId: 'newRemoteId'),
      batchTransaction: null,
    );

    expect(
      (await chatMessageRepository.findByDbIdInAppType(id))!.remoteId,
      'newRemoteId',
    );
  });

  test('updateLocalChatMessageByRemoteChatMessage', () async {
    var id = await chatMessageRepository.insertInDbType(
      dbChatMessage.copyWith(
        content: 'oldContent',
      ),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalChatMessage = DbUnifediChatMessagePopulatedWrapper(
      dbChatMessagePopulated: DbChatMessagePopulated(
        dbChatMessage: dbChatMessage.copyWith(id: id),
        dbAccount: dbAccount,
      ),
    );
    var newContent = 'newContent';
    var newRemoteChatMessage = DbUnifediChatMessagePopulatedWrapper(
      dbChatMessagePopulated: DbChatMessagePopulated(
        dbChatMessage: dbChatMessage.copyWith(id: id, content: newContent),
        dbAccount: dbAccount,
      ),
    ).toUnifediApiChatMessage();
    await chatMessageRepository.updateAppTypeByRemoteType(
      appItem: oldLocalChatMessage,
      remoteItem: newRemoteChatMessage,
      batchTransaction: null,
    );

    expect(
      (await chatMessageRepository.findByDbIdInRemoteType(id))!.content,
      newContent,
    );
  });

  test('findByRemoteId', () async {
    await chatMessageRepository.insertInDbType(
      dbChatMessage,
      mode: null,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessagePopulated(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessagePopulated,
    );
  });

  test('createQuery empty', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 1);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await ChatMessageMockHelper.createTestChatMessage(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
    );

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', createdAt: DateTime(2004)),
    );

    expect((await query.get()).length, 0);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', createdAt: DateTime(2005)),
    );

    expect((await query.get()).length, 0);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId6', createdAt: DateTime(2006)),
    );

    expect((await query.get()).length, 1);
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId7', createdAt: DateTime(2007)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await ChatMessageMockHelper.createTestChatMessage(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
    );

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', createdAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', createdAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', createdAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId6', createdAt: DateTime(2006)),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanChatMessage & newerThanChatMessage', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await ChatMessageMockHelper.createTestChatMessage(
          seed: 'remoteId2',
          remoteId: 'remoteId2',
          createdAt: DateTime(2002),
        ),
        olderThanItem: await ChatMessageMockHelper.createTestChatMessage(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          createdAt: DateTime(2005),
        ),
      ),
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
    );

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1', createdAt: DateTime(2001)),
    );

    expect((await query.get()).length, 0);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2', createdAt: DateTime(2002)),
    );

    expect((await query.get()).length, 0);
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3', createdAt: DateTime(2003)),
    );

    expect((await query.get()).length, 1);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed4',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId4', createdAt: DateTime(2004)),
    );

    expect((await query.get()).length, 2);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed5',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId5', createdAt: DateTime(2005)),
    );

    expect((await query.get()).length, 2);

    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed6',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId6',
        createdAt: DateTime(2006),
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.remoteIdAsc,
    );

    var chatMessage2 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId2',
      ),
    );
    var chatMessage1 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId1',
      ),
    );
    var chatMessage3 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId3',
      ),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    expect(
      actualList[0].toDbChatMessage(),
      chatMessage1,
    );
    expect(
      actualList[1].toDbChatMessage(),
      chatMessage2,
    );
    expect(
      actualList[2].toDbChatMessage(),
      chatMessage3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.remoteIdDesc,
    );

    var chatMessage2 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId2',
      ),
    );
    var chatMessage1 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId1',
      ),
    );
    var chatMessage3 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId3',
      ),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    expect(actualList[0].toDbChatMessage(), chatMessage3);
    expect(actualList[1].toDbChatMessage(), chatMessage2);
    expect(actualList[2].toDbChatMessage(), chatMessage1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = chatMessageRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.remoteIdAsc,
    );

    var chatMessage2 =
        await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId2',
      ),
    );
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId1',
      ),
    );
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId3',
      ),
    );

    var actualList = await query.get();

    expect(actualList.length, 1);

    expect(
      actualList[0].toDbChatMessage(),
      chatMessage2,
    );
  });

  test('createQuery onlyInChat', () async {
    var chatRemoteId = 'chatRemoteId';
    var query = chatMessageRepository.createQuery(
      filters: UnifediChatMessageRepositoryFilters(
        onlyInChats: [
          DbUnifediChatPopulatedWrapper(
            dbChatPopulated: DbUnifediChatPopulated(
              dbChat: DbChat(
                remoteId: chatRemoteId,
                unread: 0,
                id: null,
                updatedAt: DateTime.now(),
                accountRemoteId: dbAccount.remoteId,
              ),
              dbAccount: dbAccount,
            ),
          ),
        ],
        onlyPendingStatePublishedOrNull: true,
        onlyNotDeleted: false,
        onlyNotHiddenLocallyOnDevice: false,
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbChatMessage1 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed1',
      dbAccount: dbAccount,
      chatRemoteId: 'invalidChatId',
    ))
            .copyWith();
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      dbChatMessage1,
    );

    expect((await query.get()).length, 0);

    var dbChatMessage2 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed2',
      dbAccount: dbAccount,
      chatRemoteId: 'invalidChatId',
    ))
            .copyWith();
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      dbChatMessage2,
    );

    expect((await query.get()).length, 0);

    var dbChatMessage3 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed3',
      dbAccount: dbAccount,
      chatRemoteId: chatRemoteId,
    ))
            .copyWith();
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      dbChatMessage3,
    );

    expect((await query.get()).length, 1);

    // duplicate adding. Should be skipped
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: DbChatMessagePopulated(
          dbChatMessage:
              await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
            seed: 'seed3',
            dbAccount: dbAccount,
            chatRemoteId: chatRemoteId,
          ),
          dbAccount: dbAccount,
        ),
      ).toUnifediApiChatMessage(),
    );

    expect((await query.get()).length, 1);

    var dbChatMessage4 =
        (await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed4',
      dbAccount: dbAccount,
      chatRemoteId: chatRemoteId,
    ))
            .copyWith();
    await ChatMessageRepositoryMockHelper.insertDbChatMessage(
      chatMessageRepository,
      dbChatMessage4,
    );

    expect((await query.get()).length, 2);
  });

  test('getChatLastChatMessage', () async {
    var chatRemoteId = 'chatRemoteId';

    var chat = await ChatMockHelper.createTestChat(
      seed: chatRemoteId,
      remoteId: chatRemoteId,
    );

    // 1 is not related to chat
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await ChatMessageDatabaseMockHelper
            .createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
            remoteId: 'chatMessage1',
            createdAt: DateTime(
              2001,
            ),
          ),
          accountRepository,
        ),
      ).toUnifediApiChatMessage(),
    );

    expect(
      await chatMessageRepository.getChatLastChatMessage(chat: chat),
      null,
    );

    // 2 is related to chat
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await ChatMessageDatabaseMockHelper
            .createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
            remoteId: 'chatMessage2',
            chatRemoteId: chatRemoteId,
            createdAt: DateTime(
              2002,
            ),
          ),
          accountRepository,
        ),
      ).toUnifediApiChatMessage(),
    );

    expect(
      (await chatMessageRepository.getChatLastChatMessage(
        chat: chat,
      ))!
          .remoteId,
      'chatMessage2',
    );

    // 4 is newer than 2
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await ChatMessageDatabaseMockHelper
            .createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
            remoteId: 'chatMessage4',
            chatRemoteId: chatRemoteId,
            createdAt: DateTime(2004),
          ),
          accountRepository,
        ),
      ).toUnifediApiChatMessage(),
    );
    expect(
      (await chatMessageRepository.getChatLastChatMessage(chat: chat))!
          .remoteId,
      'chatMessage4',
    );

    // remain 4
    await chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: await ChatMessageDatabaseMockHelper
            .createTestDbChatMessagePopulated(
          dbChatMessage.copyWith(
            remoteId: 'chatMessage3',
            chatRemoteId: chatRemoteId,
            createdAt: DateTime(2003),
          ),
          accountRepository,
        ),
      ).toUnifediApiChatMessage(),
    );

    expect(
      (await chatMessageRepository.getChatLastChatMessage(chat: chat))!
          .remoteId,
      'chatMessage4',
    );
  });

  test('upsertRemoteChatMessage duplicated parallel upsert', () async {
    expect(await chatMessageRepository.countAll(), 0);

    var chatRemoteId = 'chatRemoteId';

    dbChatMessagePopulated = dbChatMessagePopulated.copyWith(
      dbChatMessage: dbChatMessagePopulated.dbChatMessage.copyWith(
        chatRemoteId: chatRemoteId,
      ),
    );

    await chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );
    await chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );

    var future1 = chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toUnifediApiChatMessage(),
    );
    var future2 = chatMessageRepository.upsertInRemoteType(
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated,
      ).toUnifediApiChatMessage(),
    );

    var future3 = chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );
    var future4 = chatMessageRepository.upsertAllInRemoteType(
      [
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: dbChatMessagePopulated,
        ).toUnifediApiChatMessage(),
      ],
      batchTransaction: null,
    );

    await future1;
    await future2;
    await future3;
    await future4;

    expect(await chatMessageRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expect((await chatMessageRepository.dao.getAll()).length, 1);
    expect(
      (await chatMessageRepository.findAllInAppType(
        filters: UnifediChatMessageRepositoryFilters(
          onlyInChats: [
            await ChatMockHelper.createTestChat(
              seed: 'seed5',
              remoteId: chatRemoteId,
            ),
          ],
          onlyPendingStatePublishedOrNull: true,
          onlyNotDeleted: false,
          onlyNotHiddenLocallyOnDevice: false,
        ),
        pagination: null,
        orderingTerms: null,
      ))
          .length,
      1,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    ChatMessageDatabaseMockHelper.expectDbChatMessage(
      await chatMessageRepository
          .findByRemoteIdInAppType(dbChatMessage.remoteId),
      dbChatMessagePopulated.dbChatMessage,
    );
  });
}
