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
  late ChatMessageDao dao;
  IAccountRepository? accountRepository;

  PleromaChatMessageRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
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

    await upsert(
      remoteChatMessage.toDbChatMessage(),
    );
  }

  @override
  Future upsertRemoteChatMessages(
    List<pleroma_lib.IPleromaChatMessage> pleromaChatMessages,
  ) async {
    _logger
        .finer(() => "upsertRemoteChatMessages ${pleromaChatMessages.length}");
    if (pleromaChatMessages.isEmpty) {
      return;
    }
    await upsertAll(pleromaChatMessages
        .map(
          (pleromaChatMessage) => pleromaChatMessage.toDbChatMessage(),
        )
        .toList());
  }

  @override
  Future<DbPleromaChatMessagePopulatedWrapper?> findByRemoteId(
    String remoteId,
  ) async {
    var dbChatMessagePopulated = await dao.findByRemoteId(
      remoteId,
    );

    return dbChatMessagePopulated?.toDbChatMessagePopulatedWrapper();
  }

  @override
  Future deleteByRemoteId(String remoteId) => dao.deleteByRemoteId(remoteId);

  @override
  Future<List<DbPleromaChatMessagePopulatedWrapper>> getChatMessages({
    required PleromaChatMessageRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChatMessage>? pagination,
    PleromaChatMessageOrderingTermData? orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedResultList = await query.get();

    return typedResultList
        .toDbChatMessagePopulatedList(
          dao: dao,
        )
        .toDbChatMessagePopulatedWrappers();
  }

  @override
  Stream<List<DbPleromaChatMessagePopulatedWrapper>> watchChatMessages({
    required PleromaChatMessageRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChatMessage>? pagination,
    PleromaChatMessageOrderingTermData? orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbChatMessagePopulated>> stream = query.watch().map(
          (typedResultList) => typedResultList.toDbChatMessagePopulatedList(
            dao: dao,
          ),
        );
    return stream.map(
      (list) => list
          .map(
            (list) => list.toDbChatMessagePopulatedWrapper(),
          )
          .toList(),
    );
  }

  JoinedSelectStatement createQuery({
    required PleromaChatMessageRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChatMessage>? pagination,
    required PleromaChatMessageOrderingTermData? orderingTermData,
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

    if (filters?.onlyNotHiddenLocallyOnDevice == true) {
      dao.addOnlyNotHiddenLocallyOnDevice(query);
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

    var onlyInChats = filters?.onlyInChats;
    if (onlyInChats != null) {
      if (onlyInChats.length == 1) {
        finalQuery = dao.addChatWhere(
          finalQuery,
          onlyInChats.first.remoteId,
        );
      } else {
        finalQuery = dao.addChatsWhere(
          finalQuery,
          onlyInChats
              .map(
                (chat) => chat.remoteId,
              )
              .toList(),
        );
      }
    }

    var limit = pagination?.limit;
    if (limit != null) {
      finalQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return finalQuery;
  }

  @override
  Future upsertAll(List<DbChatMessage> items) async {
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
  Future insertAll(List<DbChatMessage> items) async {
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
  Future<IPleromaChatMessage?> findById(int id) async =>
      (await dao.findById(id))?.toDbChatMessagePopulatedWrapper();

  @override
  Stream<DbPleromaChatMessagePopulatedWrapper?> watchById(int id) =>
      (dao.watchById(id)).map(
        (item) => item?.toDbChatMessagePopulatedWrapper(),
      );

  @override
  Stream<IPleromaChatMessage?> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(
      (item) => item?.toDbChatMessagePopulatedWrapper(),
    );
  }

  @override
  Future<IPleromaChatMessage?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async {
    _logger.finest(() => "findByOldPendingRemoteId $oldPendingRemoteId");
    return (await dao.findByOldPendingRemoteId(oldPendingRemoteId))
        ?.toDbChatMessagePopulatedWrapper();
  }

  @override
  Stream<IPleromaChatMessage?> watchByOldPendingRemoteId(
    String? oldPendingRemoteId,
  ) {
    _logger.finest(() => "watchByOldPendingRemoteId $oldPendingRemoteId");
    return dao.watchByOldPendingRemoteId(oldPendingRemoteId).map(
          (item) => item?.toDbChatMessagePopulatedWrapper(),
        );
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbPleromaChatMessagePopulatedWrapper>> getAll() async =>
      (await dao.findAll()).toDbChatMessagePopulatedWrappers();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbPleromaChatMessagePopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map(
        (items) => items.toDbChatMessagePopulatedWrappers(),
      );

  @override
  Future<int> insert(DbChatMessage item) => dao.insert(item);

  @override
  Future<int> upsert(DbChatMessage item) => dao.upsert(item);

  @override
  Future<bool> updateById(int? id, DbChatMessage dbChatMessage) {
    if (dbChatMessage.id != id) {
      dbChatMessage = dbChatMessage.copyWith(id: id);
    }
    return dao.replace(dbChatMessage);
  }

  Insertable<DbChatMessage>? mapItemToDataClass(
    DbPleromaChatMessagePopulatedWrapper item,
  ) {
    return item.dbChatMessagePopulated.dbChatMessage;
  }

  @override
  Future updateLocalChatMessageByRemoteChatMessage({
    required IPleromaChatMessage oldLocalChatMessage,
    required pleroma_lib.IPleromaChatMessage newRemoteChatMessage,
  }) async {
    _logger.finer(() => "updateLocalChatMessageByRemoteChatMessage \n"
        "\t old: $oldLocalChatMessage \n"
        "\t newRemoteChatMessage: $newRemoteChatMessage");

    await updateById(
      oldLocalChatMessage.localId,
      newRemoteChatMessage.toDbChatMessage(),
    );
  }

  @override
  Future<DbPleromaChatMessagePopulatedWrapper?> getChatMessage({
    required PleromaChatMessageRepositoryFilters? filters,
    PleromaChatMessageOrderingTermData? orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatMessageRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return (await query.getSingleOrNull())
        ?.toDbChatMessagePopulated(dao: dao)
        .toDbChatMessagePopulatedWrapper();
  }

  @override
  Stream<DbPleromaChatMessagePopulatedWrapper?> watchChatMessage({
    required PleromaChatMessageRepositoryFilters? filters,
    PleromaChatMessageOrderingTermData? orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singlePleromaChatMessageRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbChatMessagePopulated?> stream = query.watchSingleOrNull().map(
          (typedResult) => typedResult?.toDbChatMessagePopulated(dao: dao),
        );
    return stream.map(
      (item) => item?.toDbChatMessagePopulatedWrapper(),
    );
  }

  @override
  Future<IPleromaChatMessage?> getChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      getChatMessage(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
      );

  @override
  Stream<IPleromaChatMessage?> watchChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      watchChatMessage(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
      );

  @override
  Future<Map<IPleromaChat, IPleromaChatMessage?>> getChatsLastChatMessage({
    required List<IPleromaChat> chats,
    bool onlyPendingStatePublishedOrNull = false,
  }) async {
    var query = createQuery(
      filters: PleromaChatMessageRepositoryFilters(
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        onlyNotDeleted: true,
        onlyNotHiddenLocallyOnDevice: true,
      ),
      pagination: null,
      orderingTermData: PleromaChatMessageOrderingTermData.createdAtDesc,
    );
    dao.addGroupByChatId(query);

    var chatMessages = (await query.get())
        .toDbChatMessagePopulatedList(dao: dao)
        .toDbChatMessagePopulatedWrappers();

    Map<IPleromaChat, IPleromaChatMessage?> result = {};

    chats.forEach(
      (chat) {
        var currentChatMessages = chatMessages.where(
          (chatMessage) => chatMessage.chatRemoteId == chat.remoteId,
        );

        IPleromaChatMessage? chatMessage = currentChatMessages.fold(
          null,
          (IPleromaChatMessage? previousValue, IPleromaChatMessage element) {
            if (previousValue == null) {
              return element;
            } else {
              if (previousValue.createdAt.isBefore(
                element.createdAt,
              )) {
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
    required String? chatMessageRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: chatMessageRemoteId,
      );

  @override
  Future markChatMessageAsHiddenLocallyOnDevice({
    required int? chatMessageLocalId,
  }) =>
      dao.markAsHiddenLocallyOnDevice(
        localId: chatMessageLocalId,
      );
}

extension DbChatMessagePopulatedListExtension on List<DbChatMessagePopulated> {
  List<DbPleromaChatMessagePopulatedWrapper> toDbChatMessagePopulatedWrappers() => map(
        (dbChatMessagePopulated) =>
            dbChatMessagePopulated.toDbChatMessagePopulatedWrapper(),
      ).toList();
}

extension DbChatMessagePopulatedExtension on DbChatMessagePopulated {
  DbPleromaChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper() =>
      DbPleromaChatMessagePopulatedWrapper(
        dbChatMessagePopulated: this,
      );
}
