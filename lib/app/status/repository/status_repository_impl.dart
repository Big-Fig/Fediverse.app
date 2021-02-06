import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_dao.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_dao.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

var _singleStatusRepositoryPagination = RepositoryPagination<IStatus>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
  StatusDao dao;
  StatusHashtagsDao hashtagsDao;
  StatusListsDao listsDao;
  HomeTimelineStatusesDao homeTimelineStatusesDao;
  ConversationStatusesDao conversationStatusesDao;
  IAccountRepository accountRepository;

  StatusRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository,
  }) {
    dao = appDatabase.statusDao;
    hashtagsDao = appDatabase.statusHashtagsDao;
    listsDao = appDatabase.statusListsDao;
    homeTimelineStatusesDao = appDatabase.homeTimelineStatusesDao;
    conversationStatusesDao = appDatabase.conversationStatusesDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future deleteByRemoteId(String remoteId) => dao.deleteByRemoteId(remoteId);

  @override
  Future upsertRemoteStatus(
    IPleromaStatus remoteStatus, {
    @required String listRemoteId,
    @required String conversationRemoteId,
    bool isFromHomeTimeline = false,
  }) async {
    // if conversation not specified we try to fetch it from status
    conversationRemoteId = conversationRemoteId ??
        remoteStatus?.pleroma?.conversationId?.toString();

    _logger.finer(() => "upsertRemoteStatus $remoteStatus "
        "listRemoteId => $listRemoteId "
        "conversationRemoteId => $conversationRemoteId "
        "isFromHomeTimeline => $isFromHomeTimeline ");

    var remoteAccount = remoteStatus.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: conversationRemoteId, chatRemoteId: null);

    await upsert(mapRemoteStatusToDbStatus(remoteStatus));

    if (isFromHomeTimeline == true) {
      await homeTimelineStatusesDao.insert(
          DbHomeTimelineStatus(
            statusRemoteId: remoteStatus.id,
            id: null,
            accountRemoteId: remoteStatus.account.id,
          ),
          mode: InsertMode.insertOrReplace);
    }

    var statusRemoteId = remoteStatus.id;
    if (listRemoteId != null) {
      await addStatusesToList(
        statusRemoteIds: [remoteStatus.id],
        listRemoteId: listRemoteId,
      );
    }
    if (conversationRemoteId != null) {
      await addStatusesToConversation(
        statusRemoteIds: [remoteStatus.id],
        conversationRemoteId: conversationRemoteId,
      );
    }

    var tags = remoteStatus.tags;

    if (tags?.isNotEmpty == true) {
      await updateStatusTags(
        statusRemoteId: statusRemoteId,
        tags: tags,
      );
    }

    var reblog = remoteStatus.reblog;
    if (reblog != null) {
      // list & conversation should be null. We don't need reblogs in
      // conversations & lists
      await upsertRemoteStatus(
        reblog,
        listRemoteId: null,
        conversationRemoteId: null,
      );
    }
  }

  @override
  Future upsertRemoteStatuses(
    List<IPleromaStatus> remoteStatuses, {
    @required String listRemoteId,
    @required String conversationRemoteId,
    bool isFromHomeTimeline = false,
  }) async {
    _logger.finer(() => "upsertRemoteStatuses ${remoteStatuses.length} "
        "listRemoteId => $listRemoteId"
        "conversationRemoteId => $conversationRemoteId"
        "isFromHomeTimeline => $isFromHomeTimeline");
    if (remoteStatuses.isEmpty) {
      return;
    }

    List<IPleromaAccount> remoteAccounts =
        remoteStatuses.map((remoteStatus) => remoteStatus.account).toList();

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: conversationRemoteId, chatRemoteId: null);

    await upsertAll(
      remoteStatuses
          .map((remoteStatus) => mapRemoteStatusToDbStatus(remoteStatus))
          .toList(),
    );

    if (isFromHomeTimeline == true) {
      await homeTimelineStatusesDao.insertAll(
        remoteStatuses
            .map((remoteStatus) => DbHomeTimelineStatus(
                  statusRemoteId: remoteStatus.id,
                  id: null,
                  accountRemoteId: remoteStatus.account.id,
                ))
            .toList(),
        InsertMode.insertOrReplace,
      );
    }

    if (listRemoteId != null) {
      await addStatusesToList(
        statusRemoteIds:
            remoteStatuses.map((remoteStatus) => remoteStatus.id).toList(),
        listRemoteId: listRemoteId,
      );
    }
    if (conversationRemoteId != null) {
      await addStatusesToConversation(
        statusRemoteIds:
            remoteStatuses.map((remoteStatus) => remoteStatus.id).toList(),
        conversationRemoteId: conversationRemoteId,
      );
    }

    // todo: rework with batch update
    for (var remoteStatus in remoteStatuses) {
      var statusRemoteId = remoteStatus.id;
      var tags = remoteStatus.tags;
      if (tags?.isNotEmpty == true) {
        await updateStatusTags(
          statusRemoteId: statusRemoteId,
          tags: tags,
        );
      }
    }

    var reblogs = remoteStatuses
        .where((remoteStatus) => remoteStatus.reblog != null)
        .map((remoteStatus) => remoteStatus.reblog)
        .toList();

    if (reblogs?.isNotEmpty == true) {
      // list & conversation should be null. We don't need reblogs in
      // conversations & lists
      await upsertRemoteStatuses(
        reblogs,
        listRemoteId: null,
        conversationRemoteId: null,
      );
    }
  }

  Future addStatusesToList({
    @required List<String> statusRemoteIds,
    @required String listRemoteId,
  }) async {
    List<DbStatusList> alreadyAddedListStatuses =
        await listsDao.findByListRemoteId(listRemoteId).get();
    Iterable<String> alreadyAddedListStatusesIds =
        alreadyAddedListStatuses.map((listStatus) => listStatus.statusRemoteId);
    Iterable<String> notAddedYetStatusRemoteIds =
        statusRemoteIds.where((statusRemoteId) {
      return !alreadyAddedListStatusesIds.contains(statusRemoteId);
    });

    if (notAddedYetStatusRemoteIds?.isNotEmpty == true) {
      await listsDao.insertAll(
        notAddedYetStatusRemoteIds
            .map(
              (statusRemoteId) => DbStatusList(
                id: null,
                statusRemoteId: statusRemoteId,
                listRemoteId: listRemoteId,
              ),
            )
            .toList(),
        InsertMode.insertOrReplace,
      );
    }
  }

  Future addStatusesToConversation({
    @required List<String> statusRemoteIds,
    @required String conversationRemoteId,
  }) async {
    List<DbConversationStatus> alreadyAddedConversationStatuses =
        await conversationStatusesDao
            .findByConversationRemoteId(conversationRemoteId)
            .get();
    Iterable<String> alreadyAddedConversationStatusesIds =
        alreadyAddedConversationStatuses
            .map((conversationStatus) => conversationStatus.statusRemoteId);
    Iterable<String> notAddedYetStatusRemoteIds =
        statusRemoteIds.where((statusRemoteId) {
      return !alreadyAddedConversationStatusesIds.contains(statusRemoteId);
    });

    if (notAddedYetStatusRemoteIds?.isNotEmpty == true) {
      for (var statusRemoteId in notAddedYetStatusRemoteIds) {
        await conversationStatusesDao.insert(
          DbConversationStatus(
            id: null,
            statusRemoteId: statusRemoteId,
            conversationRemoteId: conversationRemoteId,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    }
//      await conversationStatusesDao.insertAll(
//          notAddedYetStatusRemoteIds
//              .map((statusRemoteId) => DbConversationStatus(
//                  id: null,
//                  statusRemoteId: statusRemoteId,
//                  conversationRemoteId: conversationRemoteId))
//              .toList(),
//          InsertMode.insertOrReplace);
  }

  Future updateStatusTags({
    @required String statusRemoteId,
    @required List<IPleromaTag> tags,
  }) async {
    if (tags != null) {
      await hashtagsDao.deleteByStatusRemoteId(statusRemoteId);
      await hashtagsDao.insertAll(
        tags
            .map(
              (remoteTag) => DbStatusHashtag(
                id: null,
                statusRemoteId: statusRemoteId,
                hashtag: remoteTag.name,
              ),
            )
            .toList(),
        InsertMode.insertOrReplace,
      );
    }
  }

  @override
  Future<DbStatusPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(
          remoteId,
        ),
      );

  @override
  Future<List<DbStatusPopulatedWrapper>> getStatuses({
    @required StatusRepositoryFilters filters,
    @required RepositoryPagination<IStatus> pagination,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
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
  Stream<List<DbStatusPopulatedWrapper>> watchStatuses({
    @required StatusRepositoryFilters filters,
    @required RepositoryPagination<IStatus> pagination,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbStatusPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map(
      (list) {
        var statuses = list.map(mapDataClassToItem).toList();
        return statuses;
      },
    );
  }

  @override
  Future upsertAll(Iterable<DbStatus> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbStatus> items) async {
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
  Future<IStatus> findById(int id) async => mapDataClassToItem(
        await dao.findById(
          id,
        ),
      );

  @override
  Stream<DbStatusPopulatedWrapper> watchById(int id) => dao
      .watchById(
        id,
      )
      .map(mapDataClassToItem);

  @override
  Stream<IStatus> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return dao.watchByRemoteId(remoteId).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbStatusPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbStatusPopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbStatus item) => dao.insert(item);

  @override
  Future<int> upsert(DbStatus item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbStatus dbStatus) {
    if (dbStatus.id != id) {
      dbStatus = dbStatus.copyWith(id: id);
    }
    return dao.replace(dbStatus);
  }

  DbStatusPopulatedWrapper mapDataClassToItem(DbStatusPopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbStatusPopulatedWrapper(dataClass);
  }

  Insertable<DbStatus> mapItemToDataClass(DbStatusPopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbStatusPopulated.dbStatus;
  }

  @override
  Future updateLocalStatusByRemoteStatus({
    @required IStatus oldLocalStatus,
    @required IPleromaStatus newRemoteStatus,
    bool isFromHomeTimeline = false,
  }) async {
    _logger.finer(() => "updateLocalStatusByRemoteStatus \n"
        "\t old: $oldLocalStatus \n"
        "\t newRemoteStatus: $newRemoteStatus");

    var remoteAccount = newRemoteStatus.account;

    await accountRepository.upsertRemoteAccount(
      remoteAccount,
      conversationRemoteId: null,
      chatRemoteId: null,
    );

    await updateById(
      oldLocalStatus.localId,
      mapRemoteStatusToDbStatus(
        newRemoteStatus,
      ),
    );

    if (isFromHomeTimeline == true) {
      await homeTimelineStatusesDao.insert(
        DbHomeTimelineStatus(
          statusRemoteId: newRemoteStatus.id,
          id: null,
          accountRemoteId: newRemoteStatus.account.id,
        ),
        mode: InsertMode.insertOrReplace,
      );
    }

    var statusRemoteId = newRemoteStatus.id;

    var tags = newRemoteStatus.tags;

    if (tags?.isNotEmpty == true) {
      await updateStatusTags(
        statusRemoteId: statusRemoteId,
        tags: tags,
      );
    }

    if (newRemoteStatus.reblog != null) {
      await upsertRemoteStatus(
        newRemoteStatus,
        listRemoteId: null,
        conversationRemoteId: null,
      );
    }
  }

  @override
  Future<DbStatusPopulatedWrapper> getStatus({
    @required StatusRepositoryFilters filters,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singleStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return mapDataClassToItem(
      dao.typedResultToPopulated(
        await query.getSingle(),
      ),
    );
  }

  @override
  Stream<DbStatusPopulatedWrapper> watchStatus({
    @required StatusRepositoryFilters filters,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singleStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbStatusPopulated> stream = query.watchSingle().map(
          (typedResult) => dao.typedResultToPopulated(
            typedResult,
          ),
        );

    return stream.map(
      (dbStatus) => mapDataClassToItem(
        dbStatus,
      ),
    );
  }

  @override
  Future incrementRepliesCount({
    @required String remoteId,
  }) =>
      dao.incrementRepliesCount(
        remoteId: remoteId,
      );

  @override
  Future removeAccountStatusesFromHome({
    @required String accountRemoteId,
  }) =>
      homeTimelineStatusesDao.deleteByAccountRemoteId(
        accountRemoteId,
      );

  @override
  Future markStatusAsDeleted({
    @required String statusRemoteId,
  }) =>
      dao.markAsDeleted(
        remoteId: statusRemoteId,
      );

  @override
  Future clearListStatusesConnection({
    @required String listRemoteId,
  }) async {
    await listsDao.deleteByRemoteId(
      listRemoteId,
    );
  }

  @override
  Future<IStatus> getConversationLastStatus({
    @required IConversationChat conversation,
  }) =>
      getStatus(
        filters: StatusRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        orderingTermData: StatusRepositoryOrderingTermData.remoteIdDesc,
      );

  @override
  Stream<IStatus> watchConversationLastStatus({
    @required IConversationChat conversation,
  }) =>
      watchStatus(
        filters: StatusRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        orderingTermData: StatusRepositoryOrderingTermData.remoteIdDesc,
      );

  @override
  Future<Map<IConversationChat, IStatus>> getConversationsLastStatus({
    @required List<IConversationChat> conversations,
  }) async {
    var query = createQuery(
      orderingTermData: StatusRepositoryOrderingTermData.remoteIdDesc,
      filters: StatusRepositoryFilters.createForForceJoinConversations(),
      pagination: null,
    );

    var typedResultList = await query.get();

    Map<IConversationChat, IStatus> result = {};

    conversations.forEach(
      (conversation) {
        TypedResult typedResult = typedResultList.firstWhere(
          (typedResult) {
            var conversationStatuses =
                typedResult.readTable(dao.conversationStatusesAlias);

            return conversationStatuses.conversationRemoteId ==
                conversation.remoteId;
          },
          orElse: () => null,
        );

        IStatus status;

        if (typedResult != null) {
          status = mapDataClassToItem(
            dao.typedResultToPopulated(
              typedResult,
            ),
          );
        }

        result[conversation] = status;
      },
    );

    return result;
  }

  void addGroupByConversationId(JoinedSelectStatement query) {
    query.groupBy(
      [
        conversationStatusesDao.dbConversationStatuses.conversationRemoteId,
      ],
      having: CustomExpression("MAX(db_statuses.created_at)"),
    );
  }

  JoinedSelectStatement createQuery({
    @required StatusRepositoryFilters filters,
    @required RepositoryPagination<IStatus> pagination,
    @required StatusRepositoryOrderingTermData orderingTermData,
  }) {
    // todo: rework excludeTextCondition with fts sqlite extension
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    assert(
        !(filters?.onlyLocalCondition != null &&
            filters?.onlyRemoteCondition != null),
        "onlyLocalCondition && onlyRemoteCondition  can't be set both");

    if (filters?.onlyFromInstance != null) {
      assert(filters?.onlyRemoteCondition != null,
          "onlyRemoteCondition should be notNull if onlyFromInstance was set");

      dao.addOnlyFromInstanceWhere(
        query,
        filters?.onlyFromInstance,
      );
    } else {
      if (filters?.onlyRemoteCondition != null) {
        dao.addOnlyRemoteWhere(
          query,
          filters?.onlyRemoteCondition?.localUrlHost,
        );
      }
    }

    if (filters?.onlyLocalCondition != null) {
      assert(filters?.onlyLocalCondition?.localUrlHost?.isNotEmpty == true);

      dao.addOnlyLocalWhere(
        query,
        filters?.onlyLocalCondition?.localUrlHost,
      );
    }

    if (filters?.onlyWithMedia == true) {
      dao.addOnlyMediaWhere(query);
    }

    if (filters?.onlyFromAccount != null) {
      dao.addOnlyFromAccountWhere(
        query,
        filters?.onlyFromAccount?.remoteId,
      );
    }

    if (filters?.withMuted != true) {
      dao.addOnlyNotMutedWhere(query);
    }

    if (filters?.onlyNoNsfwSensitive == true) {
      dao.addOnlyNoNsfwSensitiveWhere(query);
    }

    if (filters?.onlyBookmarked == true) {
      dao.addOnlyBookmarkedWhere(query);
    }

    if (filters?.onlyFavourited == true) {
      dao.addOnlyFavouritedWhere(query);
    }

    if (filters?.onlyNoReplies == true) {
      dao.addOnlyNoRepliesWhere(query);
    }

    if (filters?.excludeVisibilities?.isNotEmpty == true) {
      dao.addExcludeVisibilitiesWhere(query, filters?.excludeVisibilities);
    }

    if (filters?.onlyNotDeleted == true) {
      dao.addOnlyNotDeletedWhere(query);
    }

    var includeReplyToAccountFollowing = false;

    var replyVisibilityFilter =
        filters?.replyVisibilityFilterCondition?.replyVisibilityFilter;
    if (filters?.replyVisibilityFilterCondition?.replyVisibilityFilter !=
        null) {
      if (replyVisibilityFilter == PleromaReplyVisibilityFilter.self) {
        dao.addOnlyInReplyToAccountRemoteIdOrNotReply(
          query,
          filters?.replyVisibilityFilterCondition?.myAccountRemoteId,
        );
      } else if (replyVisibilityFilter == PleromaReplyVisibilityFilter.following) {
        includeReplyToAccountFollowing = true;
      }
    }

    if (filters?.excludeTextConditions?.isNotEmpty == true) {
      for (var textCondition in filters?.excludeTextConditions) {
        dao.addExcludeContentWhere(
          query,
          phrase: textCondition.phrase,
          wholeWord: textCondition.wholeWord,
        );
        dao.addExcludeSpoilerTextWhere(
          query,
          phrase: textCondition.phrase,
          wholeWord: textCondition.wholeWord,
        );
      }
    }

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
          orderingTermData.orderByType == StatusRepositoryOrderType.remoteId);
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

    var needFilterByFollowing =
        filters?.onlyFromAccountsFollowingByAccount != null;
    var needFilterByList = filters?.onlyInListWithRemoteId?.isNotEmpty == true;
    var needFilterByTag = filters?.onlyWithHashtag?.isNotEmpty == true;
    var needFilterByConversation = filters?.onlyInConversation != null;
    var needFilterByHomeTimeline = filters?.isFromHomeTimeline == true;
    var joinQuery = query.join(
      dao.populateStatusJoin(
        includeAccountFollowing: needFilterByFollowing,
        includeStatusLists: needFilterByList,
        includeStatusHashtags: needFilterByTag,
        includeConversations:
            needFilterByConversation || filters?.forceJoinConversation == true,
        includeHomeTimeline: needFilterByHomeTimeline,
        includeReplyToAccountFollowing: includeReplyToAccountFollowing,
      ),
    );

    var finalQuery = joinQuery;

    if (filters?.replyVisibilityFilterCondition?.replyVisibilityFilter !=
        null) {
      if (replyVisibilityFilter == PleromaReplyVisibilityFilter.following) {
        finalQuery = dao.addReplyToAccountSelfOrFollowingWhere(
          joinQuery,
            filters?.replyVisibilityFilterCondition?.myAccountRemoteId,
        );
      }
    }

    if (needFilterByFollowing) {
      finalQuery = dao.addFollowingWhere(
        joinQuery,
        filters?.onlyFromAccountsFollowingByAccount?.remoteId,
      );
    }
    if (needFilterByList) {
      finalQuery = dao.addListWhere(
        finalQuery,
        filters?.onlyInListWithRemoteId,
      );
    }
    if (needFilterByConversation) {
      finalQuery = dao.addConversationWhere(
        finalQuery,
        filters?.onlyInConversation?.remoteId,
      );
    }

    if (needFilterByTag) {
      finalQuery = dao.addHashtagWhere(
        finalQuery,
        filters?.onlyWithHashtag,
      );
    }

    if (needFilterByHomeTimeline) {
      // nothing it is filtered by inner join
    }

    if (pagination?.limit != null) {
      finalQuery.limit(
        pagination?.limit,
        offset: pagination?.offset,
      );
    }

    return finalQuery;
  }
}
