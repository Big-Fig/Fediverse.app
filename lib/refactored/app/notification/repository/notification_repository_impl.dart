import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/database/notification_database_dao.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/notification_model_adapter.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("notification_repository_impl.dart");

class NotificationRepository extends AsyncInitLoadingBloc
    implements INotificationRepository {
  final NotificationDao dao;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;

  NotificationRepository(
      {@required AppDatabase appDatabase,
        @required this.accountRepository,
        @required this.statusRepository,
      }):   dao = appDatabase.notificationDao;

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteNotification(IPleromaNotification remoteNotification,
      {@required String listRemoteId,
      @required String conversationRemoteId}) async {
    _logger.finer(
        () => "upsertRemoteNotification $remoteNotification listRemoteId=> "
            "$listRemoteId");
    var remoteAccount = remoteNotification.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: conversationRemoteId);

    var remoteStatus = remoteNotification.status;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteStatus,
          listRemoteId: null, conversationRemoteId: null);
    }

    await upsert(mapRemoteNotificationToDbNotification(remoteNotification));
  }

  @override
  Future upsertRemoteNotifications(
      List<IPleromaNotification> remoteNotifications,
      {@required String listRemoteId,
      @required String conversationRemoteId}) async {
    _logger
        .finer(() => "upsertRemoteNotifications ${remoteNotifications.length} "
            "listRemoteId => $listRemoteId");
    if (remoteNotifications.isEmpty) {
      return;
    }

    List<IPleromaAccount> remoteAccounts = remoteNotifications
        .map((remoteNotification) => remoteNotification.account)
        .toList();

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: conversationRemoteId);

    List<IPleromaStatus> remoteStatuses = remoteNotifications
        .map((remoteNotification) => remoteNotification.status)
        .where((remoteStatus) => remoteStatus != null)
        .toList();

    await statusRepository.upsertRemoteStatuses(remoteStatuses,
        conversationRemoteId: conversationRemoteId, listRemoteId: null);

    await upsertAll(remoteNotifications
        .map(mapRemoteNotificationToDbNotification)
        .toList());
  }

  @override
  Future<DbNotificationPopulatedWrapper> findByRemoteId(
          String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  Future<List<DbNotificationPopulatedWrapper>> getNotifications(
      {@required MastodonNotificationType onlyWithType,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) async {
    var query = createQuery(
        onlyWithType: onlyWithType,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications(
      {@required MastodonNotificationType onlyWithType,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyWithType: onlyWithType,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    Stream<List<DbNotificationPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery(
      {@required MastodonNotificationType onlyWithType,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t onlyWithType=$onlyWithType\n"
        "\t olderThanNotification=$olderThanNotification\n"
        "\t newerThanNotification=$newerThanNotification\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThanNotification != null || newerThanNotification != null) {
      dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanNotification?.remoteId,
          minimumRemoteIdExcluding: newerThanNotification?.remoteId);
    }

    if (onlyWithType != null) {
      dao.addOnlyTypeWhere(query, onlyWithType);
    }


    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var joinQuery = query.join(
      dao.populateNotificationJoin(),
    );

    var finalQuery = joinQuery;

    assert(!(limit == null && offset != null));
    if (limit != null) {
      finalQuery.limit(limit, offset: offset);
    }
    return finalQuery;
  }

  @override
  Future upsertAll(Iterable<DbNotification> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbNotification> items) async {
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
  Future<INotification> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbNotificationPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<INotification> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbNotificationPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Stream<List<DbNotificationPopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbNotification item) => dao.insert(item);

  @override
  Future<int> upsert(DbNotification item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbNotification dbNotification) {
    if (dbNotification.id != id) {
      dbNotification = dbNotification.copyWith(id: id);
    }
    return dao.replace(dbNotification);
  }

  DbNotificationPopulatedWrapper mapDataClassToItem(
      DbNotificationPopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbNotificationPopulatedWrapper(dataClass);
  }

  Insertable<DbNotification> mapItemToDataClass(
      DbNotificationPopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbNotificationPopulated.notification;
  }

  @override
  Future updateLocalNotificationByRemoteNotification(
      {@required INotification oldLocalNotification,
      @required IPleromaNotification newRemoteNotification}) async {
    _logger.finer(() => "updateLocalNotificationByRemoteNotification \n"
        "\t old: $oldLocalNotification \n"
        "\t newRemoteNotification: $newRemoteNotification");

    var remoteAccount = newRemoteNotification.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null);

    var remoteStatus = newRemoteNotification.status;

    await statusRepository.upsertRemoteStatus(remoteStatus,
        conversationRemoteId: null, listRemoteId: null);

    await updateById(oldLocalNotification.localId,
        mapRemoteNotificationToDbNotification(newRemoteNotification));
  }

  @override
  Future<DbNotificationPopulatedWrapper> getNotification(
      {
        @required MastodonNotificationType onlyWithType,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required NotificationOrderingTermData orderingTermData}) async {
    var query = createQuery(
        onlyWithType: onlyWithType,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData);

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbNotificationPopulatedWrapper> watchNotification(
      {
        @required MastodonNotificationType onlyWithType,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required NotificationOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyWithType: onlyWithType,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData);

    Stream<DbNotificationPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbNotification) => mapDataClassToItem(dbNotification));
  }
}
