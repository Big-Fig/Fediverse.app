import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/unifedi/database/unifedi_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/unifedi/database/unifedi_chat_database_dao.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';
import 'package:unifedi_api/unifedi_api.dart';

const _singleUnifediChatRepositoryPagination =
    RepositoryPagination<IUnifediChat>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class UnifediChatRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbChat,
    DbUnifediChatPopulated,
    IUnifediChat,
    IUnifediApiChat,
    int,
    String,
    $DbChatsTable,
    $DbChatsTable,
    UnifediChatRepositoryFilters,
    UnifediChatRepositoryOrderingTermData> implements IUnifediChatRepository {
  @override
  final ChatDao dao;
  final ChatAccountsDao chatAccountsDao;

  @override
  PopulatedDatabaseDaoMixin<
      DbChat,
      DbUnifediChatPopulated,
      int,
      $DbChatsTable,
      $DbChatsTable,
      UnifediChatRepositoryFilters,
      UnifediChatRepositoryOrderingTermData> get populatedDao => dao;

  final IAccountRepository accountRepository;
  final IUnifediChatMessageRepository chatMessageRepository;

  UnifediChatRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
    required this.chatMessageRepository,
  })  : dao = appDatabase.chatDao,
        chatAccountsDao = appDatabase.chatAccountsDao;

  @override
  Future<IUnifediChat?> findByAccount({
    required IAccount account,
  }) async {
    // todo: rework with one query
    var dbChatAccount = await chatAccountsDao
        .findByAccountRemoteId(
          account.remoteId,
        )
        .getSingleOrNull();

    if (dbChatAccount != null) {
      var unifediChat = await findByRemoteIdInAppType(
        dbChatAccount.chatRemoteId,
      );
      if (unifediChat != null) {
        return unifediChat;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<void> markAsRead({
    required IUnifediChat chat,
    required Batch? batchTransaction,
  }) =>
      updateByDbIdInDbType(
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

  @override
  Future<int> getTotalUnreadCount() => dao.getTotalAmountUnread();

  @override
  Stream<int> watchTotalUnreadCount() => dao.watchTotalAmountUnread();

  @override
  Future<void> incrementUnreadCount({
    required String chatRemoteId,
    required DateTime updatedAt,
  }) =>
      dao.incrementUnreadCount(
        chatRemoteId: chatRemoteId,
        updatedAt: updatedAt,
      );

  @override
  Future<List<DbUnifediChatWithLastMessagePopulatedWrapper>>
      getChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat>? pagination,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          const UnifediChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return (await query.get())
        .toDbUnifediChatWithLastMessagePopulatedList(dao: dao)
        .toDbUnifediChatWithLastMessagePopulatedWrapperList();
  }

  @override
  Stream<List<DbUnifediChatWithLastMessagePopulatedWrapper>>
      watchChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat>? pagination,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          const UnifediChatRepositoryFilters(withLastMessage: true),
      pagination: pagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watch().map(
          (list) => list
              .toDbUnifediChatWithLastMessagePopulatedList(dao: dao)
              .toDbUnifediChatWithLastMessagePopulatedWrapperList(),
        );
  }

  @override
  Future<DbUnifediChatWithLastMessagePopulatedWrapper?> getChatWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          const UnifediChatRepositoryFilters(withLastMessage: true),
      pagination: _singleUnifediChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return (await query.getSingleOrNull())
        ?.toDbUnifediChatWithLastMessagePopulated(
          dao: dao,
        )
        .toDbUnifediChatWithLastMessagePopulatedWrapper();
  }

  @override
  Stream<DbUnifediChatWithLastMessagePopulatedWrapper?>
      watchChatWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) {
    var query = createFindInTypedResultSelectable(
      filters: filters?.copyWith(withLastMessage: true) ??
          const UnifediChatRepositoryFilters(withLastMessage: true),
      pagination: _singleUnifediChatRepositoryPagination,
      orderingTerms: orderingTermData != null
          ? [
              orderingTermData,
            ]
          : null,
    );

    return query.watchSingleOrNull().map(
          (typedResult) => typedResult
              ?.toDbUnifediChatWithLastMessagePopulated(dao: dao)
              .toDbUnifediChatWithLastMessagePopulatedWrapper(),
        );
  }

  @override
  DbChat mapAppItemToDbItem(IUnifediChat appItem) => appItem.toDbChat();

  @override
  IUnifediApiChat mapAppItemToRemoteItem(IUnifediChat appItem) =>
      // todo: improve
      appItem.toUnifediApiChat(
        lastChatMessage: null,
        accounts: [],
      );

  @override
  DbUnifediChatPopulated mapAppItemToDbPopulatedItem(IUnifediChat appItem) =>
      appItem.toDbUnifediChatPopulated();

  @override
  IUnifediChat mapDbPopulatedItemToAppItem(
    DbUnifediChatPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbUnifediChatPopulatedWrapper();

  @override
  IUnifediApiChat mapDbPopulatedItemToRemoteItem(
    DbUnifediChatPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbUnifediChatPopulatedWrapper().toUnifediApiChat(
        lastChatMessage: null,
        accounts: [],
      );

  @override
  IUnifediChat mapRemoteItemToAppItem(
    IUnifediApiChat remoteItem,
  ) =>
      DbUnifediChatPopulatedWrapper(
        dbChatPopulated: DbUnifediChatPopulated(
          dbAccount: remoteItem.account.toDbAccount(),
          dbChat: remoteItem.toDbChat(),
        ),
      );

  @override
  UnifediChatRepositoryFilters get emptyFilters =>
      UnifediChatRepositoryFilters.empty;

  @override
  List<UnifediChatRepositoryOrderingTermData> get defaultOrderingTerms =>
      UnifediChatRepositoryOrderingTermData.defaultTerms;

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
    IUnifediApiChat remoteItem, {
    required InsertMode? mode,
  }) async {
    await _upsertChatMessageMetadata(
      remoteItem,
      batchTransaction: null,
    );

    return dao.upsert(
      entity: remoteItem.toDbChat(),
    );
  }

  Future<void> _upsertChatMessageMetadata(
    IUnifediApiChat remoteItem, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      accountRepository.upsertChatRemoteAccount(
        remoteItem.account,
        chatRemoteId: remoteItem.id,
        batchTransaction: batchTransaction,
      );

      var lastMessage = remoteItem.lastMessage;
      if (lastMessage != null) {
        // ignore: unawaited_futures
        chatMessageRepository.upsertInRemoteTypeBatch(
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
    IUnifediApiChat remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // todo: support mode
      // ignore: unawaited_futures
      _upsertChatMessageMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      // ignore: unawaited_futures
      dao.upsertBatch(
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
    required IUnifediChat appItem,
    required IUnifediApiChat remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      _upsertChatMessageMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
      );

      if (appItem.localId != null) {
        // ignore: unawaited_futures
        updateByDbIdInDbType(
          dbId: appItem.localId!,
          dbItem: remoteItem.toDbChat(),
          batchTransaction: batchTransaction,
        );
      } else {
        // ignore: unawaited_futures
        upsertInRemoteTypeBatch(
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

extension DbUnifediChatPopulatedExtension on DbUnifediChatPopulated {
  DbUnifediChatPopulatedWrapper toDbUnifediChatPopulatedWrapper() =>
      DbUnifediChatPopulatedWrapper(
        dbChatPopulated: this,
      );
}

extension DbUnifediChatPopulatedListExtension on List<DbUnifediChatPopulated> {
  List<DbUnifediChatPopulatedWrapper> toDbUnifediChatPopulatedWrapperList() =>
      map(
        (value) => value.toDbUnifediChatPopulatedWrapper(),
      ).toList();
}

extension DbUnifediChatWithLastMessagePopulatedExtension
    on DbUnifediChatWithLastMessagePopulated {
  DbUnifediChatWithLastMessagePopulatedWrapper
      toDbUnifediChatWithLastMessagePopulatedWrapper() =>
          DbUnifediChatWithLastMessagePopulatedWrapper(
            dbUnifediChatWithLastMessagePopulated: this,
          );
}

extension DbUnifediChatWithLastMessagePopulatedListExtension
    on List<DbUnifediChatWithLastMessagePopulated> {
  List<DbUnifediChatWithLastMessagePopulatedWrapper>
      toDbUnifediChatWithLastMessagePopulatedWrapperList() => map(
            (value) => value.toDbUnifediChatWithLastMessagePopulatedWrapper(),
          ).toList();
}

extension DbUnifediChatPopulatedWrapperExtension
    on DbUnifediChatPopulatedWrapper {
  DbChat toDbChat(DbUnifediChatPopulatedWrapper item) =>
      item.dbChatPopulated.dbChat;
}
