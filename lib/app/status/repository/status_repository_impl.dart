import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
  StatusDao dao;
  StatusHashtagsDao hashtagsDao;
  StatusListsDao listsDao;
  IAccountRepository accountRepository;


  StatusRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository
  }) {
    dao = appDatabase.statusDao;
    hashtagsDao = appDatabase.statusHashtagsDao;
    listsDao = appDatabase.statusListsDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteStatus(IPleromaStatus remoteStatus,
      {@required String listRemoteId}) async {
    var remoteAccount = remoteStatus.account;

    accountRepository.upsertRemoteAccount(remoteAccount);

    await upsert(mapRemoteStatusToDbStatus(remoteStatus));

    var statusRemoteId = remoteStatus.id;
    if (listRemoteId != null) {
      await addStatusesToList([remoteStatus.id], listRemoteId);
    }

    var tags = remoteStatus.tags;

    if (tags?.isNotEmpty == true) {
      await updateStatusTags(statusRemoteId, tags);
    }
  }

  @override
  Future upsertRemoteStatuses(List<IPleromaStatus> remoteStatuses,
      {@required String listRemoteId}) async {
    var remoteAccounts =
        remoteStatuses.map((remoteStatus) => remoteStatus.account);

    accountRepository.upsertRemoteAccounts(remoteAccounts);

    await upsertAll(remoteStatuses.map(mapRemoteStatusToDbStatus));

    if (listRemoteId != null) {
      await addStatusesToList(
          remoteStatuses.map((remoteStatus) => remoteStatus.id).toList(),
          listRemoteId);
    }

    // todo: rework with batch update
    for (var remoteStatus in remoteStatuses) {
      var statusRemoteId = remoteStatus.id;
      var tags = remoteStatus.tags;
      if (tags?.isNotEmpty == true) {
        await updateStatusTags(statusRemoteId, tags);
      }
    }
  }

  Future addStatusesToList(
      List<String> statusRemoteIds, String listRemoteId) async {
    if (listRemoteId?.isNotEmpty == true) {
      await listsDao.insertAll(
          statusRemoteIds
              .map((statusRemoteId) => DbStatusList(
                  id: null,
                  statusRemoteId: statusRemoteId,
                  listRemoteId: listRemoteId))
              .toList(),
          InsertMode.insertOrReplace);
    }
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

  Future<List<DbStatusPopulatedWrapper>> getStatuses(
      {@required String inListWithRemoteId,
      @required String withHashtag,
      @required IAccount onlyFollowingByAccount,
      @required String localUrlHost,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String olderThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required bool noNsfwSensitive,
      @required bool noReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData}) async {
    var query = createQuery(
        inListWithRemoteId: inListWithRemoteId,
        withHashtag: withHashtag,
        onlyFollowingByAccount: onlyFollowingByAccount,
        localUrlHost: localUrlHost,
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        notMuted: notMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanStatusRemoteId: olderThanStatusRemoteId,
        newerThanStatusRemoteId: newerThanStatusRemoteId,
        noNsfwSensitive: noNsfwSensitive,
        noReplies: noNsfwSensitive,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem);
  }

  Stream<List<DbStatusPopulatedWrapper>> watchStatuses(
      {@required String inListWithRemoteId,
      @required String withHashtag,
      @required IAccount onlyFollowingByAccount,
      @required String localUrlHost,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String olderThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required bool noNsfwSensitive,
      @required bool noReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData}) {
    var query = createQuery(
        inListWithRemoteId: inListWithRemoteId,
        withHashtag: withHashtag,
        onlyFollowingByAccount: onlyFollowingByAccount,
        localUrlHost: localUrlHost,
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        notMuted: notMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanStatusRemoteId: olderThanStatusRemoteId,
        newerThanStatusRemoteId: newerThanStatusRemoteId,
        noNsfwSensitive: noNsfwSensitive,
        noReplies: noNsfwSensitive,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    Stream<List<DbStatusPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery(
      {@required String inListWithRemoteId,
      @required String withHashtag,
      @required IAccount onlyFollowingByAccount,
      @required String localUrlHost,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String olderThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required bool noNsfwSensitive,
      @required bool noReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData}) {
    var query = dao.startSelectQuery();

    if (onlyLocal == true) {
      assert(localUrlHost?.isNotEmpty == true);

      dao.addLocalOnlyWhere(query, localUrlHost);
    }

    if (onlyMedia == true) {
      dao.addMediaOnlyWhere(query);
    }

    if (notMuted == true) {
      dao.addNotMutedWhere(query);
    }

    if (noNsfwSensitive == true) {
      dao.addNoNsfwSensitiveWhere(query);
    }

    if (noReplies == true) {
      dao.addNoRepliesWhere(query);
    }

    if (excludeVisibilities?.isNotEmpty == true) {
      dao.addExcludeVisibilitiesWhere(query, excludeVisibilities);
    }

    if (olderThanStatusRemoteId != null || newerThanStatusRemoteId != null) {
      dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanStatusRemoteId,
          minimumRemoteIdExcluding: newerThanStatusRemoteId);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var needFilterByFollowing = onlyFollowingByAccount != null;
    var needFilterByList = inListWithRemoteId?.isNotEmpty == true;
    var needFilterByTag = withHashtag?.isNotEmpty == true;
    var joinQuery = query.join(
      dao.populateStatusJoin(
          includeAccountFollowing: needFilterByFollowing,
          includeStatusLists: needFilterByList,
          includeStatusHashtags: needFilterByTag),
    );

    var finalQuery = joinQuery;
    if (needFilterByFollowing) {
      finalQuery =
          dao.addFollowingWhere(joinQuery, onlyFollowingByAccount.remoteId);
    }
    if (needFilterByList) {
      finalQuery = dao.addListWhere(finalQuery, inListWithRemoteId);
    }

    if (needFilterByTag) {
      finalQuery = dao.addHashtagWhere(finalQuery, withHashtag);
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
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbStatusPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

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

  DbStatusPopulatedWrapper mapDataClassToItem(DbStatusPopulated dataClass) =>
      DbStatusPopulatedWrapper(dataClass);

  Insertable<DbStatus> mapItemToDataClass(DbStatusPopulatedWrapper item) =>
      item.dbStatusPopulated.status;
}
