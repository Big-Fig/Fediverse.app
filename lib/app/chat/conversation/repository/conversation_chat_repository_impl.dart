import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model_adapter.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_dao.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

var _singleConversationChatRepositoryPagination =
    RepositoryPagination<IConversationChat>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class ConversationChatRepository
    extends PopulatedAppRemoteDatabaseDaoRepository<
        DbConversation,
        DbConversationPopulated,
        IConversationChat,
        IPleromaConversation,
        int,
        String,
        $DbConversationsTable,
        $DbConversationsTable,
        ConversationChatRepositoryFilters,
        ConversationRepositoryChatOrderingTermData>
    implements IConversationChatRepository {
  @override
  PopulatedDatabaseDaoMixin<
      DbConversation,
      DbConversationPopulated,
      int,
      $DbConversationsTable,
      $DbConversationsTable,
      ConversationChatRepositoryFilters,
      ConversationRepositoryChatOrderingTermData> get populatedDao => dao;

  @override
  late ConversationDao dao;

  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;

  ConversationChatRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
    required this.statusRepository,
  }) {
    dao = appDatabase.conversationDao;
  }

  //
  // @override
  // Future upsertRemoteConversation(
  //   IPleromaConversation remoteConversation,
  // ) async {
  //   _logger.finer(() => "upsertRemoteConversation $remoteConversation");
  //   var remoteAccounts = remoteConversation.accounts;
  //
  //   await accountRepository.batch((batch) {
  //     accountRepository.upsertConversationRemoteAccounts(
  //       remoteAccounts,
  //       conversationRemoteId: remoteConversation.id,
  //       batchTransaction: batch,
  //     );
  //
  //     var lastStatus = remoteConversation.lastStatus;
  //     if (lastStatus != null) {
  //       statusRepository.upsertRemoteStatusForConversation(
  //         lastStatus,
  //         conversationRemoteId: remoteConversation.id,
  //         batchTransaction: batch,
  //       );
  //     }
  //     upsertInRemoteTypeBatch(
  //       remoteConversation,
  //       batchTransaction: batch,
  //     );
  //   });
  // }

  // @override
  // Future upsertRemoteConversations(
  //   List<IPleromaConversation> remoteConversations,
  // ) async {
  //   _logger.finer(
  //     () => "upsertRemoteConversations ${remoteConversations.length}",
  //   );
  //
  //   for (var remoteConversation in remoteConversations) {
  //     var lastStatus = remoteConversation.lastStatus;
  //     if (lastStatus != null) {
  //       await statusRepository.upsertRemoteStatus(
  //         lastStatus,
  //         listRemoteId: null,
  //         conversationRemoteId: remoteConversation.id,
  //       );
  //     }
  //
  //     await accountRepository.upsertRemoteAccounts(
  //       remoteConversation.accounts,
  //       conversationRemoteId: remoteConversation.id,
  //       chatRemoteId: null,
  //     );
  //   }
  //
  //   await upsertAllInRemoteType(
  //     remoteConversations,
  //   );
  // }
  //
  // @override
  // Future updateLocalConversationByRemoteConversation({
  //   required IConversationChat? oldLocalConversation,
  //   required IPleromaConversation newRemoteConversation,
  // }) async {
  //   _logger.finer(() => "updateLocalConversationByRemoteConversation \n"
  //       "\t old: $oldLocalConversation \n"
  //       "\t newRemoteConversation: $newRemoteConversation");
  //
  //   var remoteAccounts = newRemoteConversation.accounts;
  //
  //   await accountRepository.upsertRemoteAccounts(
  //     remoteAccounts,
  //     conversationRemoteId: oldLocalConversation!.remoteId,
  //     chatRemoteId: null,
  //   );
  //
  //   var lastStatus = newRemoteConversation.lastStatus;
  //   if (lastStatus != null) {
  //     await statusRepository.upsertRemoteStatus(
  //       lastStatus,
  //       listRemoteId: null,
  //       conversationRemoteId: oldLocalConversation.remoteId,
  //     );
  //   }
  //   if (oldLocalConversation.localId != null) {
  //     await updateByDbIdInDbType(
  //       dbId: oldLocalConversation.localId!,
  //       dbItem: newRemoteConversation.toDbConversation(),
  //     );
  //   } else {
  //     await upsertRemoteConversation(newRemoteConversation);
  //   }
  // }

  @override
  Future markAsRead({
    required IConversationChat conversation,
    required Batch? batchTransaction,
  }) =>
      updateByDbIdInDbType(
        dbId: conversation.localId!,
        dbItem: DbConversation(
          id: conversation.localId,
          remoteId: conversation.remoteId,
          unread: false,
        ),
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> getTotalUnreadCount() => dao.getTotalAmountUnread();

  @override
  Stream<int> watchTotalUnreadCount() => dao.watchTotalAmountUnread();

  @override
  Future<List<DbConversationChatWithLastMessagePopulatedWrapper>>
      getConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          ConversationChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );
    return (await query.get())
        .toDbConversationChatWithLastMessagePopulatedList(dao: dao)
        .toDbConversationChatWithLastMessagePopulatedWrapperList();
  }

  @override
  Stream<List<DbConversationChatWithLastMessagePopulatedWrapper>>
      watchConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          ConversationChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watch().map(
          (list) => list
              .toDbConversationChatWithLastMessagePopulatedList(dao: dao)
              .toDbConversationChatWithLastMessagePopulatedWrapperList(),
        );
  }

  @override
  Future<DbConversationChatWithLastMessagePopulatedWrapper?>
      getConversationWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          ConversationChatRepositoryFilters(withLastMessage: true),
      pagination: _singleConversationChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return (await query.getSingleOrNull())
        ?.toDbConversationChatWithLastMessagePopulated(
          dao: dao,
        )
        .toDbConversationChatWithLastMessagePopulatedWrapper();
  }

  @override
  Stream<DbConversationChatWithLastMessagePopulatedWrapper?>
      watchConversationWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          ConversationChatRepositoryFilters(withLastMessage: true),
      pagination: _singleConversationChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watchSingleOrNull().map(
          (typedResult) => typedResult
              ?.toDbConversationChatWithLastMessagePopulated(dao: dao)
              .toDbConversationChatWithLastMessagePopulatedWrapper(),
        );
  }

  @override
  DbConversation mapAppItemToDbItem(IConversationChat appItem) =>
      appItem.toDbConversation();

  @override
  IPleromaConversation mapAppItemToRemoteItem(IConversationChat appItem) {
    // todo: improve
    return appItem.toPleromaConversation(
      lastStatus: null,
      accounts: [],
    );
  }

  @override
  IConversationChat mapRemoteItemToAppItem(IPleromaConversation remoteItem) =>
      DbConversationChatPopulatedWrapper(
        dbConversationPopulated: DbConversationPopulated(
          dbConversation: remoteItem.toDbConversation(),
        ),
      );

  @override
  DbConversationPopulated mapAppItemToDbPopulatedItem(
          IConversationChat appItem) =>
      appItem.toDbConversationPopulated();

  @override
  IConversationChat mapDbPopulatedItemToAppItem(
          DbConversationPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbConversationChatPopulatedWrapper();

  @override
  IPleromaConversation mapDbPopulatedItemToRemoteItem(
      DbConversationPopulated dbPopulatedItem) {
    // todo: improve
    return dbPopulatedItem
        .toDbConversationChatPopulatedWrapper()
        .toPleromaConversation(
      lastStatus: null,
      accounts: [],
    );
  }

  @override
  ConversationChatRepositoryFilters get emptyFilters =>
      ConversationChatRepositoryFilters.empty;

  @override
  List<ConversationRepositoryChatOrderingTermData> get defaultOrderingTerms =>
      ConversationRepositoryChatOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbConversation> dbItem, {
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
    IPleromaConversation remoteItem, {
    required InsertMode? mode,
  }) async {
    await _upsertConversationMetadata(
      remoteItem,
      batchTransaction: null,
    );

    return await dao.insert(
      entity: remoteItem.toDbConversation(),
      mode: mode,
    );
  }

  Future _upsertConversationMetadata(
    IPleromaConversation remoteItem, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      var accounts = remoteItem.accounts;

      var lastMessage = remoteItem.lastStatus;
      accounts.removeWhere((account) =>
          account.id == lastMessage?.account.id ||
          account.id == lastMessage?.reblog?.account.id);


      for (var account in accounts) {
        await accountRepository.upsertConversationRemoteAccount(
          account,
          conversationRemoteId: remoteItem.id!,
          batchTransaction: batchTransaction,
        );
      }

      // strange bug upsertConversationRemoteAccounts not work
      // todo: check
      // await accountRepository.upsertConversationRemoteAccounts(
      //   accounts,
      //   conversationRemoteId: remoteItem.id!,
      //   batchTransaction: batchTransaction,
      // );

      if (lastMessage != null) {
        await statusRepository.upsertRemoteStatusForConversation(
          lastMessage,
          conversationRemoteId: remoteItem.id!,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        _upsertConversationMetadata(
          remoteItem,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future<void> insertInRemoteTypeBatch(
    IPleromaConversation remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // todo: support mode
      await _upsertConversationMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      await dao.upsertBatch(
        entity: remoteItem.toDbConversation(),
        batchTransaction: batchTransaction,
      );
    } else {
      await batch(
        (batch) {
          insertInRemoteTypeBatch(
            remoteItem,
            mode: mode,
            batchTransaction: batch,
          );
        },
      );
    }
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IConversationChat appItem,
    required IPleromaConversation remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await _upsertConversationMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      if (appItem.localId != null) {
        await updateByDbIdInDbType(
          dbId: appItem.localId!,
          dbItem: remoteItem.toDbConversation(),
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
    required DbConversation dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}
