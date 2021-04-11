import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

var _singlePleromaChatRepositoryPagination = RepositoryPagination<IPleromaChat>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class PleromaChatRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbChat,
    DbPleromaChatPopulated,
    IPleromaChat,
    pleroma_lib.IPleromaChat,
    int,
    String,
    $DbChatsTable,
    $DbChatsTable,
    PleromaChatRepositoryFilters,
    PleromaChatRepositoryOrderingTermData> implements IPleromaChatRepository {
  @override
  late ChatDao dao;
  late ChatAccountsDao chatAccountsDao;

  @override
  PopulatedDatabaseDaoMixin<
      DbChat,
      DbPleromaChatPopulated,
      int,
      $DbChatsTable,
      $DbChatsTable,
      PleromaChatRepositoryFilters,
      PleromaChatRepositoryOrderingTermData> get populatedDao => dao;

  final IAccountRepository accountRepository;
  final IPleromaChatMessageRepository chatMessageRepository;

  PleromaChatRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
    required this.chatMessageRepository,
  }) {
    dao = appDatabase.chatDao;
    chatAccountsDao = appDatabase.chatAccountsDao;
  }

  //
  // @override
  // Future upsertRemoteChat(pleroma_lib.IPleromaChat remoteChat) async {
  //   _logger.finer(() => "upsertRemoteChat $remoteChat");
  //
  //   var remoteAccounts = [
  //     remoteChat.account,
  //   ];
  //
  //   await accountRepository.upsertRemoteAccounts(
  //     remoteAccounts,
  //     chatRemoteId: remoteChat.id,
  //     conversationRemoteId: null,
  //   );
  //
  //   var lastMessage = remoteChat.lastMessage;
  //   if (lastMessage != null) {
  //     await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
  //   }
  //
  //   await upsertInRemoteType(
  //     remoteChat,
  //   );
  // }

  //
  // @override
  // Future upsertRemoteChats(
  //   List<pleroma_lib.IPleromaChat> pleromaChats,
  // ) async {
  //   _logger.finer(() => "upsertRemoteChats ${pleromaChats.length}");
  //
  //   for (var remoteChat in pleromaChats) {
  //     var lastMessage = remoteChat.lastMessage;
  //     if (lastMessage != null) {
  //       await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
  //     }
  //
  //     await accountRepository.upsertRemoteAccounts(
  //       [
  //         remoteChat.account,
  //       ],
  //       chatRemoteId: remoteChat.id,
  //       conversationRemoteId: null,
  //     );
  //   }
  //
  //   await upsertAllInRemoteType(
  //     pleromaChats,
  //   );
  // }
  //
  // @override
  // Future updateLocalChatByRemoteChat({
  //   required IPleromaChat oldLocalChat,
  //   required pleroma_lib.IPleromaChat newRemoteChat,
  // }) async {
  //   _logger.finer(() => "updateLocalChatByRemoteChat \n"
  //       "\t old: $oldLocalChat \n"
  //       "\t newRemoteChat: $newRemoteChat");
  //
  //   await accountRepository.upsertRemoteAccounts(
  //     [
  //       newRemoteChat.account,
  //     ],
  //     chatRemoteId: oldLocalChat.remoteId,
  //     conversationRemoteId: null,
  //   );
  //
  //   var lastMessage = newRemoteChat.lastMessage;
  //   if (lastMessage != null) {
  //     await chatMessageRepository.upsertRemoteChatMessage(
  //       lastMessage,
  //     );
  //   }
  //   if (oldLocalChat.localId != null) {
  //     await updateByDbIdInDbType(
  //       dbId: oldLocalChat.localId!,
  //       dbItem: newRemoteChat.toDbChat(),
  //     );
  //   } else {
  //     await upsertRemoteChat(newRemoteChat);
  //   }
  // }

  @override
  Future<IPleromaChat?> findByAccount({
    required IAccount account,
  }) async {
    // todo: rework with one query
    var dbChatAccount = await chatAccountsDao
        .findByAccountRemoteId(
          account.remoteId,
        )
        .getSingleOrNull();

    if (dbChatAccount != null) {
      var pleromaChat = await findByRemoteIdInAppType(
        dbChatAccount.chatRemoteId,
      );
      if (pleromaChat != null) {
        return pleromaChat;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future markAsRead({
    required IPleromaChat chat,
    required Batch? batchTransaction,
  }) {
    return updateByDbIdInDbType(
      dbId: chat.localId!,
      dbItem: DbChat(
        id: chat.localId,
        remoteId: chat.remoteId,
        unread: 0,
        updatedAt: DateTime.now(),
        accountRemoteId: chat.accounts.first.remoteId,
      ),
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future<int> getTotalUnreadCount() => dao.getTotalAmountUnread();

  @override
  Stream<int> watchTotalUnreadCount() => dao.watchTotalAmountUnread();

  @override
  Future incrementUnreadCount({
    required String chatRemoteId,
    required DateTime updatedAt,
  }) =>
      dao.incrementUnreadCount(
        chatRemoteId: chatRemoteId,
        updatedAt: updatedAt,
      );

  @override
  Future<List<DbPleromaChatWithLastMessagePopulatedWrapper>>
      getChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          PleromaChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );
    return (await query.get())
        .toDbPleromaChatWithLastMessagePopulatedList(dao: dao)
        .toDbPleromaChatWithLastMessagePopulatedWrapperList();
  }

  @override
  Stream<List<DbPleromaChatWithLastMessagePopulatedWrapper>>
      watchChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          PleromaChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watch().map(
          (list) => list
              .toDbPleromaChatWithLastMessagePopulatedList(dao: dao)
              .toDbPleromaChatWithLastMessagePopulatedWrapperList(),
        );
  }

  @override
  Future<DbPleromaChatWithLastMessagePopulatedWrapper?> getChatWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          PleromaChatRepositoryFilters(withLastMessage: true),
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return (await query.getSingleOrNull())
        ?.toDbPleromaChatWithLastMessagePopulated(
          dao: dao,
        )
        .toDbPleromaChatWithLastMessagePopulatedWrapper();
  }

  @override
  Stream<DbPleromaChatWithLastMessagePopulatedWrapper?>
      watchChatWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          PleromaChatRepositoryFilters(withLastMessage: true),
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watchSingleOrNull().map(
          (typedResult) => typedResult
              ?.toDbPleromaChatWithLastMessagePopulated(dao: dao)
              .toDbPleromaChatWithLastMessagePopulatedWrapper(),
        );
  }

  @override
  DbChat mapAppItemToDbItem(IPleromaChat appItem) => appItem.toDbChat();

  @override
  pleroma_lib.IPleromaChat mapAppItemToRemoteItem(IPleromaChat appItem) =>
      // todo: improve
      appItem.toPleromaChat(
        lastChatMessage: null,
        accounts: [],
      );

  @override
  DbPleromaChatPopulated mapAppItemToDbPopulatedItem(IPleromaChat appItem) =>
      appItem.toDbPleromaChatPopulated();

  @override
  IPleromaChat mapDbPopulatedItemToAppItem(
          DbPleromaChatPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbPleromaChatPopulatedWrapper();

  @override
  pleroma_lib.IPleromaChat mapDbPopulatedItemToRemoteItem(
          DbPleromaChatPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbPleromaChatPopulatedWrapper().toPleromaChat(
        lastChatMessage: null,
        accounts: [],
      );

  @override
  IPleromaChat mapRemoteItemToAppItem(
    pleroma_lib.IPleromaChat remoteItem,
  ) {
    return DbPleromaChatPopulatedWrapper(
      dbChatPopulated: DbPleromaChatPopulated(
        dbAccount: remoteItem.account.toDbAccount(),
        dbChat: remoteItem.toDbChat(),
      ),
    );
  }

  @override
  PleromaChatRepositoryFilters get emptyFilters =>
      PleromaChatRepositoryFilters.empty;

  @override
  List<PleromaChatRepositoryOrderingTermData> get defaultOrderingTerms =>
      PleromaChatRepositoryOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbChat> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertBatch(
        entity: dbItem,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> insertInRemoteType(
    pleroma_lib.IPleromaChat remoteItem, {
    required InsertMode? mode,
  }) async {
    await _upsertChatMessageMetadata(
      remoteItem,
      batchTransaction: null,
    );

    return await dao.upsert(
      entity: remoteItem.toDbChat(),
    );
  }

  Future _upsertChatMessageMetadata(
    pleroma_lib.IPleromaChat remoteItem, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await accountRepository.upsertChatRemoteAccount(
        remoteItem.account,
        chatRemoteId: remoteItem.id,
        batchTransaction: batchTransaction,
      );

      var lastMessage = remoteItem.lastMessage;
      if (lastMessage != null) {
        await chatMessageRepository.upsertInRemoteTypeBatch(
          lastMessage,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        _upsertChatMessageMetadata(
          remoteItem,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future<void> insertInRemoteTypeBatch(
    pleroma_lib.IPleromaChat remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // todo: support mode
      await _upsertChatMessageMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      await dao.upsertBatch(
        entity: remoteItem.toDbChat(),
        batchTransaction: batchTransaction,
      );
    } else {
      await batch((batch) {
        insertInRemoteTypeBatch(
          remoteItem,
          mode: mode,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IPleromaChat appItem,
    required pleroma_lib.IPleromaChat remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await _upsertChatMessageMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      if (appItem.localId != null) {
        await updateByDbIdInDbType(
          dbId: appItem.localId!,
          dbItem: remoteItem.toDbChat(),
          batchTransaction: batchTransaction,
        );
      } else {
        await upsertInRemoteTypeBatch(
          remoteItem,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        updateAppTypeByRemoteType(
          appItem: appItem,
          remoteItem: remoteItem,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbChat dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}

extension DbPleromaChatPopulatedExtension on DbPleromaChatPopulated {
  DbPleromaChatPopulatedWrapper toDbPleromaChatPopulatedWrapper() =>
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: this,
      );
}

extension DbPleromaChatPopulatedListExtension on List<DbPleromaChatPopulated> {
  List<DbPleromaChatPopulatedWrapper> toDbPleromaChatPopulatedWrapperList() =>
      map(
        (value) => value.toDbPleromaChatPopulatedWrapper(),
      ).toList();
}

extension DbPleromaChatWithLastMessagePopulatedExtension
    on DbPleromaChatWithLastMessagePopulated {
  DbPleromaChatWithLastMessagePopulatedWrapper
      toDbPleromaChatWithLastMessagePopulatedWrapper() =>
          DbPleromaChatWithLastMessagePopulatedWrapper(
            dbPleromaChatWithLastMessagePopulated: this,
          );
}

extension DbPleromaChatWithLastMessagePopulatedListExtension
    on List<DbPleromaChatWithLastMessagePopulated> {
  List<DbPleromaChatWithLastMessagePopulatedWrapper>
      toDbPleromaChatWithLastMessagePopulatedWrapperList() => map(
            (value) => value.toDbPleromaChatWithLastMessagePopulatedWrapper(),
          ).toList();
}

extension DbPleromaChatPopulatedWrapperExtension
    on DbPleromaChatPopulatedWrapper {
  DbChat toDbChat(DbPleromaChatPopulatedWrapper item) =>
      item.dbChatPopulated.dbChat;
}
