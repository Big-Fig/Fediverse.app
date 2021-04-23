import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/database/pleroma_chat_message_database_dao.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_message_repository_impl.dart");

class PleromaChatMessageRepository
    extends PopulatedAppRemoteDatabaseDaoRepository<
        DbChatMessage,
        DbChatMessagePopulated,
        IPleromaChatMessage,
        pleroma_lib.IPleromaChatMessage,
        int,
        String,
        $DbChatMessagesTable,
        $DbChatMessagesTable,
        PleromaChatMessageRepositoryFilters,
        PleromaChatMessageRepositoryOrderingTermData>
    implements IPleromaChatMessageRepository {
  @override
  late ChatMessageDao dao;
  late IAccountRepository accountRepository;

  @override
  PopulatedDatabaseDaoMixin<
      DbChatMessage,
      DbChatMessagePopulated,
      int,
      $DbChatMessagesTable,
      $DbChatMessagesTable,
      PleromaChatMessageRepositoryFilters,
      PleromaChatMessageRepositoryOrderingTermData> get populatedDao => dao;

  PleromaChatMessageRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
  }) {
    dao = appDatabase.chatMessageDao;
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
  Future<IPleromaChatMessage?> getChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      findInAppType(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTerms: [
          PleromaChatMessageRepositoryOrderingTermData.createdAtDesc,
        ],
        pagination: RepositoryPagination(limit: 1),
      );

  @override
  Stream<IPleromaChatMessage?> watchChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      watchFindInAppType(
        filters: PleromaChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTerms: [
          PleromaChatMessageRepositoryOrderingTermData.createdAtDesc,
        ],
        pagination: RepositoryPagination(limit: 1),
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
        groupByChatId: true,
      ),
      pagination: null,
      orderingTermData:
          PleromaChatMessageRepositoryOrderingTermData.createdAtDesc,
    );

    var chatMessages = await query.get();

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
          IPleromaChatMessage appItem) =>
      appItem.toDbChatMessagePopulated();

  @override
  IPleromaChatMessage mapDbPopulatedItemToAppItem(
          DbChatMessagePopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbChatMessagePopulatedWrapper();

  @override
  pleroma_lib.IPleromaChatMessage mapDbPopulatedItemToRemoteItem(
          DbChatMessagePopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbChatMessagePopulatedWrapper().toPleromaChatMessage();

  @override
  IPleromaChatMessage mapRemoteItemToAppItem(
    pleroma_lib.IPleromaChatMessage appItem,
  ) {
    return appItem.toDbChatMessagePopulatedWrapper(
      dbAccount: null,
    );
  }

  @override
  PleromaChatMessageRepositoryFilters get emptyFilters =>
      PleromaChatMessageRepositoryFilters.empty;

  @override
  List<PleromaChatMessageRepositoryOrderingTermData> get defaultOrderingTerms =>
      PleromaChatMessageRepositoryOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbChatMessage> dbItem, {
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
    pleroma_lib.IPleromaChatMessage remoteItem, {
    required InsertMode? mode,
  })  =>
      insertInDbType(
        mapRemoteItemToDbItem(
          remoteItem,
        ),
        mode: mode,
      );


  @override
  Future<void> insertInRemoteTypeBatch(
    pleroma_lib.IPleromaChatMessage remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) {
    return upsertInDbTypeBatch(
      mapRemoteItemToDbItem(
        remoteItem,
      ),
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IPleromaChatMessage appItem,
    required pleroma_lib.IPleromaChatMessage remoteItem,
    required Batch? batchTransaction,
  })  =>
      updateByDbIdInDbType(
        dbId: appItem.localId!,
        dbItem: remoteItem.toDbChatMessage(),
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbChatMessage dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );
}

extension DbChatMessagePopulatedListExtension on List<DbChatMessagePopulated> {
  List<DbPleromaChatMessagePopulatedWrapper>
      toDbChatMessagePopulatedWrappers() => map(
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
