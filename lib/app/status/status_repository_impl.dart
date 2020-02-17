import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_database_dao.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_repository.dart';
import 'package:fedi/app/status/status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_repository_impl.dart");

class StatusRepository extends AsyncInitLoadingBloc
    implements IStatusRepository {
  final String localDomain;
  final StatusDao dao;
  final IPleromaTimelineService pleromaTimelineService;

  StatusRepository({
    @required this.dao,
    @required this.pleromaTimelineService,
    @required this.localDomain,
  });

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  Future updateRemoteStatuses(List<IPleromaStatus> remoteStatuses) async {
    await upsertAll(remoteStatuses.map(mapRemoteStatusToDbStatus));
  }

  SimpleSelectStatement<$DbStatusesTable, DbStatus> createQuery(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    var query = dao.selectQuery();
    if (onlyLocal != null) {
      dao.addLocalOnlyWhere(query, localDomain);
    }

    if (onlyMedia != null) {
      dao.addMediaOnlyWhere(query);
    }

    if (withMuted != true) {
      dao.addNotMutedWhere(query);
    }
    if (excludeVisibilities?.isNotEmpty == true) {
      dao.addExcludeVisibilitiesWhere(query, excludeVisibilities);
    }

    if (notNewerThanStatus != null || notOlderThanStatus != null) {
      // TODO: rework to remote ids ordering
      dao.addDateBoundsWhere(
          query, notOlderThanStatus.createdAt, notNewerThanStatus.createdAt);
    }

    // TODO: add offset
    if (limit != null) {
      query.limit(limit);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    return query;
  }

  @override
  Future<List<DbStatusWrapper>> getPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    return createQuery(
            onlyLocal: onlyLocal,
            onlyMedia: onlyMedia,
            withMuted: withMuted,
            excludeVisibilities: excludeVisibilities,
            notNewerThanStatus: notNewerThanStatus,
            notOlderThanStatus: notOlderThanStatus,
            limit: limit,
            orderingTermData: orderingTermData)
        .map(mapDataClassToItem)
        .get();
  }


  @override
  Stream<List<DbStatusWrapper>> watchPublicStatuses(
      {@required bool onlyLocal,
        @required bool onlyMedia,
        @required bool withMuted,
        @required List<PleromaVisibility> excludeVisibilities,
        @required IStatus notNewerThanStatus,
        @required IStatus notOlderThanStatus,
        @required int limit,
        @required StatusOrderingTermData orderingTermData}) {
    return createQuery(
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData)
        .map(mapDataClassToItem)
        .watch();
  }


  @override
  Future<List<DbStatusWrapper>> getHomeStatuses(
      {@required bool onlyLocal,
        @required bool onlyMedia,
        @required bool withMuted,
        @required List<PleromaVisibility> excludeVisibilities,
        @required IStatus notNewerThanStatus,
        @required IStatus notOlderThanStatus,
        @required int limit,
        @required StatusOrderingTermData orderingTermData}) {
    return createQuery(
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData)
        .map(mapDataClassToItem)
        .get();
  }

  @override
  Stream<List<DbStatusWrapper>> watchHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    return createQuery(
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData)
        .map(mapDataClassToItem)
        .watch();
  }



  @override
  Future<List<DbStatusWrapper>> getHashTagStatuses(
      {@required String hashTag,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    // TODO: implement getHomeStatuses
    throw UnimplementedError();
  }

  @override
  Stream<List<DbStatusWrapper>> watchHashTagStatuses(
      {@required String hashTag,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    // TODO: implement watchHashTagStatuses
    throw UnimplementedError();
  }

  @override
  Future<List<DbStatusWrapper>> getListStatuses(
      {@required String listRemoteId,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    // TODO: implement getListStatuses
    throw UnimplementedError();
  }

  @override
  Stream<List<DbStatusWrapper>> watchListStatuses(
      {@required String listRemoteId,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    // TODO: implement watchListStatuses
    throw UnimplementedError();
  }

  @override
  Future refreshHashTagStatuses({
    @required String hashTag,
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  }) async {
    var statuses = await getHashTagStatuses(
        hashTag: hashTag,
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: null,
        notOlderThanStatus: null,
        limit: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    IStatus latestStatus;
    if (statuses.isNotEmpty) {
      latestStatus = statuses.first;
    }
    List<IPleromaStatus> loadedRemoteStatuses =
        await pleromaTimelineService.getHashTagTimeline(
      limit: limit,
      minId: latestStatus?.remoteId,
      hashTag: hashTag,
      onlyLocal: onlyLocal,
      onlyMedia: onlyMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );

    await updateRemoteStatuses(loadedRemoteStatuses);
  }

  @override
  Future refreshHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required int limit}) async {
    var statuses = await getHomeStatuses(
        onlyLocal: onlyLocal,
        onlyMedia: null,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: null,
        notOlderThanStatus: null,
        limit: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    IStatus latestStatus;
    if (statuses.isNotEmpty) {
      latestStatus = statuses.first;
    }
    List<IPleromaStatus> loadedRemoteStatuses =
        await pleromaTimelineService.getHomeTimeline(
      limit: limit,
      minId: latestStatus?.remoteId,
      onlyLocal: onlyLocal,
      onlyMedia: onlyMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );

    await updateRemoteStatuses(loadedRemoteStatuses);
  }

  @override
  Future refreshListStatuses({
    @required String listRemoteId,
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  }) async {
    var statuses = await getListStatuses(
        listRemoteId: listRemoteId,
        onlyLocal: onlyLocal,
        onlyMedia: null,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: null,
        notOlderThanStatus: null,
        limit: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    IStatus latestStatus;
    if (statuses.isNotEmpty) {
      latestStatus = statuses.first;
    }
    List<IPleromaStatus> loadedRemoteStatuses =
        await pleromaTimelineService.getListTimeline(
      listId: listRemoteId,
      limit: limit,
      minId: latestStatus?.remoteId,
      onlyLocal: onlyLocal,
      onlyMedia: onlyMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );

    await updateRemoteStatuses(loadedRemoteStatuses);
  }

  @override
  Future refreshPublicStatuses({
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  }) async {
    var statuses = await getPublicStatuses(
        onlyLocal: onlyLocal,
        onlyMedia: null,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: null,
        notOlderThanStatus: null,
        limit: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    IStatus latestStatus;
    if (statuses.isNotEmpty) {
      latestStatus = statuses.first;
    }
    List<IPleromaStatus> loadedRemoteStatuses =
        await pleromaTimelineService.getPublicTimeline(
      limit: limit,
      minId: latestStatus?.remoteId,
      onlyLocal: onlyLocal,
      onlyMedia: onlyMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );

    await updateRemoteStatuses(loadedRemoteStatuses);
  }

  @override
  Future upsertAll(Iterable<DbStatusWrapper> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(
        items.map((item) => item.dbStatus), InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbStatusWrapper> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(
        items.map((item) => item.dbStatus), InsertMode.insertOrRollback);
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
  Future<IStatus> findById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<IStatus> watchById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<IStatus>> getAll() =>
      dao.getAllQuery().map(mapDataClassToItem).get();

  @override
  Stream<List<IStatus>> watchAll() =>
      dao.getAllQuery().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(IStatus item) => dao.insert(mapItemToDataClass(item));

  @override
  Future<bool> updateById(int id, DbStatusWrapper item) {
    var dbProfile = item.dbStatus;
    if (item.localId != id) {
      dbProfile = dbProfile.copyWith(id: id);
    }
    return dao.replace(dbProfile);
  }

  DbStatusWrapper mapDataClassToItem(DbStatus dataClass) =>
      DbStatusWrapper(dataClass);

  Insertable<DbStatus> mapItemToDataClass(DbStatusWrapper item) =>
      item.dbStatus;

  static DbStatusWrapper mapRemoteStatusToDbStatus(
      IPleromaStatus remoteStatus) {
    // TODO: fix when https://git.pleroma.social/pleroma/pleroma/issues/1573  will be resolved
    DateTime expiresAt;
    try {
      if (remoteStatus.pleroma.expiresAt is DateTime) {
        expiresAt = remoteStatus.pleroma.expiresAt;
      } else {
        expiresAt = DateTime.parse(remoteStatus.pleroma.expiresAt);
      }
    } catch (e) {
      _logger.shout(() => "Error during parsing expiresAt $e");
    }
    return DbStatusWrapper(DbStatus(
        id: null,
        remoteId: remoteStatus.id,
        createdAt: remoteStatus.createdAt,
        inReplyToRemoteId: remoteStatus.inReplyToId,
        inReplyToAccountRemoteId: remoteStatus.inReplyToAccountId,
        sensitive: remoteStatus.sensitive,
        spoilerText: remoteStatus.spoilerText,
        visibility: remoteStatus.visibilityPleroma,
        uri: remoteStatus.uri,
        url: remoteStatus.url,
        repliesCount: remoteStatus.repliesCount,
        reblogsCount: remoteStatus.reblogsCount,
        favouritesCount: remoteStatus.favouritesCount,
        favourited: remoteStatus.favourited,
        reblogged: remoteStatus.reblogged,
        muted: remoteStatus.muted,
        bookmarked: remoteStatus.bookmarked,
        content: remoteStatus.content,
        reblog: remoteStatus.reblog,
        application: remoteStatus.application,
        account: remoteStatus.account,
        mediaAttachments: remoteStatus.mediaAttachments,
        mentions: remoteStatus.mentions,
        tags: remoteStatus.tags,
        emojis: remoteStatus.emojis,
        poll: remoteStatus.poll,
        card: remoteStatus.card,
        pleromaContent: remoteStatus.pleroma.content,
        pleromaConversationId: remoteStatus.pleroma.conversationId,
        pleromaDirectConversationId: remoteStatus.pleroma.directConversationId,
        pleromaInReplyToAccountAcct: remoteStatus.pleroma.inReplyToAccountAcct,
        pleromaLocal: remoteStatus.pleroma.local,
        pleromaSpoilerText: remoteStatus.pleroma.spoilerText,
        pleromaExpiresAt: expiresAt,
        pleromaThreadMuted: remoteStatus.pleroma.threadMuted,
        pleromaEmojiReactions: remoteStatus.pleroma.emojiReactions));
  }
}
