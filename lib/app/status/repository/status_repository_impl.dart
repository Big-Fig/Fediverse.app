import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_dao.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_dao.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger('status_repository_impl.dart');

class StatusRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbStatus,
    DbStatusPopulated,
    IStatus,
    IPleromaApiStatus,
    int,
    String,
    $DbStatusesTable,
    $DbStatusesTable,
    StatusRepositoryFilters,
    StatusRepositoryOrderingTermData> implements IStatusRepository {
  @override
  final StatusDao dao;
  final StatusHashtagsDao hashtagsDao;
  final StatusListsDao listsDao;
  final HomeTimelineStatusesDao homeTimelineStatusesDao;
  final ConversationStatusesDao conversationStatusesDao;
  final IAccountRepository accountRepository;

  @override
  PopulatedDatabaseDaoMixin<
      DbStatus,
      DbStatusPopulated,
      int,
      $DbStatusesTable,
      $DbStatusesTable,
      StatusRepositoryFilters,
      StatusRepositoryOrderingTermData> get populatedDao => dao;

  StatusRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
  })  : dao = appDatabase.statusDao,
        hashtagsDao = appDatabase.statusHashtagsDao,
        listsDao = appDatabase.statusListsDao,
        homeTimelineStatusesDao = appDatabase.homeTimelineStatusesDao,
        conversationStatusesDao = appDatabase.conversationStatusesDao;

  Future addStatusesToList({
    required List<String> statusRemoteIds,
    required String listRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (statusRemoteIds.isNotEmpty) {
      await listsDao.insertAll(
        entities: statusRemoteIds
            .map(
              (statusRemoteId) => DbStatusList(
                id: null,
                statusRemoteId: statusRemoteId,
                listRemoteId: listRemoteId,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
    }
  }

  @override
  Future addStatusesToConversation({
    required List<String> statusRemoteIds,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (statusRemoteIds.isNotEmpty) {
      var items = statusRemoteIds
          .map(
            (statusRemoteId) => DbConversationStatus(
              id: null,
              statusRemoteId: statusRemoteId,
              conversationRemoteId: conversationRemoteId,
            ),
          )
          .toList();

      await conversationStatusesDao.insertAll(
        entities: items,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
    }
  }

  Future updateStatusTags({
    required String statusRemoteId,
    required List<IPleromaApiTag>? tags,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      hashtagsDao.deleteByStatusRemoteIdBatch(
        statusRemoteId,
        batchTransaction: batchTransaction,
      );
      tags ??= [];
      // ignore: unawaited_futures
      hashtagsDao.insertAll(
        entities: tags
            .map(
              (remoteTag) => DbStatusHashtag(
                id: null,
                statusRemoteId: statusRemoteId,
                hashtag: remoteTag.name,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
    } else {
      await batch((batch) {
        updateStatusTags(
          statusRemoteId: statusRemoteId,
          tags: tags,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future incrementRepliesCount({
    required String remoteId,
  }) =>
      dao.incrementRepliesCount(
        remoteId: remoteId,
      );

  @override
  Future removeAccountStatusesFromHome({
    required String accountRemoteId,
    required Batch? batchTransaction,
  }) =>
      homeTimelineStatusesDao.deleteByAccountRemoteIdBatch(
        accountRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  Future markStatusAsDeleted({
    required String statusRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: statusRemoteId,
      );

  @override
  Future markStatusAsHiddenLocallyOnDevice({
    required int localId,
  }) =>
      dao.markAsHiddenLocallyOnDevice(
        localId: localId,
      );

  @override
  Future clearListStatusesConnection({
    required String listRemoteId,
    required Batch? batchTransaction,
  }) async {
    await listsDao.deleteByListRemoteIdBatch(
      listRemoteId,
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future<IStatus?> getConversationLastStatus({
    required IConversationChat conversation,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      findInAppType(
        filters: StatusRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        ),
        orderingTerms: [
          StatusRepositoryOrderingTermData.createdAtDesc,
        ],
        // pagination: null,
        pagination: RepositoryPagination(limit: 1),
      );

  @override
  Stream<IStatus?> watchConversationLastStatus({
    required IConversationChat conversation,
    bool onlyPendingStatePublishedOrNull = false,
  }) =>
      watchFindInAppType(
        filters: StatusRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
          onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        ),
        orderingTerms: [
          StatusRepositoryOrderingTermData.createdAtDesc,
        ],
        // pagination: null,
        pagination: RepositoryPagination(limit: 1),
      );

  @override
  Future<Map<IConversationChat, IStatus?>> getConversationsLastStatus({
    required List<IConversationChat> conversations,
    bool onlyPendingStatePublishedOrNull = false,
  }) async {
    var query = createFindInTypedResultSelectable(
      filters: StatusRepositoryFilters.createForMustBeConversationItem(
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      ),
      pagination: null,
      orderingTerms: [
        StatusRepositoryOrderingTermData.createdAtDesc,
      ],
    );

    var typedResultList = await query.get();

    var result = <IConversationChat, IStatus?>{};

    conversations.forEach(
      (conversation) {
        var typedResult = typedResultList.firstWhereOrNull(
          (typedResult) {
            var conversationStatuses =
                typedResult.readTable(dao.conversationStatusesAlias);

            return conversationStatuses.conversationRemoteId ==
                conversation.remoteId;
          },
        );

        IStatus? status = typedResult
            ?.toDbStatusPopulated(dao: dao)
            .toDbStatusPopulatedWrapper();

        result[conversation] = status;
      },
    );

    return result;
  }

  @override
  Future<IStatus?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) async {
    _logger.finest(() => 'findByOldPendingRemoteId $oldPendingRemoteId');

    return (await dao.findByOldPendingRemoteId(oldPendingRemoteId))
        ?.toDbStatusPopulatedWrapper();
  }

  @override
  Stream<IStatus?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) {
    _logger.finest(() => 'watchByOldPendingRemoteId $oldPendingRemoteId');

    return dao.watchByOldPendingRemoteId(oldPendingRemoteId).map(
          (value) => value?.toDbStatusPopulatedWrapper(),
        );
  }

  @override
  Future addStatusToConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) =>
      conversationStatusesDao.insertBatch(
        entity: DbConversationStatus(
          id: null,
          conversationRemoteId: conversationRemoteId,
          statusRemoteId: statusRemoteId,
        ),
        mode: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future removeStatusFromConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) =>
      conversationStatusesDao.deleteByConversationRemoteIdBatch(
        conversationRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  DbStatus mapAppItemToDbItem(IStatus appItem) => appItem.toDbStatus();

  @override
  IPleromaApiStatus mapAppItemToRemoteItem(IStatus appItem) =>
      appItem.toPleromaApiStatus();

  @override
  DbStatusPopulated mapAppItemToDbPopulatedItem(IStatus appItem) =>
      appItem.toDbStatusPopulated();

  @override
  IStatus mapDbPopulatedItemToAppItem(DbStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbStatusPopulatedWrapper();

  @override
  IPleromaApiStatus mapDbPopulatedItemToRemoteItem(
    DbStatusPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbStatusPopulatedWrapper().toPleromaApiStatus();

  @override
  IStatus mapRemoteItemToAppItem(IPleromaApiStatus remoteItem) =>
      remoteItem.toDbStatusPopulatedWrapper();

  @override
  StatusRepositoryFilters get emptyFilters => StatusRepositoryFilters.empty;

  @override
  List<StatusRepositoryOrderingTermData> get defaultOrderingTerms =>
      StatusRepositoryOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbStatus> dbItem, {
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
    IPleromaApiStatus remoteItem, {
    required InsertMode? mode,
  }) async {
    await _upsertStatusMetadata(
      remoteItem,
      batchTransaction: null,
      conversationRemoteId: null,
      listRemoteId: null,
      isFromHomeTimeline: null,
    );

    return await dao.upsert(
      entity: remoteItem.toDbStatus(),
    );
  }

  @override
  Future<void> insertInRemoteTypeBatch(
    IPleromaApiStatus remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // todo: support mode
      // ignore: unawaited_futures
      _upsertStatusMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
        listRemoteId: null,
        conversationRemoteId: null,
        isFromHomeTimeline: null,
      );

      // ignore: unawaited_futures
      dao.upsertBatch(
        entity: remoteItem.toDbStatus(),
        batchTransaction: batchTransaction,
      );
    } else {
      await batch(
        (batch) {
          insertInRemoteTypeBatch(
            remoteItem,
            mode: mode,
            batchTransaction: batch,
          );
        },
      );
    }
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IStatus appItem,
    required IPleromaApiStatus remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      _upsertStatusMetadata(
        remoteItem,
        batchTransaction: batchTransaction,
        isFromHomeTimeline: null,
        listRemoteId: null,
        conversationRemoteId: null,
      );

      if (appItem.localId != null) {
        // ignore: unawaited_futures
        updateByDbIdInDbType(
          dbId: appItem.localId!,
          dbItem: remoteItem.toDbStatus(),
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
    required DbStatus dbItem,
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem.copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusWithAllArguments(
    IPleromaApiStatus remoteStatus, {
    required bool? isFromHomeTimeline,
    required String? listRemoteId,
    required String? conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // todo: support mode
      // ignore: unawaited_futures
      _upsertStatusMetadata(
        remoteStatus,
        listRemoteId: listRemoteId,
        conversationRemoteId: conversationRemoteId,
        isFromHomeTimeline: isFromHomeTimeline,
        batchTransaction: batchTransaction,
      );

      // ignore: unawaited_futures
      dao.upsertBatch(
        entity: remoteStatus.toDbStatus(),
        batchTransaction: batchTransaction,
      );
    } else {
      await batch(
        (batch) {
          upsertRemoteStatusWithAllArguments(
            remoteStatus,
            listRemoteId: listRemoteId,
            conversationRemoteId: conversationRemoteId,
            isFromHomeTimeline: isFromHomeTimeline,
            batchTransaction: batch,
          );
        },
      );
    }
  }

  @override
  Future upsertRemoteStatusForConversation(
    IPleromaApiStatus remoteStatus, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteStatusWithAllArguments(
        remoteStatus,
        conversationRemoteId: conversationRemoteId,
        isFromHomeTimeline: null,
        listRemoteId: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusForHomeTimeline(
    IPleromaApiStatus remoteStatus, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteStatusWithAllArguments(
        remoteStatus,
        conversationRemoteId: null,
        isFromHomeTimeline: isFromHomeTimeline,
        listRemoteId: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusForList(
    IPleromaApiStatus remoteStatus, {
    required String listRemoteId,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteStatusWithAllArguments(
        remoteStatus,
        conversationRemoteId: null,
        isFromHomeTimeline: null,
        listRemoteId: listRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusesForConversation(
    List<IPleromaApiStatus> remoteStatuses, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteStatusesWithAllArguments(
        remoteStatuses,
        listRemoteId: null,
        conversationRemoteId: conversationRemoteId,
        isFromHomeTimeline: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusesForHomeTimeline(
    List<IPleromaApiStatus> remoteStatuses, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteStatusesWithAllArguments(
        remoteStatuses,
        listRemoteId: null,
        conversationRemoteId: null,
        isFromHomeTimeline: isFromHomeTimeline,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertRemoteStatusesForList(
    List<IPleromaApiStatus> remoteStatuses, {
    required String listRemoteId,
    required Batch? batchTransaction,
  }) async =>
      upsertRemoteStatusesWithAllArguments(
        remoteStatuses,
        listRemoteId: listRemoteId,
        conversationRemoteId: null,
        isFromHomeTimeline: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future insertAllInRemoteType(
    List<IPleromaApiStatus> remoteItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteItem in remoteItems) {
        // ignore: unawaited_futures
        insertInRemoteTypeBatch(
          remoteItem,
          mode: mode,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        insertAllInRemoteType(
          remoteItems,
          mode: mode,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future upsertRemoteStatusesWithAllArguments(
    List<IPleromaApiStatus> remoteStatuses, {
    required bool? isFromHomeTimeline,
    required String? listRemoteId,
    required String? conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteStatus in remoteStatuses) {
        // ignore: unawaited_futures
        upsertRemoteStatusWithAllArguments(
          remoteStatus,
          isFromHomeTimeline: isFromHomeTimeline,
          conversationRemoteId: conversationRemoteId,
          listRemoteId: listRemoteId,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        upsertRemoteStatusesWithAllArguments(
          remoteStatuses,
          listRemoteId: listRemoteId,
          conversationRemoteId: conversationRemoteId,
          isFromHomeTimeline: isFromHomeTimeline,
          batchTransaction: batch,
        );
      });
    }
  }

  // ignore: long-method
  Future _upsertStatusMetadata(
    IPleromaApiStatus remoteStatus, {
    required String? listRemoteId,
    required String? conversationRemoteId,
    required bool? isFromHomeTimeline,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // if conversation not specified we try to fetch it from status
      conversationRemoteId = conversationRemoteId ??
          remoteStatus.pleroma?.directConversationId?.toString();

      _logger.finer(() => 'upsertRemoteStatus $remoteStatus '
          'listRemoteId => $listRemoteId '
          'conversationRemoteId => $conversationRemoteId '
          'isFromHomeTimeline => $isFromHomeTimeline ');

      var remoteAccount = remoteStatus.account;

      if (conversationRemoteId != null) {
        // ignore: unawaited_futures
        accountRepository.upsertConversationRemoteAccount(
          remoteAccount,
          conversationRemoteId: conversationRemoteId,
          batchTransaction: batchTransaction,
        );
      } else {
        // ignore: unawaited_futures
        accountRepository.upsertInRemoteTypeBatch(
          remoteAccount,
          batchTransaction: batchTransaction,
        );
      }

      if (isFromHomeTimeline == true) {
        // ignore: unawaited_futures
        homeTimelineStatusesDao.insertBatch(
          entity: DbHomeTimelineStatus(
            statusRemoteId: remoteStatus.id,
            id: null,
            accountRemoteId: remoteStatus.account.id,
          ),
          mode: InsertMode.insertOrReplace,
          batchTransaction: batchTransaction,
        );
      }

      var statusRemoteId = remoteStatus.id;
      if (listRemoteId != null) {
        // ignore: unawaited_futures
        addStatusesToList(
          statusRemoteIds: [
            remoteStatus.id,
          ],
          listRemoteId: listRemoteId,
          batchTransaction: batchTransaction,
        );
      }
      if (conversationRemoteId != null) {
        // ignore: unawaited_futures
        addStatusesToConversation(
          statusRemoteIds: [
            remoteStatus.id,
          ],
          conversationRemoteId: conversationRemoteId,
          batchTransaction: batchTransaction,
        );
      }

      var tags = remoteStatus.tags;

      if (tags?.isNotEmpty == true) {
        // ignore: unawaited_futures
        updateStatusTags(
          statusRemoteId: statusRemoteId,
          tags: tags!,
          batchTransaction: batchTransaction,
        );
      }

      var reblog = remoteStatus.reblog;
      if (reblog != null) {
        // list & conversation should be null. We dont need reblogs in
        // conversations & lists
        // ignore: unawaited_futures
        upsertInRemoteTypeBatch(
          reblog,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch(
        (batch) {
          _upsertStatusMetadata(
            remoteStatus,
            listRemoteId: listRemoteId,
            conversationRemoteId: conversationRemoteId,
            isFromHomeTimeline: isFromHomeTimeline,
            batchTransaction: batch,
          );
        },
      );
    }
  }

  @override
  Future<IStatus?> findNewestForHomeTimeline() {
    return findInAppType(
      pagination: RepositoryPagination(
        limit: 1,
      ),
      filters: StatusRepositoryFilters(
        isFromHomeTimeline: true,
      ),
      orderingTerms: [
        StatusRepositoryOrderingTermData.remoteIdDesc,
      ],
    );
  }

  @override
  Stream<int> watchNewestCountForHomeTimeline({
    required IStatus lastSeenStatus,
  }) {
    var statusesStream = watchFindAllInAppType(
      pagination: RepositoryPagination(
        newerThanItem: lastSeenStatus,
      ),
      filters: StatusRepositoryFilters(
        isFromHomeTimeline: true,
      ),
      orderingTerms: [
        StatusRepositoryOrderingTermData.remoteIdDesc,
      ],
    );

    return statusesStream.map((list) => list.length);
  }
}
