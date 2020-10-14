import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/conversation/database/conversation_statuses_database_dao.dart';
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
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
  StatusDao dao;
  StatusHashtagsDao hashtagsDao;
  StatusListsDao listsDao;
  HomeTimelineStatusesDao homeTimelineStatusesDao;
  ConversationStatusesDao conversationStatusesDao;
  IAccountRepository accountRepository;

  StatusRepository(
      {@required AppDatabase appDatabase, @required this.accountRepository}) {
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
  Future upsertRemoteStatus(IPleromaStatus remoteStatus,
      {@required String listRemoteId,
      @required String conversationRemoteId,
      bool isFromHomeTimeline = false}) async {
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
      await addStatusesToList([remoteStatus.id], listRemoteId);
    }
    if (conversationRemoteId != null) {
      await addStatusesToConversation([remoteStatus.id], conversationRemoteId);
    }

    var tags = remoteStatus.tags;

    if (tags?.isNotEmpty == true) {
      await updateStatusTags(statusRemoteId, tags);
    }

    var reblog = remoteStatus.reblog;
    if (reblog != null) {
      // list & conversation should be null. We don't need reblogs in
      // conversations & lists
      await upsertRemoteStatus(reblog,
          listRemoteId: null, conversationRemoteId: null);
    }
  }

  @override
  Future upsertRemoteStatuses(List<IPleromaStatus> remoteStatuses,
      {@required String listRemoteId,
      @required String conversationRemoteId,
      bool isFromHomeTimeline = false}) async {
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

    await upsertAll(remoteStatuses
        .map((remoteStatus) => mapRemoteStatusToDbStatus(remoteStatus))
        .toList());

    if (isFromHomeTimeline == true) {
      await homeTimelineStatusesDao.insertAll(
          remoteStatuses
              .map((remoteStatus) => DbHomeTimelineStatus(
                    statusRemoteId: remoteStatus.id,
                    id: null,
                    accountRemoteId: remoteStatus.account.id,
                  ))
              .toList(),
          InsertMode.insertOrReplace);
    }

    if (listRemoteId != null) {
      await addStatusesToList(
          remoteStatuses.map((remoteStatus) => remoteStatus.id).toList(),
          listRemoteId);
    }
    if (conversationRemoteId != null) {
      await addStatusesToConversation(
          remoteStatuses.map((remoteStatus) => remoteStatus.id).toList(),
          conversationRemoteId);
    }

    // todo: rework with batch update
    for (var remoteStatus in remoteStatuses) {
      var statusRemoteId = remoteStatus.id;
      var tags = remoteStatus.tags;
      if (tags?.isNotEmpty == true) {
        await updateStatusTags(statusRemoteId, tags);
      }
    }

    var reblogs = remoteStatuses
        .where((remoteStatus) => remoteStatus.reblog != null)
        .map((remoteStatus) => remoteStatus.reblog)
        .toList();

    if (reblogs?.isNotEmpty == true) {
      // list & conversation should be null. We don't need reblogs in
      // conversations & lists
      await upsertRemoteStatuses(reblogs,
          listRemoteId: null, conversationRemoteId: null);
    }
  }

  Future addStatusesToList(
      List<String> statusRemoteIds, String listRemoteId) async {
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
              .map((statusRemoteId) => DbStatusList(
                  id: null,
                  statusRemoteId: statusRemoteId,
                  listRemoteId: listRemoteId))
              .toList(),
          InsertMode.insertOrReplace);
    }
  }

  Future addStatusesToConversation(
      List<String> statusRemoteIds, String conversationRemoteId) async {
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
                conversationRemoteId: conversationRemoteId),
            mode: InsertMode.insertOrReplace);
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

  Future updateStatusTags(String statusRemoteId, List<IPleromaTag> tags) async {
    if (tags != null) {
      await hashtagsDao.deleteByStatusRemoteId(statusRemoteId);
      await hashtagsDao.insertAll(
          tags
              .map((remoteTag) => DbStatusHashtag(
                  id: null,
                  statusRemoteId: statusRemoteId,
                  hashtag: remoteTag.name))
              .toList(),
          InsertMode.insertOrReplace);
    }
  }

  @override
  Future<DbStatusPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  @override
  Future<List<DbStatusPopulatedWrapper>> getStatuses({
    @required String onlyInListWithRemoteId,
    @required IAccount onlyFromAccount,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required int limit,
    @required int offset,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  }) async {
    var query = createQuery(
      onlyFromAccount: onlyFromAccount,
      onlyInListWithRemoteId: onlyInListWithRemoteId,
      onlyWithHashtag: onlyWithHashtag,
      onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      olderThanStatus: olderThanStatus,
      newerThanStatus: newerThanStatus,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive,
      onlyNoReplies: onlyNoReplies,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyInConversation: onlyInConversation,
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: onlyBookmarked,
      onlyFavourited: onlyFavourited,
      onlyNotDeleted: onlyNotDeleted,
    );

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbStatusPopulatedWrapper>> watchStatuses({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required int limit,
    @required int offset,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  }) {
    var query = createQuery(
      onlyInListWithRemoteId: onlyInListWithRemoteId,
      onlyWithHashtag: onlyWithHashtag,
      onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
      onlyInConversation: onlyInConversation,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      olderThanStatus: olderThanStatus,
      newerThanStatus: newerThanStatus,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive,
      onlyNoReplies: onlyNoReplies,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyFromAccount: onlyFromAccount,
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: onlyBookmarked,
      onlyFavourited: onlyFavourited,
      onlyNotDeleted: onlyNotDeleted,
    );

    Stream<List<DbStatusPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) {
      var statuses = list.map(mapDataClassToItem).toList();
      return statuses;
    });
  }

  JoinedSelectStatement createQuery({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccount,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required int limit,
    @required int offset,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    @required bool onlyNotDeleted,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t onlyInListWithRemoteId=$onlyInListWithRemoteId\n"
        "\t onlyWithHashtag=$onlyWithHashtag\n"
        "\t onlyFromAccountsFollowingByAccount=$onlyFromAccountsFollowingByAccount\n"
        "\t onlyFromAccount=$onlyFromAccount\n"
        "\t onlyInConversation=$onlyInConversation\n"
        "\t onlyLocal=$onlyLocal\n"
        "\t onlyWithMedia=$onlyWithMedia\n"
        "\t withMuted=$withMuted\n"
        "\t excludeVisibilities=$excludeVisibilities\n"
        "\t olderThanStatus=$olderThanStatus\n"
        "\t newerThanStatus=$newerThanStatus\n"
        "\t onlyNoNsfwSensitive=$onlyNoNsfwSensitive\n"
        "\t onlyNoReplies=$onlyNoReplies\n"
        "\t onlyBookmarked=$onlyBookmarked\n"
        "\t onlyFavourited=$onlyFavourited\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t isFromHomeTimeline=$isFromHomeTimeline\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (onlyLocal != null) {
      assert(onlyLocal.localUrlHost?.isNotEmpty == true);

      dao.addOnlyLocalWhere(query, onlyLocal.localUrlHost);
    }

    if (onlyWithMedia == true) {
      dao.addOnlyMediaWhere(query);
    }

    if (onlyFromAccount != null) {
      dao.addOnlyFromAccountWhere(query, onlyFromAccount.remoteId);
    }

    if (withMuted != true) {
      dao.addOnlyNotMutedWhere(query);
    }

    if (onlyNoNsfwSensitive == true) {
      dao.addOnlyNoNsfwSensitiveWhere(query);
    }

    if (onlyBookmarked == true) {
      dao.addOnlyBookmarkedWhere(query);
    }

    if (onlyFavourited == true) {
      dao.addOnlyFavouritedWhere(query);
    }

    if (onlyNoReplies == true) {
      dao.addOnlyNoRepliesWhere(query);
    }

    if (excludeVisibilities?.isNotEmpty == true) {
      dao.addExcludeVisibilitiesWhere(query, excludeVisibilities);
    }

    if (olderThanStatus != null || newerThanStatus != null) {
      dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanStatus?.remoteId,
          minimumRemoteIdExcluding: newerThanStatus?.remoteId);
    }

    if (onlyNotDeleted == true) {
      dao.addOnlyNotDeletedWhere(query);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var needFilterByFollowing = onlyFromAccountsFollowingByAccount != null;
    var needFilterByList = onlyInListWithRemoteId?.isNotEmpty == true;
    var needFilterByTag = onlyWithHashtag?.isNotEmpty == true;
    var needFilterByConversation = onlyInConversation != null;
    var needFilterByHomeTimeline = isFromHomeTimeline == true;
    var joinQuery = query.join(
      dao.populateStatusJoin(
          includeAccountFollowing: needFilterByFollowing,
          includeStatusLists: needFilterByList,
          includeStatusHashtags: needFilterByTag,
          includeConversations: needFilterByConversation,
          includeHomeTimeline: needFilterByHomeTimeline),
    );

    var finalQuery = joinQuery;
    if (needFilterByFollowing) {
      finalQuery = dao.addFollowingWhere(
          joinQuery, onlyFromAccountsFollowingByAccount.remoteId);
    }
    if (needFilterByList) {
      finalQuery = dao.addListWhere(finalQuery, onlyInListWithRemoteId);
    }
    if (needFilterByConversation) {
      finalQuery =
          dao.addConversationWhere(finalQuery, onlyInConversation.remoteId);
    }

    if (needFilterByTag) {
      finalQuery = dao.addHashtagWhere(finalQuery, onlyWithHashtag);
    }

    if (needFilterByHomeTimeline) {
      // nothing it is filtered by inner join
    }

    assert(!(limit == null && offset != null));
    if (limit != null) {
      finalQuery.limit(limit, offset: offset);
    }
    return finalQuery;
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
  Future<IStatus> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbStatusPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<IStatus> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
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
  Future updateLocalStatusByRemoteStatus(
      {@required IStatus oldLocalStatus,
      @required IPleromaStatus newRemoteStatus,
      bool isFromHomeTimeline = false}) async {
    _logger.finer(() => "updateLocalStatusByRemoteStatus \n"
        "\t old: $oldLocalStatus \n"
        "\t newRemoteStatus: $newRemoteStatus");

    var remoteAccount = newRemoteStatus.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null, chatRemoteId: null);

    await updateById(
        oldLocalStatus.localId, mapRemoteStatusToDbStatus(newRemoteStatus));

    if (isFromHomeTimeline == true) {
      await homeTimelineStatusesDao.insert(
          DbHomeTimelineStatus(
            statusRemoteId: newRemoteStatus.id,
            id: null,
            accountRemoteId: newRemoteStatus.account.id,
          ),
          mode: InsertMode.insertOrReplace);
    }

    var statusRemoteId = newRemoteStatus.id;

    var tags = newRemoteStatus.tags;

    if (tags?.isNotEmpty == true) {
      await updateStatusTags(statusRemoteId, tags);
    }

    if (newRemoteStatus.reblog != null) {
      await upsertRemoteStatus(newRemoteStatus,
          listRemoteId: null, conversationRemoteId: null);
    }
  }

  @override
  Future<DbStatusPopulatedWrapper> getStatus({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  }) async {
    var query = createQuery(
      onlyFromAccount: onlyFromAccount,
      onlyInListWithRemoteId: onlyInListWithRemoteId,
      onlyWithHashtag: onlyWithHashtag,
      onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      olderThanStatus: olderThanStatus,
      newerThanStatus: newerThanStatus,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive,
      onlyNoReplies: onlyNoReplies,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyInConversation: onlyInConversation,
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: onlyBookmarked,
      onlyFavourited: onlyFavourited,
      onlyNotDeleted: onlyNotDeleted,
    );

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbStatusPopulatedWrapper> watchStatus({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccount,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  }) {
    var query = createQuery(
      onlyInListWithRemoteId: onlyInListWithRemoteId,
      onlyWithHashtag: onlyWithHashtag,
      onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
      onlyInConversation: onlyInConversation,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      olderThanStatus: olderThanStatus,
      newerThanStatus: newerThanStatus,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive,
      onlyNoReplies: onlyNoReplies,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyFromAccount: onlyFromAccount,
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: onlyBookmarked,
      onlyFavourited: onlyFavourited,
      onlyNotDeleted: onlyNotDeleted,
    );

    Stream<DbStatusPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbStatus) => mapDataClassToItem(dbStatus));
  }

  @override
  Future<IStatus> getConversationLastStatus({
    @required IConversation conversation,
    bool onlyNotDeleted = true,
  }) =>
      getStatus(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyFromAccount: null,
        onlyInConversation: conversation,
        onlyLocal: null,
        onlyWithMedia: null,
        withMuted: null,
        excludeVisibilities: null,
        olderThanStatus: null,
        newerThanStatus: null,
        onlyNoNsfwSensitive: null,
        onlyNoReplies: null,
        isFromHomeTimeline: null,
        onlyBookmarked: null,
        onlyFavourited: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyNotDeleted: onlyNotDeleted,
      );

  @override
  Stream<IStatus> watchConversationLastStatus({
    @required IConversation conversation,
    bool onlyNotDeleted = true,
  }) =>
      watchStatus(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyFromAccount: null,
        onlyInConversation: conversation,
        onlyLocal: null,
        onlyWithMedia: null,
        withMuted: null,
        excludeVisibilities: null,
        olderThanStatus: null,
        newerThanStatus: null,
        onlyNoNsfwSensitive: null,
        onlyNoReplies: null,
        isFromHomeTimeline: null,
        onlyBookmarked: null,
        onlyFavourited: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyNotDeleted: onlyNotDeleted,
      );

  @override
  Future incrementRepliesCount({@required String remoteId}) =>
      dao.incrementRepliesCount(remoteId: remoteId);

  @override
  Future removeAccountStatusesFromHome({
    @required String accountRemoteId,
  }) =>
      homeTimelineStatusesDao.deleteByAccountRemoteId(accountRemoteId);

  @override
  Future markStatusAsDeleted({@required String statusRemoteId}) =>
      dao.markAsDeleted(remoteId: statusRemoteId);

  @override
  Future clearListStatusesConnection({@required String listRemoteId}) async {
    await listsDao.deleteByRemoteId(listRemoteId);
  }
}
