import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_repository_impl.dart");

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
  //
  // @override
  // Future<List<DbPleromaChatPopulatedWrapper>> getChats({
  //   required PleromaChatRepositoryFilters? filters,
  //   required RepositoryPagination<IPleromaChat>? pagination,
  //   PleromaChatRepositoryOrderingTermData? orderingTermData =
  //       PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  // }) async {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: pagination,
  //     orderingTermData: orderingTermData,
  //     withLastMessage: false,
  //   );
  //   return (await query.get())
  //       .toDbPleromaChatPopulatedList(dao: dao)
  //       .toDbPleromaChatPopulatedWrapperList();
  // }
  //
  // @override
  // Stream<List<DbPleromaChatPopulatedWrapper>> watchChats({
  //   required PleromaChatRepositoryFilters? filters,
  //   required RepositoryPagination<IPleromaChat>? pagination,
  //   PleromaChatRepositoryOrderingTermData? orderingTermData =
  //       PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  // }) {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: pagination,
  //     orderingTermData: orderingTermData,
  //     withLastMessage: false,
  //   );
  //
  //   return query.watch().map(
  //         (list) => list
  //             .toDbPleromaChatPopulatedList(dao: dao)
  //             .toDbPleromaChatPopulatedWrapperList(),
  //       );
  // }
  //
  // @override
  // Future<DbPleromaChatPopulatedWrapper?> getChat({
  //   required PleromaChatRepositoryFilters? filters,
  //   PleromaChatRepositoryOrderingTermData? orderingTermData =
  //       PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  // }) async {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singlePleromaChatRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //     withLastMessage: false,
  //   );
  //
  //   return (await query.getSingleOrNull())
  //       ?.toDbPleromaChatPopulated(
  //         dao: dao,
  //       )
  //       .toDbPleromaChatPopulatedWrapper();
  // }
  //
  // @override
  // Stream<DbPleromaChatPopulatedWrapper?> watchChat({
  //   required PleromaChatRepositoryFilters? filters,
  //   PleromaChatRepositoryOrderingTermData? orderingTermData =
  //       PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  // }) {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singlePleromaChatRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //     withLastMessage: false,
  //   );
  //
  //   return query.watchSingleOrNull().map(
  //         (typedResult) => typedResult
  //             ?.toDbPleromaChatPopulated(dao: dao)
  //             .toDbPleromaChatPopulatedWrapper(),
  //       );
  // }

  JoinedSelectStatement createQuery({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    required PleromaChatRepositoryOrderingTermData? orderingTermData,
    required bool withLastMessage,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t withLastMessage=$withLastMessage\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData?.orderType == PleromaChatOrderType.updatedAt);
      dao.addUpdatedAtBoundsWhere(
        query,
        maximumDateTimeExcluding: pagination?.olderThanItem?.updatedAt,
        minimumDateTimeExcluding: pagination?.newerThanItem?.updatedAt,
      );
    }

    if (orderingTermData != null) {
      dao.orderBy(
        query,
        [
          orderingTermData,
        ],
      );
    }

    var joinQuery = query.join([
      ...dao.populateChatJoin(),
      if (withLastMessage) ...dao.chatLastMessageJoin(),
    ]);

    if (withLastMessage) {
      // todo: rework with moor-like code
      var fieldName = dao.chatMessageAlias.createdAt.$name;
      var aliasName = dao.chatMessageAlias.$tableName;
      var having = CustomExpression<bool>("MAX($aliasName.$fieldName)");
      joinQuery.groupBy(
        [
          dao.dbChats.remoteId,
        ],
        having: having,
      );
    }

    var limit = pagination?.limit;
    if (limit != null) {
      joinQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return joinQuery;
  }

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
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
    );

    return query.watch().map(
          (list) => list
              .toDbPleromaChatWithLastMessagePopulatedList(dao: dao)
              .toDbPleromaChatWithLastMessagePopulatedWrapperList(),
        );
  }

  @override
  Future<DbPleromaChatWithLastMessagePopulatedWrapper?> getChatWithLastMessage({
    required PleromaChatRepositoryFilters filters,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
  PleromaChatRepositoryFilters get emptyFilters =>
      PleromaChatRepositoryFilters.empty;

  @override
  List<PleromaChatRepositoryOrderingTermData> get defaultOrderingTerms =>
      PleromaChatRepositoryOrderingTermData.defaultTerms;
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
