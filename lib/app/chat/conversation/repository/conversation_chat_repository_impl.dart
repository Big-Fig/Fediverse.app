import 'package:collection/collection.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model_adapter.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_database_dao.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
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

class ConversationChatRepository extends AsyncInitLoadingBloc
    implements IConversationChatRepository {
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
  Future deleteByRemoteId(String? remoteId) => dao.deleteByRemoteId(
        remoteId!,
      );

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteConversation(
    IPleromaConversation? remoteConversation,
  ) async {
    _logger.finer(() => "upsertRemoteConversation $remoteConversation");
    var remoteAccounts = remoteConversation!.accounts;

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

    await upsert(remoteConversation.toDbConversation());
  }

  @override
  Future upsertRemoteConversations(
    List<IPleromaConversation>? remoteConversations,
  ) async {
    _logger.finer(
      () => "upsertRemoteConversations ${remoteConversations!.length}",
    );

    for (var remoteConversation in remoteConversations!) {
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

    await upsertAll(
      remoteConversations
          .map(
            (pleromaConversation) => pleromaConversation.toDbConversation(),
          )
          .toList(),
    );
  }

  @override
  Future<DbConversationChatWrapper?> findByRemoteId(String remoteId) async =>
      (await dao.findByRemoteId(remoteId).getSingleOrNull())
          ?.toDbConversationChatWrapper();

  @override
  Stream<DbConversationChatWrapper?> watchByRemoteId(String remoteId) =>
      dao.findByRemoteId(remoteId).watchSingleOrNull().map(
            (value) => value?.toDbConversationChatWrapper(),
          );

  @override
  Future upsertAll(List<DbConversation> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(List<DbConversation> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(items, InsertMode.insertOrRollback);
  }

  @override
  Future clear() => dao.clear();

  @override
  Future<bool> deleteById(int id) async {
    var affectedRows = await dao.deleteById(id);
    assert(affectedRows == 0 || affectedRows == 1);
    return (affectedRows) == 1;
  }

  @override
  Future<DbConversationChatWrapper?> findById(int id) async =>
      (await dao.findById(id).getSingleOrNull())?.toDbConversationChatWrapper();

  @override
  Stream<DbConversationChatWrapper?> watchById(int id) =>
      dao.findById(id).watchSingleOrNull().map(
            (value) => value?.toDbConversationChatWrapper(),
          );

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbConversationChatWrapper>> getAll() async =>
      (await dao.getAll().get()).toDbConversationChatWrapperList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbConversationChatWrapper>> watchAll() =>
      dao.getAll().watch().map(
            (list) => list.toDbConversationChatWrapperList(),
          );

  @override
  Future<int> insert(DbConversation item) => dao.insert(item);

  @override
  Future<int> upsert(DbConversation item) => dao.upsert(item);

  @override
  Future<bool> updateById(
    int? id,
    DbConversation dbConversation,
  ) {
    if (dbConversation.id != id) {
      dbConversation = dbConversation.copyWith(id: id);
    }
    return dao.replace(dbConversation);
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
      await updateById(
        oldLocalConversation.localId,
        newRemoteConversation.toDbConversation(),
      );
    } else {
      await upsertRemoteConversation(newRemoteConversation);
    }
  }

  @override
  Future<List<DbConversationChatWrapper>> getConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return (await query.get()).toDbConversationChatWrapperList();
  }

  @override
  Stream<List<DbConversationChatWrapper>> watchConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return query.watch().map(
          (list) => list.toDbConversationChatWrapperList(),
        );
  }

  SimpleSelectStatement<$DbConversationsTable, DbConversation> createQuery({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    required ConversationChatOrderingTermData? orderingTermData,
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

    if (pagination?.limit != null) {
      query.limit(
        pagination!.limit!,
        offset: pagination.offset,
      );
    }
    return query;
  }

  @override
  Future<DbConversationChatWrapper?> getConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  }) async {
    var conversations = await getConversations(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return conversations.singleOrNull;
  }

  @override
  Stream<DbConversationChatWrapper?> watchConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  }) {
    var conversationsStream = watchConversations(
      filters: filters,
      pagination: _singleConversationChatRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return conversationsStream.map(
      (conversations) => conversations.singleOrNull,
    );
  }

  @override
  Future<bool> markAsRead({
    required IConversationChat? conversation,
  }) {
    return updateById(
      conversation!.localId,
      DbConversation(
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
}

extension DbConversationExtension on DbConversation {
  DbConversationChatWrapper toDbConversationChatWrapper() =>
      DbConversationChatWrapper(
        dbConversation: this,
      );
}

extension DbConversationListExtension on List<DbConversation> {
  List<DbConversationChatWrapper> toDbConversationChatWrapperList() => map(
        (item) => item.toDbConversationChatWrapper(),
      ).toList();
}

extension DbConversationChatWrapperExtension on DbConversationChatWrapper {
  DbConversation toDbConversation() => dbConversation;
}
