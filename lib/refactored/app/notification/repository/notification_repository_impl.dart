import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/database/notification_database_dao.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/notification_model_adapter.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("notification_repository_impl.dart");

class NotificationRepository extends AsyncInitLoadingBloc
    implements INotificationRepository {
  NotificationDao dao;
  IAccountRepository accountRepository;
  IStatusRepository statusRepository;

  NotificationRepository(
      {@required AppDatabase appDatabase, @required this.accountRepository}) {
    dao = appDatabase.notificationDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteNotification(IPleromaNotification remoteNotification,
      {@required String listRemoteId,
      @required String conversationRemoteId}) async {
    _logger.finer(() => "upsertRemoteNotification $remoteNotification listRemoteId=> "
        "$listRemoteId");
    var remoteAccount = remoteNotification.account;

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: conversationRemoteId);

    await upsert(mapRemoteNotificationToDbNotification(remoteNotification));

    var notificationRemoteId = remoteNotification.id;
    if (listRemoteId != null) {
      await addNotificationsToList([remoteNotification.id], listRemoteId);
    }
    if (conversationRemoteId != null) {
      await addNotificationsToConversation([remoteNotification.id], conversationRemoteId);
    }

    var tags = remoteNotification.tags;

    if (tags?.isNotEmpty == true) {
      await updateNotificationTags(notificationRemoteId, tags);
    }

    var reblog = remoteNotification.reblog;
    if (reblog != null) {
      // list & conversation should be null. We don't need reblogs in
      // conversations & lists
      upsertRemoteNotification(reblog,
          listRemoteId: null, conversationRemoteId: null);
    }
  }

  @override
  Future upsertRemoteNotifications(List<IPleromaNotification> remoteNotifications,
      {@required String listRemoteId,
      @required String conversationRemoteId}) async {
    _logger.finer(() => "upsertRemoteNotifications ${remoteNotifications.length} "
        "listRemoteId => $listRemoteId");
    if (remoteNotifications.isEmpty) {
      return;
    }

    List<IPleromaAccount> remoteAccounts =
        remoteNotifications.map((remoteNotification) => remoteNotification.account).toList();

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: conversationRemoteId);

    await upsertAll(remoteNotifications.map(mapRemoteNotificationToDbNotification).toList());

    if (listRemoteId != null) {
      await addNotificationsToList(
          remoteNotifications.map((remoteNotification) => remoteNotification.id).toList(),
          listRemoteId);
    }
    if (conversationRemoteId != null) {
      await addNotificationsToConversation(
          remoteNotifications.map((remoteNotification) => remoteNotification.id).toList(),
          conversationRemoteId);
    }

    // todo: rework with batch update
    for (var remoteNotification in remoteNotifications) {
      var notificationRemoteId = remoteNotification.id;
      var tags = remoteNotification.tags;
      if (tags?.isNotEmpty == true) {
        await updateNotificationTags(notificationRemoteId, tags);
      }
    }

    var reblogs = remoteNotifications
        .where((remoteNotification) => remoteNotification.reblog != null)
        .map((remoteNotification) => remoteNotification.reblog)
        .toList();
    // list & conversation should be null. We don't need reblogs in
    // conversations & lists
    upsertRemoteNotifications(reblogs,
        listRemoteId: null, conversationRemoteId: null);
  }

  Future addNotificationsToList(
      List<String> notificationRemoteIds, String listRemoteId) async {
    if (listRemoteId?.isNotEmpty == true) {
      await listsDao.insertAll(
          notificationRemoteIds
              .map((notificationRemoteId) => DbNotificationList(
                  id: null,
                  notificationRemoteId: notificationRemoteId,
                  listRemoteId: listRemoteId))
              .toList(),
          InsertMode.insertOrReplace);
    }
  }

  Future addNotificationsToConversation(
      List<String> notificationRemoteIds, String conversationRemoteId) async {

    var alreadyAddedConversationNotifications = await conversationNotificationsDao
        .findByConversationRemoteId
    (conversationRemoteId);
    var alreadyAddedConversationNotificationsIds =
        alreadyAddedConversationNotifications.map((conversationNotification) =>
        conversationNotification.notificationRemoteId);
    var notAddedYetNotificationRemoteIds = notificationRemoteIds.where((notificationRemoteId) {
      return !alreadyAddedConversationNotificationsIds.contains(notificationRemoteId);
    });

    if (notAddedYetNotificationRemoteIds?.isNotEmpty == true) {
      await conversationNotificationsDao.insertAll(
          notAddedYetNotificationRemoteIds
              .map((notificationRemoteId) => DbConversationNotification(
                  id: null,
                  notificationRemoteId: notificationRemoteId,
                  conversationRemoteId: conversationRemoteId))
              .toList(),
          InsertMode.insertOrReplace);
    }
  }

  Future updateNotificationTags(String notificationRemoteId, List<IPleromaTag> tags) async {
    if (tags != null) {
      await hashtagsDao.deleteByNotificationRemoteId(notificationRemoteId);
      await hashtagsDao.insertAll(
          tags
              .map((remoteTag) => DbNotificationHashtag(
                  id: null,
                  notificationRemoteId: notificationRemoteId,
                  hashtag: remoteTag.name))
              .toList(),
          InsertMode.insertOrReplace);
    }
  }

  @override
  Future<DbNotificationPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  Future<List<DbNotificationPopulatedWrapper>> getNotifications(
      {@required String onlyInListWithRemoteId,
      @required IAccount onlyFromAccount,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) async {
    var query = createQuery(
        onlyFromAccount: onlyFromAccount,
        onlyInListWithRemoteId: onlyInListWithRemoteId,
        onlyWithHashtag: onlyWithHashtag,
        onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
        onlyLocal: onlyLocal,
        onlyWithMedia: onlyWithMedia,
        onlyNotMuted: onlyNotMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive,
        onlyNoReplies: onlyNoReplies,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData,
        onlyInConversation: onlyInConversation);

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyInListWithRemoteId: onlyInListWithRemoteId,
        onlyWithHashtag: onlyWithHashtag,
        onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
        onlyInConversation: onlyInConversation,
        onlyLocal: onlyLocal,
        onlyWithMedia: onlyWithMedia,
        onlyNotMuted: onlyNotMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive,
        onlyNoReplies: onlyNoReplies,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData,
        onlyFromAccount: onlyFromAccount);

    Stream<List<DbNotificationPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccount,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t onlyInListWithRemoteId=$onlyInListWithRemoteId\n"
        "\t onlyWithHashtag=$onlyWithHashtag\n"
        "\t onlyFromAccountsFollowingByAccount=$onlyFromAccountsFollowingByAccount\n"
        "\t onlyFromAccount=$onlyFromAccount\n"
        "\t onlyInConversation=$onlyInConversation\n"
        "\t onlyLocal=$onlyLocal\n"
        "\t onlyWithMedia=$onlyWithMedia\n"
        "\t onlyNotMuted=$onlyNotMuted\n"
        "\t excludeVisibilities=$excludeVisibilities\n"
        "\t olderThanNotification=$olderThanNotification\n"
        "\t newerThanNotification=$newerThanNotification\n"
        "\t onlyNoNsfwSensitive=$onlyNoNsfwSensitive\n"
        "\t onlyNoReplies=$onlyNoReplies\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
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

    if (onlyNotMuted == true) {
      dao.addOnlyNotMutedWhere(query);
    }

    if (onlyNoNsfwSensitive == true) {
      dao.addOnlyNoNsfwSensitiveWhere(query);
    }

    if (onlyNoReplies == true) {
      dao.addOnlyNoRepliesWhere(query);
    }

    if (excludeVisibilities?.isNotEmpty == true) {
      dao.addExcludeVisibilitiesWhere(query, excludeVisibilities);
    }

    if (olderThanNotification != null || newerThanNotification != null) {
      dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanNotification?.remoteId,
          minimumRemoteIdExcluding: newerThanNotification?.remoteId);
    }

    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var needFilterByFollowing = onlyFromAccountsFollowingByAccount != null;
    var needFilterByList = onlyInListWithRemoteId?.isNotEmpty == true;
    var needFilterByTag = onlyWithHashtag?.isNotEmpty == true;
    var needFilterByConversation = onlyInConversation != null;
    var joinQuery = query.join(
      dao.populateNotificationJoin(
          includeAccountFollowing: needFilterByFollowing,
          includeNotificationLists: needFilterByList,
          includeNotificationHashtags: needFilterByTag,
          includeConversations: needFilterByConversation),
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

  DbNotificationPopulatedWrapper mapDataClassToItem(DbNotificationPopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbNotificationPopulatedWrapper(dataClass);
  }

  Insertable<DbNotification> mapItemToDataClass(DbNotificationPopulatedWrapper item) {
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

    await accountRepository.upsertRemoteAccount(remoteAccount, conversationRemoteId: null);

    await updateById(
        oldLocalNotification.localId, mapRemoteNotificationToDbNotification(newRemoteNotification));

    var notificationRemoteId = newRemoteNotification.id;

    var tags = newRemoteNotification.tags;

    if (tags?.isNotEmpty == true) {
      await updateNotificationTags(notificationRemoteId, tags);
    }

    if (newRemoteNotification.reblog != null) {
      upsertRemoteNotification(newRemoteNotification,
          listRemoteId: null, conversationRemoteId: null);
    }
  }

  @override
  Future<DbNotificationPopulatedWrapper> getNotification(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required NotificationOrderingTermData orderingTermData}) async {
    var query = createQuery(
        onlyFromAccount: onlyFromAccount,
        onlyInListWithRemoteId: onlyInListWithRemoteId,
        onlyWithHashtag: onlyWithHashtag,
        onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
        onlyLocal: onlyLocal,
        onlyWithMedia: onlyWithMedia,
        onlyNotMuted: onlyNotMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive,
        onlyNoReplies: onlyNoReplies,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData,
        onlyInConversation: onlyInConversation);

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbNotificationPopulatedWrapper> watchNotification(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccount,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required NotificationOrderingTermData orderingTermData}) {
    var query = createQuery(
        onlyInListWithRemoteId: onlyInListWithRemoteId,
        onlyWithHashtag: onlyWithHashtag,
        onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
        onlyInConversation: onlyInConversation,
        onlyLocal: onlyLocal,
        onlyWithMedia: onlyWithMedia,
        onlyNotMuted: onlyNotMuted,
        excludeVisibilities: excludeVisibilities,
        olderThanNotification: olderThanNotification,
        newerThanNotification: newerThanNotification,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive,
        onlyNoReplies: onlyNoReplies,
        limit: 1,
        offset: null,
        orderingTermData: orderingTermData,
        onlyFromAccount: onlyFromAccount);

    Stream<DbNotificationPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbNotification) => mapDataClassToItem(dbNotification));
  }
}
