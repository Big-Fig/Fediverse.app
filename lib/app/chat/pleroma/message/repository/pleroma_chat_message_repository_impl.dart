import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_message_repository_impl.dart");

var _singlePleromaChatMessageRepositoryPagination =
    RepositoryPagination<IPleromaChatMessage>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class PleromaChatMessageRepository extends AsyncInitLoadingBloc
    implements IPleromaChatMessageRepository {
  ChatMessageDao dao;
  IAccountRepository accountRepository;

  PleromaChatMessageRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository,
  }) {
    dao = appDatabase.chatMessageDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteChatMessage(
    pleroma_lib.IPleromaChatMessage remoteChatMessage,
  ) async {
    _logger.finer(() => "upsertRemoteChatMessage $remoteChatMessage");
//    var remoteAccount = remoteChatMessage.account;
//
//    await accountRepository.upsertRemoteAccount(remoteAccount,
//        chatRemoteId: chatRemoteId);
//
    await upsert(
      mapRemoteChatMessageToDbPleromaChatMessage(
        remoteChatMessage,
      ),
    );
  }

  @override
  Future upsertRemoteChatMessages(
    List<pleroma_lib.IPleromaChatMessage> remoteChatMessages,
  ) async {
    _logger
        .finer(() => "upsertRemoteChatMessages ${remoteChatMessages.length}");
    if (remoteChatMessages.isEmpty) {
      return;
    }

//
//    List<IPleromaAccount> remoteAccounts = remoteChatMessages
//        .map((remoteChatMessage) => remoteChatMessage.account)
//        .toList();
//
//    await accountRepository.upsertRemoteAccounts(remoteAccounts,
//        chatRemoteId: chatRemoteId);

    await upsertAll(remoteChatMessages
        .map(mapRemoteChatMessageToDbPleromaChatMessage)
        .toList());
  }

  @override
  Future<DbChatMessagePopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(
          remoteId,
        ),
      );

  @override
  Future deleteByRemoteId(String remoteId) => dao.deleteByRemoteId(remoteId);

  @override
  Future<List<DbChatMessagePopulatedWrapper>> getChatMessages({
    @required PleromaChatMessageRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChatMessage> pagination,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return dao
        .typedResultListToPopulated(
          await query.get(),
        )
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbChatMessagePopulatedWrapper>> watchChatMessages({
    @required PleromaChatMessageRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChatMessage> pagination,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbChatMessagePopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery({
    @required PleromaChatMessageRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChatMessage> pagination,
    @required PleromaChatMessageOrderingTermData orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (filters?.onlyPendingStatePublishedOrNull == true) {
      dao.addOnlyPendingStatePublishedOrNull(query);
    }

    if (filters?.onlyNotDeleted == true) {
      dao.addOnlyNotDeletedWhere(query);
    }

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
          orderingTermData?.orderType == PleromaChatMessageOrderType.createdAt);
      dao.addCreatedAtBoundsWhere(
        query,
        maximumDateTimeExcluding: pagination?.olderThanItem?.createdAt,
        minimumDateTimeExcluding: pagination?.newerThanItem?.createdAt,
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
      dao.populateChatMessageJoin(),
    );

    var finalQuery = joinQuery;

    if (filters?.onlyInChats != null) {
      if (filters.onlyInChats.length == 1) {
        finalQuery = dao.addChatWhere(
          finalQuery,
          filters.onlyInChats.first.remoteId,
        );
      } else {
        finalQuery = dao.addChatsWhere(
          finalQuery,
          filters.onlyInChats.map(
            (chat) => chat.remoteId,
          ),
        );
      }
    }

    if (pagination?.limit != null) {
      finalQuery.limit(pagination?.limit, offset: pagination?.offset);
    }
    return finalQuery;
  }

  @override
  Future upsertAll(Iterable<DbChatMessage> items) async {
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
  Future insertAll(Iterable<DbChatMessage> items) async {
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
  Future<IPleromaChatMessage> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbChatMessagePopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<IPleromaChatMessage> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<IPleromaChatMessage> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async {
    _logger.finest(() => "findByOldPendingRemoteId $oldPendingRemoteId");
    return mapDataClassToItem(
        await dao.findByOldPendingRemoteId(oldPendingRemoteId));
  }

  @override
  Stream<IPleromaChatMessage> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) {
    _logger.finest(() => "watchByOldPendingRemoteId $oldPendingRemoteId");
    return (dao.watchByOldPendingRemoteId(oldPendingRemoteId))
        .map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbChatMessagePopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbChatMessagePopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbChatMessage item) => dao.insert(item);

  @override
  Future<int> upsert(DbChatMessage item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbChatMessage dbChatMessage) {
    if (dbChatMessage.id != id) {
      dbChatMessage = dbChatMessage.copyWith(id: id);
    }
    return dao.replace(dbChatMessage);
  }

  DbChatMessagePopulatedWrapper mapDataClassToItem(
      DbChatMessagePopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbChatMessagePopulatedWrapper(dataClass);
  }

  Insertable<DbChatMessage> mapItemToDataClass(
      DbChatMessagePopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbChatMessagePopulated.dbChatMessage;
  }

  @override
  Future updateLocalChatMessageByRemoteChatMessage({
    @required IPleromaChatMessage oldLocalChatMessage,
    @required pleroma_lib.IPleromaChatMessage newRemoteChatMessage,
  }) async {
    _logger.finer(() => "updateLocalChatMessageByRemoteChatMessage \n"
        "\t old: $oldLocalChatMessage \n"
        "\t newRemoteChatMessage: $newRemoteChatMessage");

//    var remoteAccount = newRemoteChatMessage.account;
//
//    await accountRepository.upsertRemoteAccount(remoteAccount,
//        chatRemoteId: oldLocalChatMessage.remoteId, conversationRemoteId: null);

    await updateById(
      oldLocalChatMessage.localId,
      mapRemoteChatMessageToDbPleromaChatMessage(
        newRemoteChatMessage,
      ),
    );
  }

  @override
  Future<DbChatMessagePopulatedWrapper> getChatMessage({
    @required PleromaChatMessageRepositoryFilters filters,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatMessageRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return mapDataClassToItem(
      dao.typedResultToPopulated(
        await query.getSingle(),
      ),
    );
  }

  @override
  Stream<DbChatMessagePopulatedWrapper> watchChatMessage({
    @required PleromaChatMessageRepositoryFilters filters,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatMessageRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbChatMessagePopulated> stream = query.watchSingle().map(
          (typedResult) => dao.typedResultToPopulated(
            typedResult,
          ),
        );
    return stream.map(
      (dbChatMessage) => mapDataClassToItem(
        dbChatMessage,
      ),
    );
  }

  @override
  Future<IPleromaChatMessage> getChatLastChatMessage({
    @required IPleromaChat chat,
  }) =>
      getChatMessage(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: false,
          onlyNotDeleted: true,
        ),
        orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
      );

  @override
  Stream<IPleromaChatMessage> watchChatLastChatMessage({
    @required IPleromaChat chat,
  }) =>
      watchChatMessage(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: false,
          onlyNotDeleted: true,
        ),
        orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
      );

  @override
  Future<Map<IPleromaChat, IPleromaChatMessage>> getChatsLastChatMessage({
    @required List<IPleromaChat> chats,
  }) async {
    var query = createQuery(
      filters: PleromaChatMessageRepositoryFilters(
        onlyPendingStatePublishedOrNull: false,
        onlyNotDeleted: true,
      ),
      pagination: null,
      orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
    );
    dao.addGroupByChatId(query);

    var chatMessages = dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();

    Map<IPleromaChat, IPleromaChatMessage> result = {};

    chats.forEach(
      (chat) {
        var currentChatMessages = chatMessages.where(
          (chatMessage) => chatMessage.chatRemoteId == chat.remoteId,
        );

        IPleromaChatMessage chatMessage = currentChatMessages?.fold(
          null,
          (IPleromaChatMessage previousValue, IPleromaChatMessage element) {
            if (previousValue == null) {
              return element;
            } else {
              if (previousValue.createdAt.isBefore(element.createdAt)) {
                return element;
              } else {
                return previousValue;
              }
            }
          },
        );

        result[chat] = chatMessage;
      },
    );

    return result;
  }

  @override
  Future markChatMessageAsDeleted({
    @required String chatMessageRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: chatMessageRemoteId,
      );
}
