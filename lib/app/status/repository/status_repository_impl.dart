import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_dao.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_dao.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

class StatusRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbStatus,
    DbStatusPopulated,
    IStatus,
    IPleromaStatus,
    int,
    String,
    $DbStatusesTable,
    $DbStatusesTable,
    StatusRepositoryFilters,
    StatusRepositoryOrderingTermData> implements IStatusRepository {
  @override
  late StatusDao dao;
  late StatusHashtagsDao hashtagsDao;
  late StatusListsDao listsDao;
  late HomeTimelineStatusesDao homeTimelineStatusesDao;
  late ConversationStatusesDao conversationStatusesDao;
  final IAccountRepository accountRepository;

  StatusRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
  }) {
    dao = appDatabase.statusDao;
    hashtagsDao = appDatabase.statusHashtagsDao;
    listsDao = appDatabase.statusListsDao;
    homeTimelineStatusesDao = appDatabase.homeTimelineStatusesDao;
    conversationStatusesDao = appDatabase.conversationStatusesDao;
  }

  //
  // @override
  // Future upsertRemoteStatus(
  //   IPleromaStatus remoteStatus, {
  //   required String? listRemoteId,
  //   required String? conversationRemoteId,
  //   bool isFromHomeTimeline = false,
  // }) async {
  //   // if conversation not specified we try to fetch it from status
  //   conversationRemoteId = conversationRemoteId ??
  //       remoteStatus.pleroma?.conversationId?.toString();
  //
  //   _logger.finer(() => "upsertRemoteStatus $remoteStatus "
  //       "listRemoteId => $listRemoteId "
  //       "conversationRemoteId => $conversationRemoteId "
  //       "isFromHomeTimeline => $isFromHomeTimeline ");
  //
  //   var remoteAccount = remoteStatus.account;
  //
  //   await accountRepository.upsertConversationRemoteAccount(
  //     remoteAccount,
  //     conversationRemoteId: conversationRemoteId!,
  //   );
  //
  //   await upsertInRemoteTypeBatch(remoteStatus);
  //
  //   if (isFromHomeTimeline == true) {
  //     await homeTimelineStatusesDao.insert(
  //       entity: DbHomeTimelineStatus(
  //         statusRemoteId: remoteStatus.id,
  //         id: null,
  //         accountRemoteId: remoteStatus.account.id,
  //       ),
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   }
  //
  //   var statusRemoteId = remoteStatus.id;
  //   if (listRemoteId != null) {
  //     await addStatusesToList(
  //       statusRemoteIds: [
  //         remoteStatus.id,
  //       ],
  //       listRemoteId: listRemoteId,
  //     );
  //   }
  //   if (conversationRemoteId != null) {
  //     await addStatusesToConversationWithDuplicatePreCheck(
  //       statusRemoteIds: [
  //         remoteStatus.id,
  //       ],
  //       conversationRemoteId: conversationRemoteId,
  //     );
  //   }
  //
  //   var tags = remoteStatus.tags;
  //
  //   if (tags?.isNotEmpty == true) {
  //     await updateStatusTags(
  //       statusRemoteId: statusRemoteId,
  //       tags: tags!,
  //     );
  //   }
  //
  //   var reblog = remoteStatus.reblog;
  //   if (reblog != null) {
  //     // list & conversation should be null. We don't need reblogs in
  //     // conversations & lists
  //     await upsertRemoteStatus(
  //       reblog,
  //       listRemoteId: null,
  //       conversationRemoteId: null,
  //     );
  //   }
  // }
  //
  // @override
  // Future upsertRemoteStatuses(
  //   List<IPleromaStatus> remoteStatuses, {
  //   required String? listRemoteId,
  //   required String? conversationRemoteId,
  //   bool isFromHomeTimeline = false,
  // }) async {
  //   _logger.finer(() => "upsertRemoteStatuses ${remoteStatuses.length} "
  //       "listRemoteId => $listRemoteId"
  //       "conversationRemoteId => $conversationRemoteId"
  //       "isFromHomeTimeline => $isFromHomeTimeline");
  //   if (remoteStatuses.isEmpty) {
  //     return;
  //   }
  //
  //   List<IPleromaAccount> remoteAccounts =
  //       remoteStatuses.map((remoteStatus) => remoteStatus.account).toList();
  //
  //   await accountRepository.upsertRemoteAccounts(
  //     remoteAccounts,
  //     conversationRemoteId: conversationRemoteId,
  //     chatRemoteId: null,
  //   );
  //
  //   await upsertAllInRemoteType(
  //     remoteStatuses,
  //   );
  //
  //   if (isFromHomeTimeline == true) {
  //     await homeTimelineStatusesDao.insertAll(
  //       entities: remoteStatuses
  //           .map(
  //             (remoteStatus) => DbHomeTimelineStatus(
  //               statusRemoteId: remoteStatus.id,
  //               id: null,
  //               accountRemoteId: remoteStatus.account.id,
  //             ),
  //           )
  //           .toList(),
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   }
  //
  //   if (listRemoteId != null) {
  //     await addStatusesToList(
  //       statusRemoteIds: remoteStatuses
  //           .map(
  //             (remoteStatus) => remoteStatus.id,
  //           )
  //           .toList(),
  //       listRemoteId: listRemoteId,
  //     );
  //   }
  //   if (conversationRemoteId != null) {
  //     await addStatusesToConversationWithDuplicatePreCheck(
  //       statusRemoteIds: remoteStatuses
  //           .map(
  //             (remoteStatus) => remoteStatus.id,
  //           )
  //           .toList(),
  //       conversationRemoteId: conversationRemoteId,
  //     );
  //   }
  //
  //   // todo: rework with batch update
  //   for (var remoteStatus in remoteStatuses) {
  //     var statusRemoteId = remoteStatus.id;
  //     var tags = remoteStatus.tags;
  //     if (tags?.isNotEmpty == true) {
  //       await updateStatusTags(
  //         statusRemoteId: statusRemoteId,
  //         tags: tags!,
  //       );
  //     }
  //   }
  //
  //   List<IPleromaStatus> reblogs = remoteStatuses
  //       .where((remoteStatus) => remoteStatus.reblog != null)
  //       .map((remoteStatus) => remoteStatus.reblog!)
  //       .toList();
  //
  //   if (reblogs.isNotEmpty) {
  //     // list & conversation should be null. We don't need reblogs in
  //     // conversations & lists
  //     await upsertRemoteStatuses(
  //       reblogs,
  //       listRemoteId: null,
  //       conversationRemoteId: null,
  //     );
  //   }
  // }

  Future addStatusesToList({
    required List<String> statusRemoteIds,
    required String listRemoteId,
  }) async {
    List<DbStatusList> alreadyAddedListStatuses =
        await listsDao.findByListRemoteId(listRemoteId).get();
    Iterable<String> alreadyAddedListStatusesIds =
        alreadyAddedListStatuses.map((listStatus) => listStatus.statusRemoteId);
    Iterable<String> notAddedYetStatusRemoteIds =
        statusRemoteIds.where((statusRemoteId) {
      return !alreadyAddedListStatusesIds.contains(statusRemoteId);
    });

    if (notAddedYetStatusRemoteIds.isNotEmpty == true) {
      await listsDao.insertAll(
        entities: notAddedYetStatusRemoteIds
            .map(
              (statusRemoteId) => DbStatusList(
                id: null,
                statusRemoteId: statusRemoteId,
                listRemoteId: listRemoteId,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
        batchTransaction: null,
      );
    }
  }

  @override
  Future addStatusesToConversationWithDuplicatePreCheck({
    required List<String> statusRemoteIds,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    // todo: rework with less queries
    List<DbConversationStatus> alreadyAddedConversationStatuses =
        await conversationStatusesDao
            .findByConversationRemoteId(conversationRemoteId)
            .get();
    Iterable<String> alreadyAddedConversationStatusesIds =
        alreadyAddedConversationStatuses.map(
      (conversationStatus) => conversationStatus.statusRemoteId,
    );
    Iterable<String> notAddedYetStatusRemoteIds =
        statusRemoteIds.where((statusRemoteId) {
      return !alreadyAddedConversationStatusesIds.contains(statusRemoteId);
    });

    if (notAddedYetStatusRemoteIds.isNotEmpty == true) {
      await conversationStatusesDao.batch(
        (batch) {
          for (var statusRemoteId in notAddedYetStatusRemoteIds) {
            conversationStatusesDao.insertBatch(
                entity: DbConversationStatus(
                  id: null,
                  statusRemoteId: statusRemoteId,
                  conversationRemoteId: conversationRemoteId,
                ),
                mode: InsertMode.insertOrReplace,
                batchTransaction: batch);
          }
        },
      );
    }
  }

  Future updateStatusTags({
    required String statusRemoteId,
    required List<IPleromaTag>? tags,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await hashtagsDao.deleteByStatusRemoteIdBatch(
        statusRemoteId,
        batchTransaction: batchTransaction,
      );
      tags ??= [];
      await hashtagsDao.insertAll(
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

  //
  // @override
  // Future<List<DbStatusPopulatedWrapper>> getStatuses({
  //   required StatusRepositoryFilters? filters,
  //   required RepositoryPagination<IStatus>? pagination,
  //   StatusRepositoryOrderingTermData? orderingTermData =
  //       StatusRepositoryOrderingTermData.remoteIdDesc,
  // }) async {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: pagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   var typedResultList = await query.get();
  //
  //   return typedResultList
  //       .toDbStatusPopulatedList(dao: dao)
  //       .toDbStatusPopulatedWrappers();
  // }
  //
  // @override
  // Stream<List<DbStatusPopulatedWrapper>> watchStatuses({
  //   required StatusRepositoryFilters? filters,
  //   required RepositoryPagination<IStatus>? pagination,
  //   StatusRepositoryOrderingTermData? orderingTermData =
  //       StatusRepositoryOrderingTermData.remoteIdDesc,
  // }) {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: pagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   Stream<List<DbStatusPopulated>> stream = query.watch().map(
  //         (list) => list.toDbStatusPopulatedList(dao: dao),
  //       );
  //   return stream.map(
  //     (list) => list.toDbStatusPopulatedWrappers(),
  //   );
  // }

  // //
  // // @override
  // // Future updateLocalStatusByRemoteStatus({
  // //   required IStatus oldLocalStatus,
  // //   required IPleromaStatus newRemoteStatus,
  // //   bool isFromHomeTimeline = false,
  // // }) async {
  // //   _logger.finer(() => "updateLocalStatusByRemoteStatus \n"
  // //       "\t old: $oldLocalStatus \n"
  // //       "\t newRemoteStatus: $newRemoteStatus");
  // //
  // //   var remoteAccount = newRemoteStatus.account;
  // //
  // //   await accountRepository.upsertRemoteAccount(
  // //     remoteAccount,
  // //     conversationRemoteId: null,
  // //     chatRemoteId: null,
  // //   );
  // //
  // //   await updateByDbIdInDbType(
  // //     dbId: oldLocalStatus.localId!,
  // //     dbItem: newRemoteStatus.toDbStatus(),
  // //
  // //   );
  // //
  // //   if (isFromHomeTimeline == true) {
  // //     await homeTimelineStatusesDao.insert(
  // //       entity: DbHomeTimelineStatus(
  // //         statusRemoteId: newRemoteStatus.id,
  // //         id: null,
  // //         accountRemoteId: newRemoteStatus.account.id,
  // //       ),
  // //       mode: InsertMode.insertOrReplace,
  // //     );
  // //   }
  // //
  // //   var statusRemoteId = newRemoteStatus.id;
  // //
  // //   var tags = newRemoteStatus.tags;
  // //
  // //   if (tags?.isNotEmpty == true) {
  // //     await updateStatusTags(
  // //       statusRemoteId: statusRemoteId,
  // //       tags: tags!,
  // //     );
  // //   }
  // //
  // //   if (newRemoteStatus.reblog != null) {
  // //     await upsertRemoteStatus(
  // //       newRemoteStatus,
  // //       listRemoteId: null,
  // //       conversationRemoteId: null,
  // //     );
  // //   }
  // // }
  //
  // @override
  // Future<DbStatusPopulatedWrapper?> getStatus({
  //   required StatusRepositoryFilters? filters,
  //   StatusRepositoryOrderingTermData? orderingTermData =
  //       StatusRepositoryOrderingTermData.remoteIdDesc,
  // }) async {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singleStatusRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   var typedResult = await query.getSingleOrNull();
  //
  //   var dbStatusPopulated = typedResult?.toDbStatusPopulated(dao: dao);
  //
  //   return dbStatusPopulated?.toDbStatusPopulatedWrapper();
  // }
  //
  // @override
  // Stream<DbStatusPopulatedWrapper?> watchStatus({
  //   required StatusRepositoryFilters? filters,
  //   StatusRepositoryOrderingTermData? orderingTermData =
  //       StatusRepositoryOrderingTermData.remoteIdDesc,
  // }) {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singleStatusRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   return query.watchSingleOrNull().map(
  //         (typedResult) => typedResult
  //             ?.toDbStatusPopulated(dao: dao)
  //             .toDbStatusPopulatedWrapper(),
  //       );
  // }

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
        pagination: null,
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
        pagination: null,
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
        ]);

    var typedResultList = await query.get();

    Map<IConversationChat, IStatus?> result = {};

    conversations.forEach(
      (conversation) {
        TypedResult? typedResult = typedResultList.firstWhereOrNull(
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
    _logger.finest(() => "findByOldPendingRemoteId $oldPendingRemoteId");
    return (await dao.findByOldPendingRemoteId(oldPendingRemoteId))
        ?.toDbStatusPopulatedWrapper();
  }

  @override
  Stream<IStatus?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  ) {
    _logger.finest(() => "watchByOldPendingRemoteId $oldPendingRemoteId");

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
  IPleromaStatus mapAppItemToRemoteItem(IStatus appItem) =>
      appItem.toPleromaStatus();

  // @override
  // IStatus mapRemoteItemToAppItem(IPleromaStatus remoteItem) =>
  //     remoteItem.toDbStatusPopulatedWrapper();

  @override
  DbStatusPopulated mapAppItemToDbPopulatedItem(IStatus appItem) =>
      appItem.toDbStatusPopulated();

  @override
  IStatus mapDbPopulatedItemToAppItem(DbStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbStatusPopulatedWrapper();

  @override
  IPleromaStatus mapDbPopulatedItemToRemoteItem(
          DbStatusPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbStatusPopulatedWrapper().toPleromaStatus();

  @override
  IStatus mapRemoteItemToAppItem(IPleromaStatus appItem) =>
      appItem.toDbStatusPopulatedWrapper();

  @override
  StatusRepositoryFilters get emptyFilters => StatusRepositoryFilters.empty;

  @override
  List<StatusRepositoryOrderingTermData> get defaultOrderingTerms =>
      StatusRepositoryOrderingTermData.defaultTerms;

// @override
// DbStatusPopulated mapRemoteItemToDbPopulatedItem(IPleromaStatus remoteItem) =>
//     remoteItem.toDbStatusPopulated();
}
