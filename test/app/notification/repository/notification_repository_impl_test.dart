import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_model_adapter.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../database/notification_database_model_helper.dart';
import '../notification_model_helper.dart';
import 'notification_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

void main() {
  late AppDatabase database;
  late AccountRepository accountRepository;
  late StatusRepository statusRepository;
  late PleromaChatMessageRepository chatMessageRepository;
  late NotificationRepository notificationRepository;

  late DbStatusPopulated dbStatusPopulated;
  late DbStatus dbStatus;

  late DbNotificationPopulated dbNotificationPopulated;
  late DbNotification dbNotification;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    notificationRepository = NotificationRepository(
      appDatabase: database,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: chatMessageRepository,
    );

    dbAccount = await createTestDbAccount(seed: "seed1");
    var accountId = await accountRepository.insert(dbAccount);
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    );

    dbStatusPopulated = await createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );

    var reblogDbAccount = await createTestDbAccount(seed: "seed11");
    await accountRepository.insert(reblogDbAccount);
    var reblogDbStatus = await createTestDbStatus(
      seed: "seed33",
      dbAccount: reblogDbAccount,
    );
    await statusRepository.insert(reblogDbStatus);

    dbStatus = dbStatus.copyWith(reblogStatusRemoteId: reblogDbStatus.remoteId);

    dbStatusPopulated = DbStatusPopulated(
      dbStatus: dbStatus,
      dbAccount: dbAccount,
      reblogDbStatus: reblogDbStatus,
      reblogDbStatusAccount: reblogDbAccount,
      replyReblogDbStatus: null,
      replyDbStatusAccount: null,
      replyReblogDbStatusAccount: null,
      replyDbStatus: null,
    );

    await statusRepository.insert(dbStatus);

    dbNotification = await createTestDbNotification(
      seed: "seed4",
      dbAccount: dbAccount,
      dbStatus: dbStatus,
    );

    dbNotificationPopulated = DbNotificationPopulated.statusPopulated(
      dbNotification: dbNotification,
      dbAccount: dbAccount,
      dbStatusPopulated: dbStatusPopulated,
    );
  });

  tearDown(() async {
    await accountRepository.dispose();
    await statusRepository.dispose();
    await notificationRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await notificationRepository.insert(dbNotification);
    assert(id > 0, true);
    expectDbNotificationPopulated(
      await notificationRepository.findById(id),
      dbNotificationPopulated,
    );
  });

  test('upsertAll', () async {
    var dbNotification1 = (await createTestDbNotification(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbNotification2 = (await createTestDbNotification(
      seed: "seed6",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");

    await notificationRepository.upsertAll([dbNotification1]);

    expect((await notificationRepository.getAll()).length, 1);

    await notificationRepository.upsertAll([dbNotification2]);
    expect((await notificationRepository.getAll()).length, 1);

    expectDbNotificationPopulated(
      (await notificationRepository.getAll()).first,
      await createTestNotificationPopulated(
        dbNotification2,
        accountRepository,
      ),
    );
  });

  test('updateById', () async {
    var id = await notificationRepository.insert(dbNotification);
    assert(id > 0, true);

    await notificationRepository.updateById(
      id,
      dbNotification.copyWith(remoteId: "newRemoteId"),
    );

    expect(
      (await notificationRepository.findById(id)).remoteId,
      "newRemoteId",
    );
  });

  test('updateLocalNotificationByRemoteNotification', () async {
    var id = await notificationRepository.insert(
      dbNotification.copyWith(
        type: PleromaNotificationType.follow.toJsonValue(),
      ),
    );
    assert(id > 0, true);

    var oldLocalNotification = DbNotificationPopulatedWrapper(
      dbNotificationPopulated: DbNotificationPopulated.statusPopulated(
        dbNotification: dbNotification.copyWith(id: id),
        dbAccount: dbAccount,
        dbStatusPopulated: dbStatusPopulated,
      ),
    );
    var newContent = "newContent";
    var newAcct = "newAcct";
    var newType = PleromaNotificationType.reblog;
    var newRemoteNotification = DbNotificationPopulatedWrapper(
      dbNotificationPopulated: DbNotificationPopulated.statusPopulated(
        dbNotification: dbNotification.copyWith(id: id),
        dbAccount: dbAccount.copyWith(acct: newAcct),
        dbStatusPopulated: DbStatusPopulated(
          dbStatus: dbStatus.copyWith(content: newContent),
          dbAccount: dbAccount.copyWith(acct: newAcct),
          reblogDbStatusAccount: null,
          reblogDbStatus: null,
          replyReblogDbStatus: null,
          replyDbStatusAccount: null,
          replyReblogDbStatusAccount: null,
          replyDbStatus: null,
        ),
      ),
    ).toPleromaNotification();
    await notificationRepository.updateLocalNotificationByRemoteNotification(
      oldLocalNotification: oldLocalNotification,
      newRemoteNotification: newRemoteNotification,
      unread: true,
    );

    expect(
      (await notificationRepository.findById(id)).status!.content,
      newContent,
    );
    expect(
      (await notificationRepository.findById(id)).type,
      newType.toJsonValue(),
    );
    expect((await notificationRepository.findById(id)).account!.acct, newAcct);
  });

  test('findByRemoteId', () async {
    await notificationRepository.insert(dbNotification);
    expectDbNotificationPopulated(
      (await notificationRepository.findByRemoteId(dbNotification.remoteId))!,
      dbNotificationPopulated,
    );
  });

  test('upsertRemoteNotification', () async {
    expect(await notificationRepository.countAll(), 0);

    await notificationRepository.upsertRemoteNotification(
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: dbNotificationPopulated,
      ).toPleromaNotification(),
      unread: false,
    );

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
      (await notificationRepository.findByRemoteId(dbNotification.remoteId))!,
      dbNotification,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteId(dbStatus.remoteId),
      dbStatus,
    );

    // item with same id updated
    await notificationRepository.upsertRemoteNotification(
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: dbNotificationPopulated,
      ).toPleromaNotification(),
      unread: false,
    );
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
      (await notificationRepository.findByRemoteId(dbNotification.remoteId))!,
      dbNotification,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteId(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('upsertRemoteNotifications', () async {
    expect(await notificationRepository.countAll(), 0);
    await notificationRepository.upsertRemoteNotifications(
      [
        DbNotificationPopulatedWrapper(
          dbNotificationPopulated: dbNotificationPopulated,
        ).toPleromaNotification(),
      ],
      unread: false,
    );

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
      (await notificationRepository.findByRemoteId(dbNotification.remoteId))!,
      dbNotification,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteId(dbStatus.remoteId),
      dbStatus,
    );

    await notificationRepository.upsertRemoteNotifications(
      [
        DbNotificationPopulatedWrapper(
          dbNotificationPopulated: dbNotificationPopulated,
        ).toPleromaNotification(),
      ],
      unread: false,
    );

    // update item with same id
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    expectDbNotification(
      (await notificationRepository.findByRemoteId(dbNotification.remoteId))!,
      dbNotification,
    );
    expectDbAccount(
      await accountRepository.findByRemoteId(dbAccount.remoteId),
      dbAccount,
    );
    expectDbStatus(
      await statusRepository.findByRemoteId(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('createQuery empty', () async {
    var query = notificationRepository.createQuery(
      pagination: null,
      filters: null,
      orderingTermData: null,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 1);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery excludeTypes', () async {
    var query = notificationRepository.createQuery(
      pagination: null,
      filters: NotificationRepositoryFilters(
        excludeTypes: [
          PleromaNotificationType.follow,
        ],
      ),
      orderingTermData: NotificationOrderingTermData.createdAtDesc,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: PleromaNotificationType.follow.toJsonValue(),
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: PleromaNotificationType.reblog.toJsonValue(),
      ),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery newerThanNotification', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<INotification>(
        newerThanItem: await createTestNotification(
          seed: "remoteId5",
          remoteId: "remoteId5",
          createdAt: DateTime(5),
        ),
      ),
      orderingTermData: NotificationOrderingTermData.createdAtDesc,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId4",
        createdAt: DateTime(4),
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId5",
        createdAt: DateTime(5),
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId6",
        createdAt: DateTime(6),
      ),
    );

    expect((await query.get()).length, 1);
    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId7",
        createdAt: DateTime(7),
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanNotification', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<INotification>(
        olderThanItem: await createTestNotification(
          seed: "remoteId5",
          remoteId: "remoteId5",
          createdAt: DateTime(5),
        ),
      ),
      orderingTermData: NotificationOrderingTermData.createdAtDesc,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId3",
        createdAt: DateTime(3),
      ),
    );

    expect((await query.get()).length, 1);
    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId4",
        createdAt: DateTime(4),
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId5",
        createdAt: DateTime(5),
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: "remoteId6",
        createdAt: DateTime(6),
      ),
    );

    expect((await query.get()).length, 2);
  });

  test(
    'createQuery notNewerThanNotification & newerThanNotification',
    () async {
      var query = notificationRepository.createQuery(
        filters: null,
        pagination: RepositoryPagination<INotification>(
          newerThanItem: await createTestNotification(
            seed: "remoteId2",
            remoteId: "remoteId2",
            createdAt: DateTime(2),
          ),
          olderThanItem: await createTestNotification(
            seed: "remoteId5",
            remoteId: "remoteId5",
            createdAt: DateTime(5),
          ),
        ),
        orderingTermData: NotificationOrderingTermData.createdAtDesc,
      );

      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed1",
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: "remoteId1",
          createdAt: DateTime(1),
        ),
      );

      expect((await query.get()).length, 0);

      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(seed: "seed2", dbAccount: dbAccount))
            .copyWith(
          remoteId: "remoteId2",
          createdAt: DateTime(2),
        ),
      );

      expect((await query.get()).length, 0);
      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed3",
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: "remoteId3",
          createdAt: DateTime(3),
        ),
      );

      expect((await query.get()).length, 1);

      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed4",
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: "remoteId4",
          createdAt: DateTime(4),
        ),
      );

      expect((await query.get()).length, 2);

      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed5",
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: "remoteId5",
          createdAt: DateTime(5),
        ),
      );

      expect((await query.get()).length, 2);

      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed6",
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: "remoteId6",
          createdAt: DateTime(6),
        ),
      );

      expect((await query.get()).length, 2);
    },
  );

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: NotificationOrderingTermData.remoteIdAsc,
    );

    var notification2 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var notification1 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var notification3 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 3);

    expect(
      actualList[0].dbNotification,
      notification1,
    );
    expect(
      actualList[1].dbNotification,
      notification2,
    );
    expect(
      actualList[2].dbNotification,
      notification3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: NotificationOrderingTermData.remoteIdDesc,
    );

    var notification2 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var notification1 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var notification3 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 3);

    expect(
      actualList[0].dbNotification,
      notification3,
    );
    expect(
      actualList[1].dbNotification,
      notification2,
    );
    expect(
      actualList[2].dbNotification,
      notification1,
    );
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<INotification>(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: NotificationOrderingTermData.remoteIdDesc,
    );

    var notification2 = await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    List<DbNotificationPopulated> actualList = (await query
        .map(notificationRepository.dao.typedResultToPopulated)
        .get());
    expect(actualList.length, 1);

    expect(
      actualList[0].dbNotification,
      notification2,
    );
  });

  test(
    'createQuery orderingTermData createdAt desc & limit & offset',
    () async {
      var query = notificationRepository.createQuery(
        filters: null,
        pagination: RepositoryPagination<INotification>(
          limit: 1,
          offset: 1,
        ),
        orderingTermData: NotificationOrderingTermData.createdAtDesc,
      );

      var notification2 = await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed2",
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(2)),
      );
      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed1",
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(1)),
      );
      await insertDbNotification(
        notificationRepository,
        (await createTestDbNotification(
          seed: "seed3",
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(3)),
      );

      List<DbNotificationPopulated> actualList = (await query
          .map(notificationRepository.dao.typedResultToPopulated)
          .get());
      expect(actualList.length, 1);

      expect(
        actualList[0].dbNotification,
        notification2,
      );
    },
  );

  test('countUnread', () async {
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      0,
    );
    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: PleromaNotificationType.follow.toJsonValue(),
        unread: true,
      ),
    );

    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.reblog,
          onlyUnread: true,
        ),
      )),
      0,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.follow,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      1,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: PleromaNotificationType.follow.toJsonValue(),
        unread: false,
      ),
    );

    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.reblog,
          onlyUnread: true,
        ),
      )),
      0,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.follow,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      1,
    );

    await insertDbNotification(
      notificationRepository,
      (await createTestDbNotification(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: PleromaNotificationType.reblog.toJsonValue(),
        unread: true,
      ),
    );

    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.reblog,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: PleromaNotificationType.follow,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.getCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      2,
    );
  });

  //
  // test('countUnread', () async {
  //   expect(
  //       (await notificationRepository.countUnreadAnyType(
  //         excludeStatusTextConditions: null,
  //       )),
  //       0);
  //   await insertDbNotification(
  //       notificationRepository,
  //       (await createTestDbNotification(seed: "seed1", dbAccount: dbAccount))
  //           .copyWith(
  //           type: PleromaNotificationType.follow.toJsonValue(),
  //           unread: true));
  //
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.reblog,
  //         excludeStatusTextConditions: null,
  //       )),
  //       0);
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.follow,
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //   expect(
  //       (await notificationRepository.countUnreadAnyType(
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //
  //   await insertDbNotification(
  //       notificationRepository,
  //       (await createTestDbNotification(seed: "seed2", dbAccount: dbAccount))
  //           .copyWith(
  //           type: PleromaNotificationType.follow.toJsonValue(),
  //           unread: false));
  //
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.reblog,
  //         excludeStatusTextConditions: null,
  //       )),
  //       0);
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.follow,
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //   expect(
  //       (await notificationRepository.countUnreadAnyType(
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //
  //   await insertDbNotification(
  //       notificationRepository,
  //       (await createTestDbNotification(seed: "seed3", dbAccount: dbAccount))
  //           .copyWith(
  //           type: PleromaNotificationType.reblog.toJsonValue(),
  //           unread: true));
  //
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.reblog,
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //   expect(
  //       (await notificationRepository.countUnreadByType(
  //         type: PleromaNotificationType.follow,
  //         excludeStatusTextConditions: null,
  //       )),
  //       1);
  //   expect(
  //       (await notificationRepository.countUnreadAnyType(
  //         excludeStatusTextConditions: null,
  //       )),
  //       2);
  // });
}
