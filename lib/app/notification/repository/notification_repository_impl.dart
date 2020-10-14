import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/database/notification_database_dao.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_model_adapter.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("notification_repository_impl.dart");

class NotificationRepository extends AsyncInitLoadingBloc
    implements INotificationRepository {
  final NotificationDao dao;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IChatMessageRepository chatMessageRepository;

  NotificationRepository({
    @required AppDatabase appDatabase,
    @required this.accountRepository,
    @required this.statusRepository,
    @required this.chatMessageRepository,
  }) : dao = appDatabase.notificationDao;

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteNotification(IPleromaNotification remoteNotification,
      {@required bool unread}) async {
    _logger.finer(() => "upsertRemoteNotification ${remoteNotification.id} "
        "$remoteNotification");
    var remoteAccount = remoteNotification.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null, chatRemoteId: null);

    var remoteStatus = remoteNotification.status;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteStatus,
          listRemoteId: null, conversationRemoteId: null);
    }
    var remoteChatMessage = remoteNotification.chatMessage;
    if (remoteChatMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(remoteChatMessage);
    }

    await upsert(mapRemoteNotificationToDbNotification(remoteNotification,
        unread: unread));
  }

  @override
  Future upsertRemoteNotifications(
      List<IPleromaNotification> remoteNotifications,
      {@required bool unread}) async {
    _logger.finer(
        () => "upsertRemoteNotifications ${remoteNotifications.length} ");
    if (remoteNotifications.isEmpty) {
      return;
    }

    List<IPleromaAccount> remoteAccounts = remoteNotifications
        .map((remoteNotification) => remoteNotification.account)
        .toList();

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: null, chatRemoteId: null);

    List<IPleromaStatus> remoteStatuses = remoteNotifications
        .map((remoteNotification) => remoteNotification.status)
        .where((remoteStatus) => remoteStatus != null)
        .toList();

    await statusRepository.upsertRemoteStatuses(remoteStatuses,
        conversationRemoteId: null, listRemoteId: null);

    List<IPleromaChatMessage> remoteChatMessages = remoteNotifications
        .map((remoteNotification) => remoteNotification.chatMessage)
        .where((remoteChatMessage) => remoteChatMessage != null)
        .toList();

    await chatMessageRepository.upsertRemoteChatMessages(remoteChatMessages);

    await upsertAll(remoteNotifications
        .map((remoteNotification) => mapRemoteNotificationToDbNotification(
            remoteNotification,
            unread: unread))
        .toList());
  }

  @override
  Future<DbNotificationPopulatedWrapper> findByRemoteId(
          String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  @override
  Future<List<DbNotificationPopulatedWrapper>> getNotifications({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required int limit,
    @required int offset,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  }) async {
    var query = createQuery(
      excludeTypes: excludeTypes,
      olderThanNotification: olderThanNotification,
      newerThanNotification: newerThanNotification,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyNotDismissed: onlyNotDismissed,
    );

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required int limit,
    @required int offset,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  }) {
    var query = createQuery(
      excludeTypes: excludeTypes,
      olderThanNotification: olderThanNotification,
      newerThanNotification: newerThanNotification,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyNotDismissed: onlyNotDismissed,
    );

    Stream<List<DbNotificationPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required int limit,
    @required int offset,
    @required NotificationOrderingTermData orderingTermData,
    @required bool onlyNotDismissed,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t excludeTypes=$excludeTypes\n"
        "\t olderThanNotification=$olderThanNotification\n"
        "\t newerThanNotification=$newerThanNotification\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThanNotification != null || newerThanNotification != null) {
      dao.addCreatedAtBoundsWhere(query,
          maximumCreatedAt: olderThanNotification?.createdAt,
          minimumCreatedAt: newerThanNotification?.createdAt);
    }

    if (excludeTypes?.isNotEmpty == true) {
      dao.addExcludeTypeWhere(query, excludeTypes);
    }

    if (onlyNotDismissed == true) {
      dao.addOnlyNotDismissedWhere(query);
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
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbNotificationPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

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
    return item.dbNotificationPopulated.dbNotification;
  }

  @override
  Future updateLocalNotificationByRemoteNotification(
      {@required INotification oldLocalNotification,
      @required IPleromaNotification newRemoteNotification,
      @required bool unread}) async {
    _logger.finer(() => "updateLocalNotificationByRemoteNotification \n"
        "\t old: $oldLocalNotification \n"
        "\t newRemoteNotification: $newRemoteNotification");

    var remoteAccount = newRemoteNotification.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null, chatRemoteId: null);

    var remoteStatus = newRemoteNotification.status;

    await statusRepository.upsertRemoteStatus(remoteStatus,
        conversationRemoteId: null, listRemoteId: null);

    await updateById(
        oldLocalNotification.localId,
        mapRemoteNotificationToDbNotification(newRemoteNotification,
            unread: unread));
  }

  @override
  Future<DbNotificationPopulatedWrapper> getNotification({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  }) async {
    var query = createQuery(
      excludeTypes: excludeTypes,
      olderThanNotification: olderThanNotification,
      newerThanNotification: newerThanNotification,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyNotDismissed: onlyNotDismissed,
    );

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbNotificationPopulatedWrapper> watchNotification({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  }) {
    var query = createQuery(
      excludeTypes: excludeTypes,
      olderThanNotification: olderThanNotification,
      newerThanNotification: newerThanNotification,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyNotDismissed: onlyNotDismissed,
    );

    Stream<DbNotificationPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbNotification) => mapDataClassToItem(dbNotification));
  }

  @override
  Future<int> countUnreadAnyType({
    bool onlyNotDismissed = true,
  }) {
    if (onlyNotDismissed) {
      return dao.countUnreadAllNotDismissed().getSingle();
    } else {
      return dao.countUnreadAll().getSingle();
    }
  }

  @override
  Future<int> countUnreadByType({
    @required PleromaNotificationType type,
    bool onlyNotDismissed = true,
  }) {
    if (onlyNotDismissed) {
      return dao
          .countUnreadByTypeNotDismissed(
              pleromaNotificationTypeValues.enumToValueMap[type])
          .getSingle();
    } else {
      return dao
          .countUnreadByType(
              pleromaNotificationTypeValues.enumToValueMap[type])
          .getSingle();
    }
  }

  @override
  Stream<int> watchUnreadCountAnyType({
    bool onlyNotDismissed = true,
  }) {
    if (onlyNotDismissed) {
      return dao.countUnreadAllNotDismissed().watchSingle();
    } else {
      return dao.countUnreadAll().watchSingle();
    }
  }

  @override
  Stream<int> watchUnreadCountByType({
    @required PleromaNotificationType type,
    bool onlyNotDismissed = true,
  }) {
    if (onlyNotDismissed) {
      return dao
          .countUnreadByTypeNotDismissed(
            pleromaNotificationTypeValues.enumToValueMap[type],
          )
          .watchSingle();
    } else {
      return dao
          .countUnreadByType(
              pleromaNotificationTypeValues.enumToValueMap[type])
          .watchSingle();
    }
  }

  @override
  Future<int> getUnreadCountExcludeTypes({
    @required List<PleromaNotificationType> excludeTypes,
    bool onlyNotDismissed = true,
  }) async =>
      dao
          .countUnreadExcludeTypes(
            excludeTypes
                .map((type) =>
                    pleromaNotificationTypeValues.enumToValueMap[type])
                .toList(),
            onlyNotDismissed: onlyNotDismissed,
          )
          .getSingle();

  @override
  Stream<int> watchUnreadCountExcludeTypes({
    @required List<PleromaNotificationType> excludeTypes,
    bool onlyNotDismissed = true,
  }) =>
      dao
          .countUnreadExcludeTypes(
            excludeTypes
                .map((type) =>
                    pleromaNotificationTypeValues.enumToValueMap[type])
                .toList(),
            onlyNotDismissed: onlyNotDismissed,
          )
          .watchSingle();

  @override
  Future markAsRead({@required INotification notification}) {
    return dao.markAsRead(remoteId: notification.remoteId);
  }

  @override
  Future dismiss({@required INotification notification}) {
    return dao.markAsDismissed(remoteId: notification.remoteId);
  }

  @override
  Future dismissAll() {
    return dao.markAllAsDismissed();
  }
}
