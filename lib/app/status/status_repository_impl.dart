import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_repository.dart';
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
  final StatusDao dao;
  final IAccountRepository accountRepository;
  final IPleromaTimelineService pleromaTimelineService;
  String get baseUrl => pleromaTimelineService.baseUrl;
  String get baseHost => extractHost(baseUrl);

  StatusRepository({
    @required this.dao,
    @required this.accountRepository,
    @required this.pleromaTimelineService,
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

  @override
  Future<List<DbStatusPopulatedWrapper>> getPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) async {
    var query = dao.createQuery(
        baseUrl: baseUrl,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData);
    return dao.typedResultListToPopulated(await query
        .get()).map(mapDataClassToItem);
  }

  @override
  Stream<List<DbStatusPopulatedWrapper>> watchPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    var query = dao.createQuery(
        baseUrl: baseUrl,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData);
    Stream<List<DbStatusPopulated>> stream = query
        .watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  @override
  Future<List<DbStatusPopulatedWrapper>> getHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) async {
    var query = dao.createQuery(
        baseUrl: baseUrl,
            onlyMedia: onlyMedia,
            withMuted: withMuted,
            excludeVisibilities: excludeVisibilities,
            notNewerThanStatus: notNewerThanStatus,
            notOlderThanStatus: notOlderThanStatus,
            limit: limit,
            orderingTermData: orderingTermData);
    return dao.typedResultListToPopulated(await query
        .get()).map(mapDataClassToItem);
  }

  @override
  Stream<List<DbStatusPopulatedWrapper>> watchHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData}) {
    var query = dao.createQuery(
        baseUrl: baseUrl,
        onlyMedia: onlyMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        notNewerThanStatus: notNewerThanStatus,
        notOlderThanStatus: notOlderThanStatus,
        limit: limit,
        orderingTermData: orderingTermData);
    Stream<List<DbStatusPopulated>> stream = query
        .watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());

  }

  @override
  Future<List<DbStatusPopulatedWrapper>> getHashTagStatuses(
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
  Stream<List<DbStatusPopulatedWrapper>> watchHashTagStatuses(
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
  Future<List<DbStatusPopulatedWrapper>> getListStatuses(
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
  Stream<List<DbStatusPopulatedWrapper>> watchListStatuses(
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

  static DbStatus mapRemoteStatusToDbStatus(IPleromaStatus remoteStatus) {
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
    return DbStatus(
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
        pleromaEmojiReactions: remoteStatus.pleroma.emojiReactions,
        accountRemoteId: remoteStatus.account.id);
  }



  static String extractHost(String url) => Uri.parse(url).host;
}
