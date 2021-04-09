import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
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

class PleromaChatMessageRepository
    extends PopulatedAppRemoteDatabaseDaoRepository<
        DbChatMessage,
        DbChatMessagePopulated,
        IPleromaChatMessage,
        pleroma_lib.IPleromaChatMessage,
        int,
        String,
        $DbChatMessagesTable,
        $DbChatMessagesTable>
    implements IPleromaChatMessageRepository {
  @override
  late ChatMessageDao dao;
  late IAccountRepository accountRepository;

  PleromaChatMessageRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
  }) {
    dao = appDatabase.chatMessageDao;
  }

  @override
  Future upsertRemoteChatMessage(
      pleroma_lib.IPleromaChatMessage remoteChatMessage,) async {
    _logger.finer(() => "upsertRemoteChatMessage $remoteChatMessage");

    await upsertInRemoteType(
      remoteChatMessage,
    );
  }

  @override
  Future upsertRemoteChatMessages(
      List<pleroma_lib.IPleromaChatMessage> pleromaChatMessages,) async {
    _logger
        .finer(() => "upsertRemoteChatMessages ${pleromaChatMessages.length}");
    if (pleromaChatMessages.isEmpty) {
      return;
    }
    await upsertAllInRemoteType(pleromaChatMessages);
  }

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
          (typedResultList) =>
          typedResultList.toDbChatMessagePopulatedList(
            dao: dao,
          ),
    );
    return stream.map(
          (list) =>
          list
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
  Future<IPleromaChatMessage?> findByOldPendingRemoteId(
      String oldPendingRemoteId,) async {
    _logger.finest(() => "findByOldPendingRemoteId $oldPendingRemoteId");
    return (await dao.findByOldPendingRemoteId(oldPendingRemoteId))
        ?.toDbChatMessagePopulatedWrapper();
  }

  @override
  Stream<IPleromaChatMessage?> watchByOldPendingRemoteId(
      String? oldPendingRemoteId,) {
    _logger.finest(() => "watchByOldPendingRemoteId $oldPendingRemoteId");
    return dao.watchByOldPendingRemoteId(oldPendingRemoteId).map(
          (item) => item?.toDbChatMessagePopulatedWrapper(),
    );
  }

  Insertable<DbChatMessage>? mapItemToDataClass(
      DbPleromaChatMessagePopulatedWrapper item,) {
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

    await updateByDbIdInDbType(
      dbId: oldLocalChatMessage.localId!,
      dbItem: newRemoteChatMessage.toDbChatMessage(),
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
              (IPleromaChatMessage? previousValue,
              IPleromaChatMessage element) {
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
    required String chatMessageRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: chatMessageRemoteId,
      );

  @override
  Future markChatMessageAsHiddenLocallyOnDevice({
    required int chatMessageLocalId,
  }) =>
      dao.markAsHiddenLocallyOnDevice(
        localId: chatMessageLocalId,
      );

  @override
  DbChatMessage mapAppItemToDbItem(IPleromaChatMessage appItem) =>
      appItem.toDbChatMessage();

  @override
  pleroma_lib.IPleromaChatMessage mapAppItemToRemoteItem(
      IPleromaChatMessage appItem) =>
      appItem.toPleromaChatMessage();

  @override
  DbChatMessagePopulated mapAppItemToDbPopulatedItem(
      IPleromaChatMessage appItem) => appItem.toDbChatMessagePopulated();

  @override
  IPleromaChatMessage mapDbPopulatedItemToAppItem(
      DbChatMessagePopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbChatMessagePopulatedWrapper();

  @override
  pleroma_lib.IPleromaChatMessage mapDbPopulatedItemToRemoteItem(
      DbChatMessagePopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbChatMessagePopulatedWrapper().toPleromaChatMessage();

}

extension DbChatMessagePopulatedListExtension on List<DbChatMessagePopulated> {
  List<DbPleromaChatMessagePopulatedWrapper>
  toDbChatMessagePopulatedWrappers() =>
      map(
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
