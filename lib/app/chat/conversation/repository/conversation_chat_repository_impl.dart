import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model_adapter.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_dao.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_chat_repository_impl.dart");

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

  @override
  Future upsertRemoteConversation(
    IPleromaConversation remoteConversation,
  ) async {
    _logger.finer(() => "upsertRemoteConversation $remoteConversation");
    var remoteAccounts = remoteConversation.accounts;

    await accountRepository.upsertRemoteAccounts(
      remoteAccounts,
      conversationRemoteId: remoteConversation.id,
      chatRemoteId: null,
    );

    var lastStatus = remoteConversation.lastStatus;
    if (lastStatus != null) {
      await statusRepository.upsertRemoteStatus(
        lastStatus,
        conversationRemoteId: remoteConversation.id,
        listRemoteId: null,
      );
    }

    await upsertInRemoteType(remoteConversation);
  }

  @override
  Future upsertRemoteConversations(
    List<IPleromaConversation> remoteConversations,
  ) async {
    _logger.finer(
      () => "upsertRemoteConversations ${remoteConversations.length}",
    );

    for (var remoteConversation in remoteConversations) {
      var lastStatus = remoteConversation.lastStatus;
      if (lastStatus != null) {
        await statusRepository.upsertRemoteStatus(
          lastStatus,
          listRemoteId: null,
          conversationRemoteId: remoteConversation.id,
        );
      }

      await accountRepository.upsertRemoteAccounts(
        remoteConversation.accounts,
        conversationRemoteId: remoteConversation.id,
        chatRemoteId: null,
      );
    }

    await upsertAllInRemoteType(
      remoteConversations,
    );
  }

  @override
  Future updateLocalConversationByRemoteConversation({
    required IConversationChat? oldLocalConversation,
    required IPleromaConversation newRemoteConversation,
  }) async {
    _logger.finer(() => "updateLocalConversationByRemoteConversation \n"
        "\t old: $oldLocalConversation \n"
        "\t newRemoteConversation: $newRemoteConversation");

    var remoteAccounts = newRemoteConversation.accounts;

    await accountRepository.upsertRemoteAccounts(
      remoteAccounts,
      conversationRemoteId: oldLocalConversation!.remoteId,
      chatRemoteId: null,
    );

    var lastStatus = newRemoteConversation.lastStatus;
    if (lastStatus != null) {
      await statusRepository.upsertRemoteStatus(
        lastStatus,
        listRemoteId: null,
        conversationRemoteId: oldLocalConversation.remoteId,
      );
    }
    if (oldLocalConversation.localId != null) {
      await updateByDbIdInDbType(
        dbId: oldLocalConversation.localId!,
        dbItem: newRemoteConversation.toDbConversation(),
      );
    } else {
      await upsertRemoteConversation(newRemoteConversation);
    }
  }

  @override
  Future<List<DbConversationChatPopulatedWrapper>> getConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: false,
    );

    return (await query.get())
        .toDbConversationChatPopulatedList(dao: dao)
        .toDbConversationChatPopulatedWrapperList();
  }

  @override
  Stream<List<DbConversationChatPopulatedWrapper>> watchConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: false,
    );

    return query.watch().map(
          (list) => list
              .toDbConversationChatPopulatedList(
                dao: dao,
              )
              .toDbConversationChatPopulatedWrapperList(),
        );
  }

  @override
  Future<DbConversationChatPopulatedWrapper?> getConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: false,
    );

    return (await query.getSingleOrNull())
        ?.toDbConversationPopulated(
          dao: dao,
        )
        .toDbConversationChatPopulatedWrapper();
  }

  @override
  Stream<DbConversationChatPopulatedWrapper?> watchConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: false,
    );

    return query.watchSingleOrNull().map(
          (typedResult) => typedResult
              ?.toDbConversationPopulated(dao: dao)
              .toDbConversationChatPopulatedWrapper(),
        );
  }

  JoinedSelectStatement createQuery({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    required ConversationRepositoryChatOrderingTermData? orderingTermData,
    required bool withLastMessage,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    SimpleSelectStatement<$DbConversationsTable, DbConversation> query =
        dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
          orderingTermData!.orderType == ConversationChatOrderType.updatedAt);
      dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
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
      // ...dao.populateChatJoin(),
      if (withLastMessage) ...dao.conversationLastMessageJoin(),
    ]);

    if (withLastMessage) {
      // todo: rework with moor-like code
      var fieldName = dao.statusAlias.createdAt.$name;
      var aliasName = dao.statusAlias.$tableName;
      var having = CustomExpression<bool>("MAX($aliasName.$fieldName)");
      joinQuery.groupBy(
        [
          dao.dbConversations.remoteId,
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
  Future<bool> markAsRead({
    required IConversationChat conversation,
  }) {
    return updateByDbIdInDbType(
      dbId: conversation.localId!,
      dbItem: DbConversation(
        id: conversation.localId,
        remoteId: conversation.remoteId,
        unread: false,
      ),
    );
  }

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
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
    required ConversationChatRepositoryFilters filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
    var query = createQuery(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
      withLastMessage: true,
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
  DbConversationPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbConversationPopulated(dao: dao);

  @override
  ConversationChatRepositoryFilters get emptyFilters =>
      ConversationChatRepositoryFilters.empty;

  @override
  List<ConversationRepositoryChatOrderingTermData> get defaultOrderingTerms =>
      ConversationRepositoryChatOrderingTermData.defaultTerms;

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required ConversationChatRepositoryFilters? filters,
  }) {}

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required List<ConversationRepositoryChatOrderingTermData>? orderingTerms,
  }) {}

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbConversationsTable, DbConversation> query,
    required ConversationChatRepositoryFilters? filters,
  }) {}

  @override
  Future insertAllInRemoteType(List<IPleromaConversation> remoteItems) {}

  @override
  Future<int> insertInRemoteType(IPleromaConversation remoteItem) {}

  @override
  Future upsertAllInRemoteType(List<IPleromaConversation> remoteItems) {}

  @override
  Future<int> upsertInRemoteType(IPleromaConversation remoteItem) {}
}
