import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
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
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("notification_repository_impl.dart");

var _singleNotificationRepositoryPagination =
    RepositoryPagination<INotification>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class NotificationRepository extends AsyncInitLoadingBloc
    implements INotificationRepository {
  final NotificationDao dao;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaChatMessageRepository chatMessageRepository;

  NotificationRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
    required this.statusRepository,
    required this.chatMessageRepository,
  }) : dao = appDatabase.notificationDao;

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteNotification(
    IPleromaNotification remoteNotification, {
    required bool? unread,
  }) async {
    _logger.finer(() => "upsertRemoteNotification ${remoteNotification.id} "
        "$remoteNotification");
    var remoteAccount = remoteNotification.account;

    if (remoteAccount != null) {
      await accountRepository.upsertRemoteAccount(
        remoteAccount,
        conversationRemoteId: null,
        chatRemoteId: null,
      );
    }

    var remoteStatus = remoteNotification.status;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(
        remoteStatus,
        listRemoteId: null,
        conversationRemoteId: null,
      );
    }
    var remoteChatMessage = remoteNotification.chatMessage;
    if (remoteChatMessage != null) {
      await chatMessageRepository.upsertRemoteChatMessage(
        remoteChatMessage,
      );
    }
    await upsert(
      remoteNotification.toDbNotification(
        unread: unread,
      ),
    );
  }

  @override
  Future upsertRemoteNotifications(
    List<IPleromaNotification>? remoteNotifications, {
    required bool? unread,
  }) async {
    _logger.finer(
        () => "upsertRemoteNotifications ${remoteNotifications!.length} ");
    if (remoteNotifications!.isEmpty) {
      return;
    }

    List<IPleromaAccount> remoteAccounts = remoteNotifications
        .where((remoteNotification) => remoteNotification.account != null)
        .map(
          (remoteNotification) => remoteNotification.account!,
        )
        .toList();

    await accountRepository.upsertRemoteAccounts(
      remoteAccounts,
      conversationRemoteId: null,
      chatRemoteId: null,
    );

    List<IPleromaStatus> remoteStatuses = remoteNotifications
        .where((remoteNotification) => remoteNotification.status != null)
        .map(
          (remoteNotification) => remoteNotification.status!,
        )
        .toList();

    await statusRepository.upsertRemoteStatuses(
      remoteStatuses,
      conversationRemoteId: null,
      listRemoteId: null,
    );

    List<IPleromaChatMessage> remoteChatMessages = remoteNotifications
        .where((remoteNotification) => remoteNotification.chatMessage != null)
        .map(
          (remoteNotification) => remoteNotification.chatMessage!,
        )
        .toList();

    await chatMessageRepository.upsertRemoteChatMessages(remoteChatMessages);

    await upsertAll(
      remoteNotifications
          .map(
            (remoteNotification) =>
                remoteNotification.toDbNotification(unread: unread),
          )
          .toList(),
    );
  }

  @override
  Future<DbNotificationPopulatedWrapper?> findByRemoteId(
    String remoteId,
  ) async {
    var found = await dao.findByRemoteId(remoteId);
    if (found != null) {
      return mapDataClassToItem(found);
    } else {
      return null;
    }
  }

  @override
  Future<List<DbNotificationPopulatedWrapper>> getNotifications({
    required NotificationRepositoryFilters? filters,
    required RepositoryPagination<INotification>? pagination,
    NotificationOrderingTermData? orderingTermData =
        NotificationOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications({
    required NotificationRepositoryFilters? filters,
    required RepositoryPagination<INotification>? pagination,
    NotificationOrderingTermData? orderingTermData =
        NotificationOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbNotificationPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map(
      (list) => list.map(mapDataClassToItem).toList(),
    );
  }

  JoinedSelectStatement createQuery({
    required NotificationRepositoryFilters? filters,
    required RepositoryPagination<INotification>? pagination,
    required NotificationOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData?.orderType == NotificationOrderType.createdAt);
      dao.addCreatedAtBoundsWhere(
        query,
        maximumCreatedAt: pagination?.olderThanItem?.createdAt,
        minimumCreatedAt: pagination?.newerThanItem?.createdAt,
      );
    }

    if (filters?.excludeTypes?.isNotEmpty == true) {
      dao.addExcludeTypeWhere(query, filters?.excludeTypes);
    }

    var onlyWithType = filters?.onlyWithType;
    if (onlyWithType != null) {
      dao.addOnlyWithTypeWhere(query, onlyWithType);
    }

    if (filters?.onlyNotDismissed == true) {
      dao.addOnlyNotDismissedWhere(query);
    }
    if (filters?.onlyUnread == true) {
      dao.addOnlyUnread(query);
    }

    if (orderingTermData != null) {
      dao.orderBy(
        query,
        [
          orderingTermData,
        ],
      );
    }
    var joinQuery = query.join(
      dao.populateNotificationJoin(),
    );

    var excludeStatusTextConditions = filters?.excludeStatusTextConditions;
    if (excludeStatusTextConditions != null) {
      for (var condition in excludeStatusTextConditions) {
        dao.addExcludeContentWhere(
          joinQuery,
          phrase: condition.phrase,
          wholeWord: condition.wholeWord,
        );
        dao.addExcludeSpoilerTextWhere(
          joinQuery,
          phrase: condition.phrase,
          wholeWord: condition.wholeWord,
        );
      }
    }

    var finalQuery = joinQuery;

    var limit = pagination?.limit;
    if (limit != null) {
      finalQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return finalQuery;
  }

  @override
  Future upsertAll(List<DbNotification> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(List<DbNotification> items) async {
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
  Future<INotification> findById(int id) async => mapDataClassToItem(
        await dao.findById(id),
      );

  @override
  Stream<DbNotificationPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<INotification> watchByRemoteId(String? remoteId) {
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
      (dao.watchAll()).map(
        (list) => list.map(mapDataClassToItem).toList(),
      );

  @override
  Future<int> insert(DbNotification item) => dao.insert(item);

  @override
  Future<int> upsert(DbNotification item) => dao.upsert(item);

  @override
  Future<bool> updateById(int? id, DbNotification dbNotification) {
    if (dbNotification.id != id) {
      dbNotification = dbNotification.copyWith(id: id);
    }
    return dao.replace(dbNotification);
  }

  DbNotificationPopulatedWrapper mapDataClassToItem(
      DbNotificationPopulated dataClass) {
    return DbNotificationPopulatedWrapper(
      dbNotificationPopulated: dataClass,
    );
  }

  Insertable<DbNotification> mapItemToDataClass(
      DbNotificationPopulatedWrapper item) {
    return item.dbNotificationPopulated.dbNotification;
  }

  @override
  Future updateLocalNotificationByRemoteNotification({
    required INotification oldLocalNotification,
    required IPleromaNotification newRemoteNotification,
    required bool? unread,
  }) async {
    _logger.finer(() => "updateLocalNotificationByRemoteNotification \n"
        "\t old: $oldLocalNotification \n"
        "\t newRemoteNotification: $newRemoteNotification");

    var remoteAccount = newRemoteNotification.account;

    if (remoteAccount != null) {
      await accountRepository.upsertRemoteAccount(
        remoteAccount,
        conversationRemoteId: null,
        chatRemoteId: null,
      );
    }

    var remoteStatus = newRemoteNotification.status;

    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(
        remoteStatus,
        conversationRemoteId: null,
        listRemoteId: null,
      );
    }

    await updateById(
      oldLocalNotification.localId,
      newRemoteNotification.toDbNotification(
        unread: unread,
      ),
    );
  }

  @override
  Future<DbNotificationPopulatedWrapper> getNotification({
    required NotificationRepositoryFilters? filters,
    NotificationOrderingTermData? orderingTermData =
        NotificationOrderingTermData.createdAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singleNotificationRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return mapDataClassToItem(
      dao.typedResultToPopulated(
        await query.getSingle(),
      ),
    );
  }

  @override
  Stream<DbNotificationPopulatedWrapper?> watchNotification({
    required NotificationRepositoryFilters? filters,
    NotificationOrderingTermData? orderingTermData =
        NotificationOrderingTermData.createdAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singleNotificationRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbNotificationPopulated> stream = query.watchSingle().map(
          (typedResult) => dao.typedResultToPopulated(
            typedResult,
          ),
        );
    return stream.map(
      (dbNotification) => mapDataClassToItem(
        dbNotification,
      ),
    );
  }

  Selectable<int> createCountQuery({
    required NotificationRepositoryFilters? filters,
  }) {
    // todo: select only ID, without other fields
    var query = createQuery(
      filters: filters,
      pagination: null,
      orderingTermData: null,
    );

    var countExp = dao.dbNotifications.id.count();

    query..addColumns([countExp]);

    return query.map(
      (row) => row.read(
        countExp,
      ),
    );
  }

  @override
  Future markAsRead({
    required INotification notification,
  }) {
    return dao.markAsRead(
      remoteId: notification.remoteId,
    );
  }

  @override
  Future dismiss({
    required INotification notification,
  }) {
    return dao.markAsDismissed(
      remoteId: notification.remoteId,
    );
  }

  @override
  Future dismissAll() {
    return dao.markAllAsDismissed();
  }

  @override
  Future<int> getCount({
    required NotificationRepositoryFilters? filters,
  }) =>
      createCountQuery(filters: filters).getSingle();

  @override
  Stream<int> watchCount({
    required NotificationRepositoryFilters? filters,
  }) =>
      createCountQuery(filters: filters).watchSingle();

  @override
  Future<DbNotificationPopulatedWrapper?> getNewest() => getNotification(
        filters: null,
      );

  @override
  Future markAllAsRead() => dao.markAllAsRead();

  @override
  Future dismissFollowRequestNotificationsFromAccount({
    required IAccount account,
  }) =>
      dao.markAsDismissedWhere(
        accountRemoteId: account.remoteId,
        type: PleromaNotificationType.followRequest,
      );
}
