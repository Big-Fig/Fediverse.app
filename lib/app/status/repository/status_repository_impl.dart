import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_repository.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
  final StatusDao dao;
  final IAccountRepository accountRepository;

  StatusRepository({
    @required this.dao,
    @required this.accountRepository,
  });

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  Future updateRemoteStatuses(List<IPleromaStatus> remoteStatuses) async {
    await upsertAll(remoteStatuses.map(mapRemoteStatusToDbStatus));
  }

  @override
  Future<DbStatusPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  Future<List<DbStatusPopulatedWrapper>> getStatuses(
      {@required String inListWithRemoteId,
      @required String withHashTag,
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
        withHashTag: withHashTag,
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
      @required String withHashTag,
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
        withHashTag: withHashTag,
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
      @required String withHashTag,
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

    if (inListWithRemoteId?.isNotEmpty == true) {
      throw UnimplementedError();
    }

    if (withHashTag?.isNotEmpty == true) {
      dao.addHashTagWhere(query, withHashTag);
    }
    if (onlyFollowingByAccount != null) {
      throw UnimplementedError();
    }

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
    var joinQuery = query.join(
      dao.populateStatusJoin(),
    );
    assert(!(limit == null && offset != null));
    if (limit != null) {
      joinQuery.limit(limit, offset: offset);
    }
    return joinQuery;
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
  Future<int> upsertByRemoteId(DbStatus dbStatus) =>
      dao.updateByRemoteId(dbStatus.remoteId, dbStatus);

  @override
  Future<int> insert(DbStatus item) => dao.insert(item);

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

  static String extractHost(String url) => Uri.parse(url).host;
}
