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
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
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

class PleromaChatRepository extends AsyncInitLoadingBloc
    implements IPleromaChatRepository {
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

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbPleromaChatPopulatedWrapper> findByRemoteId(
    String? remoteId,
  ) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(
          remoteId,
        ),
      );

  @override
  Future upsertRemoteChat(pleroma_lib.IPleromaChat remoteChat) async {
    _logger.finer(() => "upsertRemoteChat $remoteChat");

    var remoteAccounts = [
      remoteChat.account,
    ];

    await accountRepository.upsertRemoteAccounts(
      remoteAccounts,
      chatRemoteId: remoteChat.id,
      conversationRemoteId: null,
    );

    var lastMessage = remoteChat.lastMessage;
    if (lastMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
    }

    await upsert(
      remoteChat.toDbChat(),
    );
  }

  @override
  Future upsertRemoteChats(
    List<pleroma_lib.IPleromaChat> pleromaChats,
  ) async {
    _logger.finer(() => "upsertRemoteChats ${pleromaChats.length}");

    for (var remoteChat in pleromaChats) {
      var lastMessage = remoteChat.lastMessage;
      if (lastMessage != null) {
        await chatMessageRepository.upsertRemoteChatMessage(lastMessage);
      }

      await accountRepository.upsertRemoteAccounts(
        [
          remoteChat.account,
        ],
        chatRemoteId: remoteChat.id,
        conversationRemoteId: null,
      );
    }

    await upsertAll(
      pleromaChats
          .map(
            (pleromaChat) => pleromaChat.toDbChat(),
          )
          .toList(),
    );
  }

  @override
  Future upsertAll(List<DbChat> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(
      items,
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future insertAll(List<DbChat> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(
      items,
      InsertMode.insertOrRollback,
    );
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
  Future<DbPleromaChatPopulatedWrapper> findById(int id) async =>
      mapDataClassToItem(
        await dao.findById(
          id,
        ),
      );

  @override
  Stream<DbPleromaChatPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(
        mapDataClassToItem,
      );

  @override
  Stream<DbPleromaChatPopulatedWrapper> watchByRemoteId(String? remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbPleromaChatPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbPleromaChatPopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbChat item) => dao.insert(item);

  @override
  Future<int> upsert(DbChat item) => dao.upsert(item);

  @override
  Future<bool> updateById(int? id, DbChat DbChat) {
    if (DbChat.id != id) {
      DbChat = DbChat.copyWith(id: id);
    }
    return dao.replace(DbChat);
  }

  DbPleromaChatPopulatedWrapper mapDataClassToItem(
    DbPleromaChatPopulated dataClass,
  ) =>
      DbPleromaChatPopulatedWrapper(
        dbChatPopulated: dataClass,
      );

  Insertable<DbChat> mapItemToDataClass(DbPleromaChatPopulatedWrapper item) =>
      item.dbChatPopulated.dbChat;

  @override
  Future updateLocalChatByRemoteChat({
    required IPleromaChat oldLocalChat,
    required pleroma_lib.IPleromaChat newRemoteChat,
  }) async {
    _logger.finer(() => "updateLocalChatByRemoteChat \n"
        "\t old: $oldLocalChat \n"
        "\t newRemoteChat: $newRemoteChat");

    await accountRepository.upsertRemoteAccounts(
      [
        newRemoteChat.account,
      ],
      chatRemoteId: oldLocalChat.remoteId,
      conversationRemoteId: null,
    );

    var lastMessage = newRemoteChat.lastMessage;
    if (lastMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(
        lastMessage,
      );
    }
    if (oldLocalChat.localId != null) {
      await updateById(
        oldLocalChat.localId,
        newRemoteChat.toDbChat(),
      );
    } else {
      await upsertRemoteChat(newRemoteChat);
    }
  }

  @override
  Future<List<DbPleromaChatPopulatedWrapper>> getChats({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatOrderingTermData? orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbPleromaChatPopulatedWrapper>> watchChats({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatOrderingTermData? orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbPleromaChatPopulated>> stream = query.watch().map(
          dao.typedResultListToPopulated,
        );
    return stream.map((list) => list
        .map(
          mapDataClassToItem,
        )
        .toList());
  }

  JoinedSelectStatement createQuery({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    required PleromaChatOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
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

    var joinQuery = query.join(
      dao.populateChatJoin(),
    );

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
  Future<DbPleromaChatPopulatedWrapper> getChat({
    required PleromaChatRepositoryFilters? filters,
    PleromaChatOrderingTermData? orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return mapDataClassToItem(
      dao.typedResultToPopulated(
        await query.getSingle(),
      ),
    );
  }

  @override
  Stream<DbPleromaChatPopulatedWrapper> watchChat({
    required PleromaChatRepositoryFilters? filters,
    PleromaChatOrderingTermData? orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbPleromaChatPopulated> stream = query.watchSingle().map(
          (typedResult) => dao.typedResultToPopulated(
            typedResult,
          ),
        );
    return stream.map(
      (dbChat) => mapDataClassToItem(
        dbChat,
      ),
    );
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
      return DbPleromaChatPopulatedWrapper(
        dbChatPopulated: await dao.findByRemoteId(
          dbChatAccount.chatRemoteId,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Future markAsRead({required IPleromaChat? chat}) {
    return updateById(
      chat!.localId,
      DbChat(
        id: chat.localId,
        remoteId: chat.remoteId,
        unread: 0,
        updatedAt: DateTime.now(),
        accountRemoteId: chat.accounts.first.remoteId,
      ),
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
}
