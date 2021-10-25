import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/chat/unifedi/message/database/unifedi_chat_message_database_dao.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model_adapter.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi_app/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('unifedi_chat_message_repository_impl.dart');

class UnifediChatMessageRepository
    extends PopulatedAppRemoteDatabaseDaoRepository<
        DbChatMessage,
        DbChatMessagePopulated,
        IUnifediChatMessage,
        IUnifediApiChatMessage,
        int,
        String,
        $DbChatMessagesTable,
        $DbChatMessagesTable,
        UnifediChatMessageRepositoryFilters,
        UnifediChatMessageRepositoryOrderingTermData>
    implements IUnifediChatMessageRepository {
  @override
  final ChatMessageDao dao;
  final IAccountRepository accountRepository;

  @override
  PopulatedDatabaseDaoMixin<
      DbChatMessage,
      DbChatMessagePopulated,
      int,
      $DbChatMessagesTable,
      $DbChatMessagesTable,
      UnifediChatMessageRepositoryFilters,
      UnifediChatMessageRepositoryOrderingTermData> get populatedDao => dao;

  UnifediChatMessageRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
  }) : dao = appDatabase.chatMessageDao;

  @override
  Future<IUnifediChatMessage?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async {
    _logger.finest(() => 'findByOldPendingRemoteId $oldPendingRemoteId');

    return (await dao.findByOldPendingRemoteId(oldPendingRemoteId))
        ?.toDbChatMessagePopulatedWrapper();
  }

  @override
  Stream<IUnifediChatMessage?> watchByOldPendingRemoteId(
    String? oldPendingRemoteId,
  ) {
    _logger.finest(() => 'watchByOldPendingRemoteId $oldPendingRemoteId');

    return dao.watchByOldPendingRemoteId(oldPendingRemoteId).map(
          (item) => item?.toDbChatMessagePopulatedWrapper(),
        );
  }

  @override
  Future<IUnifediChatMessage?> getChatLastChatMessage({
    required IUnifediChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      findInAppType(
        filters: UnifediChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTerms: [
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
        ],
        pagination: const RepositoryPagination(limit: 1),
      );

  @override
  Stream<IUnifediChatMessage?> watchChatLastChatMessage({
    required IUnifediChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      watchFindInAppType(
        filters: UnifediChatMessageRepositoryFilters(
          onlyInChats: [
            chat,
          ],
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
          onlyNotDeleted: true,
          onlyNotHiddenLocallyOnDevice: true,
        ),
        orderingTerms: [
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
        ],
        pagination: const RepositoryPagination(limit: 1),
      );

  @override
  Future<Map<IUnifediChat, IUnifediChatMessage?>> getChatsLastChatMessage({
    required List<IUnifediChat> chats,
    bool onlyPendingStatePublishedOrNull = false,
  }) async {
    var query = createQuery(
      filters: UnifediChatMessageRepositoryFilters.only(
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        onlyNotDeleted: true,
        onlyNotHiddenLocallyOnDevice: true,
        groupByChatId: true,
      ),
      pagination: null,
      orderingTermData:
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
    );

    var chatMessages = await query.get();

    var result = <IUnifediChat, IUnifediChatMessage?>{};

    for (final chat in chats) {
      var currentChatMessages = chatMessages.where(
        (chatMessage) => chatMessage.chatRemoteId == chat.remoteId,
      );

      var chatMessage = currentChatMessages.fold(
        null,
        (IUnifediChatMessage? previousValue, IUnifediChatMessage element) {
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
    }

    return result;
  }

  @override
  Future<void> markChatMessageAsDeleted({
    required String chatMessageRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: chatMessageRemoteId,
      );

  @override
  Future<void> markChatMessageAsHiddenLocallyOnDevice({
    required int chatMessageLocalId,
  }) =>
      dao.markAsHiddenLocallyOnDevice(
        localId: chatMessageLocalId,
      );

  @override
  DbChatMessage mapAppItemToDbItem(IUnifediChatMessage appItem) =>
      appItem.toDbChatMessage();

  @override
  IUnifediApiChatMessage mapAppItemToRemoteItem(
    IUnifediChatMessage appItem,
  ) =>
      appItem.toUnifediApiChatMessage();

  @override
  DbChatMessagePopulated mapAppItemToDbPopulatedItem(
    IUnifediChatMessage appItem,
  ) =>
      appItem.toDbChatMessagePopulated();

  @override
  IUnifediChatMessage mapDbPopulatedItemToAppItem(
    DbChatMessagePopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbChatMessagePopulatedWrapper();

  @override
  IUnifediApiChatMessage mapDbPopulatedItemToRemoteItem(
    DbChatMessagePopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem
          .toDbChatMessagePopulatedWrapper()
          .toUnifediApiChatMessage();

  @override
  IUnifediChatMessage mapRemoteItemToAppItem(
    IUnifediApiChatMessage remoteItem,
  ) =>
      remoteItem.toDbChatMessagePopulatedWrapper(
        dbAccount: null,
      );

  @override
  UnifediChatMessageRepositoryFilters get emptyFilters =>
      UnifediChatMessageRepositoryFilters.empty;

  @override
  List<UnifediChatMessageRepositoryOrderingTermData> get defaultOrderingTerms =>
      UnifediChatMessageRepositoryOrderingTermData.defaultTerms;

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
    IUnifediApiChatMessage remoteItem, {
    required InsertMode? mode,
  }) =>
      insertInDbType(
        mapRemoteItemToDbItem(
          remoteItem,
        ),
        mode: mode,
      );

  @override
  Future<void> insertInRemoteTypeBatch(
    IUnifediApiChatMessage remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      upsertInDbTypeBatch(
        mapRemoteItemToDbItem(
          remoteItem,
        ),
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> updateAppTypeByRemoteType({
    required IUnifediChatMessage appItem,
    required IUnifediApiChatMessage remoteItem,
    required Batch? batchTransaction,
  }) =>
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
  List<DbUnifediChatMessagePopulatedWrapper>
      toDbChatMessagePopulatedWrappers() => map(
            (dbChatMessagePopulated) =>
                dbChatMessagePopulated.toDbChatMessagePopulatedWrapper(),
          ).toList();
}

extension DbChatMessagePopulatedExtension on DbChatMessagePopulated {
  DbUnifediChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper() =>
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: this,
      );
}
