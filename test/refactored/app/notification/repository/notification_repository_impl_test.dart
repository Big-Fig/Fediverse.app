import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/notification_model_adapter.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';


import '../../account/database/account_database_model_helper.dart';
import '../../account/repository/account_repository_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../../status/repository/status_repository_model_helper.dart';
import 'notification_repository_model_helper.dart';


final String baseUrl = "https://pleroma.com";

void main() {
  AppDatabase database;
  AccountRepository accountRepository;
  StatusRepository statusRepository;
  NotificationRepository notificationRepository;

  DbStatusPopulated dbStatusPopulated;
  DbStatus dbStatus;

  DbNotificationPopulated dbNotificationPopulated;
  DbNotification dbNotification;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
        appDatabase: database, accountRepository: accountRepository);
    notificationRepository = NotificationRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        statusRepository: statusRepository);

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestDbStatus(seed: "seed3", dbAccount: dbAccount);

    dbStatusPopulated =
        await createTestDbStatusPopulated(dbStatus, accountRepository);

    var reblogDbAccount = await createTestDbAccount(seed: "seed11");
    accountRepository.insert(reblogDbAccount);
    var reblogDbStatus =
        await createTestDbStatus(seed: "seed33", dbAccount: reblogDbAccount);
    await statusRepository.insert(reblogDbStatus);

    dbStatus = dbStatus.copyWith(reblogStatusRemoteId: reblogDbStatus.remoteId);

    dbStatusPopulated = DbStatusPopulated(
        dbStatus: dbStatus,
        dbAccount: dbAccount,
        reblogDbStatus: reblogDbStatus,
        reblogDbStatusAccount: reblogDbAccount);

    await statusRepository.insert(dbStatus);

    dbNotification = await createTestNotification(
        seed: "seed4", dbAccount: dbAccount, dbStatus: dbStatus);

    dbNotificationPopulated = DbNotificationPopulated(
        notification: dbNotification,
        account: dbAccount,
        statusPopulated: dbStatusPopulated);
  });

  tearDown(() async {
    accountRepository.dispose();
    statusRepository.dispose();
    notificationRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await notificationRepository.insert(dbNotification);
    assert(id != null, true);
    expectDbNotificationPopulated(
        await notificationRepository.findById(id), dbNotificationPopulated);
  });

  test('upsertAll', () async {
    var dbNotification1 =
        (await createTestNotification(seed: "seed5", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbNotification2 =
        (await createTestNotification(seed: "seed6", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1");

    await notificationRepository.upsertAll([dbNotification1]);

    expect((await notificationRepository.getAll()).length, 1);

    await notificationRepository.upsertAll([dbNotification2]);
    expect((await notificationRepository.getAll()).length, 1);

    expectDbNotificationPopulated(
        (await notificationRepository.getAll()).first,
        await createTestNotificationPopulated(
            dbNotification2, accountRepository));
  });

  test('updateById', () async {
    var id = await notificationRepository.insert(dbNotification);
    assert(id != null, true);

    await notificationRepository.updateById(
        id, dbNotification.copyWith(remoteId: "newRemoteId"));

    expect((await notificationRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('updateLocalNotificationByRemoteNotification', () async {
    var id = await notificationRepository
        .insert(dbNotification.copyWith(type: MastodonNotificationType.follow));
    assert(id != null, true);

    var oldLocalNotification = DbNotificationPopulatedWrapper(
        DbNotificationPopulated(
            notification: dbNotification.copyWith(id: id),
            account: dbAccount,
            statusPopulated: dbStatusPopulated));
    var newContent = "newContent";
    var newAcct = "newAcct";
    var newType = MastodonNotificationType.reblog;
    var newRemoteNotification = mapLocalNotificationToRemoteNotification(
        DbNotificationPopulatedWrapper(DbNotificationPopulated(
            notification: dbNotification.copyWith(id: id),
            account: dbAccount.copyWith(acct: newAcct),
            statusPopulated: DbStatusPopulated(
              dbStatus: dbStatus.copyWith(content: newContent),
              dbAccount: dbAccount.copyWith(acct: newAcct),
              reblogDbStatusAccount: null,
              reblogDbStatus: null,
            ))));
    await notificationRepository.updateLocalNotificationByRemoteNotification(
      oldLocalNotification: oldLocalNotification,
      newRemoteNotification: newRemoteNotification,
      unread: true,
    );

    expect(
        (await notificationRepository.findById(id)).status.content, newContent);
    expect((await notificationRepository.findById(id)).type, newType);
    expect((await notificationRepository.findById(id)).account.acct, newAcct);
  });

  test('findByRemoteId', () async {
    await notificationRepository.insert(dbNotification);
    expectDbNotificationPopulated(
        await notificationRepository.findByRemoteId(dbNotification.remoteId),
        dbNotificationPopulated);
  });

  test('upsertRemoteNotification', () async {
    expect(await notificationRepository.countAll(), 0);

    await notificationRepository.upsertRemoteNotification(
        mapLocalNotificationToRemoteNotification(
            DbNotificationPopulatedWrapper(dbNotificationPopulated)),
        conversationRemoteId: null,
        listRemoteId: null,
        unread: false);

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
        await notificationRepository.findByRemoteId(dbNotification.remoteId),
        dbNotification);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);

    // item with same id updated
    await notificationRepository.upsertRemoteNotification(
        mapLocalNotificationToRemoteNotification(
            DbNotificationPopulatedWrapper(dbNotificationPopulated)),
        conversationRemoteId: null,
        listRemoteId: null,
        unread: false);
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
        await notificationRepository.findByRemoteId(dbNotification.remoteId),
        dbNotification);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);
  });

  test('upsertRemoteNotifications', () async {
    expect(await notificationRepository.countAll(), 0);
    await notificationRepository.upsertRemoteNotifications([
      mapLocalNotificationToRemoteNotification(
          DbNotificationPopulatedWrapper(dbNotificationPopulated)),
    ], conversationRemoteId: null, listRemoteId: null, unread: false);

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
        await notificationRepository.findByRemoteId(dbNotification.remoteId),
        dbNotification);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);

    await notificationRepository.upsertRemoteNotifications([
      mapLocalNotificationToRemoteNotification(
          DbNotificationPopulatedWrapper(dbNotificationPopulated)),
    ], conversationRemoteId: null, listRemoteId: null, unread: false);

    // update item with same id
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
        await notificationRepository.findByRemoteId(dbNotification.remoteId),
        dbNotification);
    expectDbAccount(
        await accountRepository.findByRemoteId(dbAccount.remoteId), dbAccount);
    expectDbStatus(
        await statusRepository.findByRemoteId(dbStatus.remoteId), dbStatus);
  });

  test('createQuery empty', () async {
    var query = notificationRepository.createQuery(
      onlyWithType: null,
      olderThanNotification: null,
      newerThanNotification: null,
      limit: null,
      offset: null,
      orderingTermData: null,
    );

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith());

    expect((await query.get()).length, 1);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith());
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyWithType', () async {
    var query = notificationRepository.createQuery(
      onlyWithType: MastodonNotificationType.reblog,
      olderThanNotification: null,
      newerThanNotification: null,
      limit: null,
      offset: null,
      orderingTermData: null,
    );

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(type: MastodonNotificationType.follow));

    expect((await query.get()).length, 0);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(type: MastodonNotificationType.reblog));
    expect((await query.get()).length, 1);
  });
  test('countUnread', () async {
    expect((await notificationRepository.countUnreadAnyType()), 0);
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(type: MastodonNotificationType.follow, unread: true));

    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.reblog)),
        0);
    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.follow)),
        1);
    expect((await notificationRepository.countUnreadAnyType()), 1);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(type: MastodonNotificationType.follow, unread: false));

    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.reblog)),
        0);
    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.follow)),
        1);
    expect((await notificationRepository.countUnreadAnyType()), 1);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(type: MastodonNotificationType.reblog, unread: true));

    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.reblog)),
        1);
    expect(
        (await notificationRepository.countUnreadByType(
            type: MastodonNotificationType.follow)),
        1);
    expect((await notificationRepository.countUnreadAnyType()), 2);
  });

  test('createQuery newerThanNotification', () async {
    var query = notificationRepository.createQuery(
        newerThanNotification:
            createFakePopulatedNotificationWithRemoteId("remoteId5"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanNotification: null,
        onlyWithType: null);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanNotification', () async {
    var query = notificationRepository.createQuery(
        newerThanNotification: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanNotification:
            createFakePopulatedNotificationWithRemoteId("remoteId5"),
        onlyWithType: null);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanNotification & newerThanNotification',
      () async {
    var query = notificationRepository.createQuery(
        newerThanNotification:
            createFakePopulatedNotificationWithRemoteId("remoteId2"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThanNotification:
            createFakePopulatedNotificationWithRemoteId("remoteId5"),
        onlyWithType: null);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed4", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed5", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed6", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = notificationRepository.createQuery(
        newerThanNotification: null,
        limit: null,
        offset: null,
        orderingTermData: NotificationOrderingTermData(
            orderByType: NotificationOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        olderThanNotification: null,
        onlyWithType: null);

    var notification2 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var notification1 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var notification3 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 3);

    expectActualNotification(actualList[0], notification1, dbAccount);
    expectActualNotification(actualList[1], notification2, dbAccount);
    expectActualNotification(actualList[2], notification3, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = notificationRepository.createQuery(
        newerThanNotification: null,
        limit: null,
        offset: null,
        orderingTermData: NotificationOrderingTermData(
            orderByType: NotificationOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanNotification: null,
        onlyWithType: null);

    var notification2 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var notification1 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var notification3 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 3);

    expectActualNotification(actualList[0], notification3, dbAccount);
    expectActualNotification(actualList[1], notification2, dbAccount);
    expectActualNotification(actualList[2], notification1, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = notificationRepository.createQuery(
        newerThanNotification: null,
        limit: 1,
        offset: 1,
        orderingTermData: NotificationOrderingTermData(
            orderByType: NotificationOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThanNotification: null,
        onlyWithType: null);

    var notification2 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId2"));
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId1"));
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 1);

    expectActualNotification(actualList[0], notification2, dbAccount);
  });

  test('createQuery orderingTermData createdAt desc & limit & offset',
      () async {
    var query = notificationRepository.createQuery(
        newerThanNotification: null,
        limit: 1,
        offset: 1,
        orderingTermData: NotificationOrderingTermData(
            orderByType: NotificationOrderByType.createdAt,
            orderingMode: OrderingMode.desc),
        olderThanNotification: null,
        onlyWithType: null);

    var notification2 = await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(createdAt: DateTime(2)));
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed1", dbAccount: dbAccount))
            .copyWith(createdAt: DateTime(1)));
    await insertDbNotification(
        notificationRepository,
        (await createTestNotification(seed: "seed3", dbAccount: dbAccount))
            .copyWith(createdAt: DateTime(3)));

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 1);

    expectActualNotification(actualList[0], notification2, dbAccount);
  });
}
