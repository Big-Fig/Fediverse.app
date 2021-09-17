import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_model_adapter.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';
import '../database/notification_database_test_helper.dart';
import '../notification_test_helper.dart';
import 'notification_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword

const String baseUrl = 'https://pleroma.com';
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

    dbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed1');
    var accountId = await accountRepository.insertInDbType(
      dbAccount,
      mode: null,
    );
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed3',
      dbAccount: dbAccount,
    );

    dbStatusPopulated =
        await StatusDatabaseMockHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );

    var reblogDbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed11');
    await accountRepository.insertInDbType(
      reblogDbAccount,
      mode: null,
    );
    var reblogDbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed33',
      dbAccount: reblogDbAccount,
    );
    await statusRepository.insertInDbType(
      reblogDbStatus,
      mode: null,
    );

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

    await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );

    dbNotification =
        await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed4',
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
    var id = await notificationRepository.insertInDbType(
      dbNotification,
      mode: null,
    );
    assert(id > 0, true);
    NotificationDatabaseMockHelper.expectDbNotificationPopulated(
      (await notificationRepository.findByDbIdInAppType(id))!,
      dbNotificationPopulated,
    );
  });

  test('upsertAll', () async {
    var dbNotification1 =
        (await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed5',
      dbAccount: dbAccount,
    ))
            .copyWith(remoteId: 'remoteId1');
    // same remote id
    var dbNotification2 =
        (await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed6',
      dbAccount: dbAccount,
    ))
            .copyWith(remoteId: 'remoteId1');

    await notificationRepository.upsertAllInDbType(
      [dbNotification1],
      batchTransaction: null,
    );

    expect((await notificationRepository.getAllInAppType()).length, 1);

    await notificationRepository.upsertAllInDbType(
      [dbNotification2],
      batchTransaction: null,
    );
    expect((await notificationRepository.getAllInAppType()).length, 1);

    NotificationDatabaseMockHelper.expectDbNotificationPopulated(
      (await notificationRepository.getAllInAppType()).first,
      await NotificationDatabaseMockHelper.createTestNotificationPopulated(
        dbNotification2,
        accountRepository,
      ),
    );
  });

  test('updateById', () async {
    var id = await notificationRepository.insertInDbType(
      dbNotification,
      mode: null,
    );
    assert(id > 0, true);

    await notificationRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbNotification.copyWith(remoteId: 'newRemoteId'),
      batchTransaction: null,
    );

    expect(
      (await notificationRepository.findByDbIdInAppType(id))!.remoteId,
      'newRemoteId',
    );
  });

  test('updateLocalNotificationByRemoteNotification', () async {
    var id = await notificationRepository.insertInDbType(
      dbNotification.copyWith(
        type: UnifediApiNotificationType.followValue.stringValue,
      ),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalNotification = DbNotificationPopulatedWrapper(
      dbNotificationPopulated: DbNotificationPopulated.statusPopulated(
        dbNotification: dbNotification.copyWith(id: id),
        dbAccount: dbAccount,
        dbStatusPopulated: dbStatusPopulated,
      ),
    );
    var newContent = 'newContent';
    var newAcct = 'newAcct';
    var newType = UnifediApiNotificationType.reblogValue;
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
    ).toUnifediApiNotification();
    await notificationRepository.updateNotificationByRemoteType(
      appItem: oldLocalNotification,
      remoteItem: newRemoteNotification,
      unread: true,
      batchTransaction: null,
    );

    expect(
      (await notificationRepository.findByDbIdInAppType(id))!.status!.content,
      newContent,
    );
    expect(
      (await notificationRepository.findByDbIdInAppType(id))!.type,
      newType.toJsonValue(),
    );
    expect(
      (await notificationRepository.findByDbIdInAppType(id))!.account!.acct,
      newAcct,
    );
  });

  test('findByRemoteId', () async {
    await notificationRepository.insertInDbType(
      dbNotification,
      mode: null,
    );
    NotificationDatabaseMockHelper.expectDbNotificationPopulated(
      (await notificationRepository
          .findByRemoteIdInAppType(dbNotification.remoteId))!,
      dbNotificationPopulated,
    );
  });

  test('upsertRemoteNotification', () async {
    expect(await notificationRepository.countAll(), 0);

    var remoteNotification = DbNotificationPopulatedWrapper(
      dbNotificationPopulated: dbNotificationPopulated,
    ).toUnifediApiNotification();
    await notificationRepository.upsertRemoteNotification(
      remoteNotification,
      unread: false,
      batchTransaction: null,
    );

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(dbNotification.remoteId))!,
      dbNotification,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    StatusDatabaseMockHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );

    // item with same id updated
    await notificationRepository.upsertRemoteNotification(
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: dbNotificationPopulated,
      ).toUnifediApiNotification(),
      unread: false,
      batchTransaction: null,
    );
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(dbNotification.remoteId))!,
      dbNotification,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    StatusDatabaseMockHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('upsertRemoteNotifications', () async {
    expect(await notificationRepository.countAll(), 0);

    await notificationRepository.upsertRemoteNotifications(
      [
        DbNotificationPopulatedWrapper(
          dbNotificationPopulated: dbNotificationPopulated,
        ).toUnifediApiNotification(),
      ],
      unread: false,
      batchTransaction: null,
    );

    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(dbNotification.remoteId))!,
      dbNotification,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    StatusDatabaseMockHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );

    await notificationRepository.upsertRemoteNotifications(
      [
        DbNotificationPopulatedWrapper(
          dbNotificationPopulated: dbNotificationPopulated,
        ).toUnifediApiNotification(),
      ],
      unread: false,
      batchTransaction: null,
    );

    // update item with same id
    expect(await notificationRepository.countAll(), 1);
    // with reblog
    expect(await statusRepository.countAll(), 2);
    expect(await accountRepository.countAll(), 2);
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(dbNotification.remoteId))!,
      dbNotification,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
    StatusDatabaseMockHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
  });

  test('createQuery empty', () async {
    var query = notificationRepository.createQuery(
      pagination: null,
      filters: null,
      orderingTermData: null,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 1);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
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
          UnifediApiNotificationType.followValue,
        ],
      ),
      orderingTermData: NotificationRepositoryOrderingTermData.createdAtDesc,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: UnifediApiNotificationType.followValue.stringValue,
      ),
    );

    expect((await query.get()).length, 0);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: UnifediApiNotificationType.reblogValue.stringValue,
      ),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery newerThanNotification', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<INotification>(
        newerThanItem: await NotificationMockHelper.createTestNotification(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          createdAt: DateTime(5),
        ),
      ),
      orderingTermData: NotificationRepositoryOrderingTermData.createdAtDesc,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId4',
        createdAt: DateTime(4),
      ),
    );

    expect((await query.get()).length, 0);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId5',
        createdAt: DateTime(5),
      ),
    );

    expect((await query.get()).length, 0);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId6',
        createdAt: DateTime(6),
      ),
    );

    expect((await query.get()).length, 1);
    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId7',
        createdAt: DateTime(7),
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanNotification', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<INotification>(
        olderThanItem: await NotificationMockHelper.createTestNotification(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
          createdAt: DateTime(5),
        ),
      ),
      orderingTermData: NotificationRepositoryOrderingTermData.createdAtDesc,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId3',
        createdAt: DateTime(3),
      ),
    );

    expect((await query.get()).length, 1);
    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId4',
        createdAt: DateTime(4),
      ),
    );

    expect((await query.get()).length, 2);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId5',
        createdAt: DateTime(5),
      ),
    );

    expect((await query.get()).length, 2);

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        remoteId: 'remoteId6',
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
          newerThanItem: await NotificationMockHelper.createTestNotification(
            seed: 'remoteId2',
            remoteId: 'remoteId2',
            createdAt: DateTime(2),
          ),
          olderThanItem: await NotificationMockHelper.createTestNotification(
            seed: 'remoteId5',
            remoteId: 'remoteId5',
            createdAt: DateTime(5),
          ),
        ),
        orderingTermData: NotificationRepositoryOrderingTermData.createdAtDesc,
      );

      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed1',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId1',
          createdAt: DateTime(1),
        ),
      );

      expect((await query.get()).length, 0);

      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed2',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId2',
          createdAt: DateTime(2),
        ),
      );

      expect((await query.get()).length, 0);
      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed3',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId3',
          createdAt: DateTime(3),
        ),
      );

      expect((await query.get()).length, 1);

      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed4',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId4',
          createdAt: DateTime(4),
        ),
      );

      expect((await query.get()).length, 2);

      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed5',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId5',
          createdAt: DateTime(5),
        ),
      );

      expect((await query.get()).length, 2);

      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed6',
          dbAccount: dbAccount,
        ))
            .copyWith(
          remoteId: 'remoteId6',
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
      orderingTermData: NotificationRepositoryOrderingTermData.remoteIdAsc,
    );

    var notification2 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    var notification1 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    var notification3 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = (await query.get());
    expect(actualList.length, 3);

    expect(
      actualList[0].toDbNotification(),
      notification1,
    );
    expect(
      actualList[1].toDbNotification(),
      notification2,
    );
    expect(
      actualList[2].toDbNotification(),
      notification3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = notificationRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: NotificationRepositoryOrderingTermData.remoteIdDesc,
    );

    var notification2 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    var notification1 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    var notification3 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = (await query.get());
    expect(actualList.length, 3);

    expect(
      actualList[0].toDbNotification(),
      notification3,
    );
    expect(
      actualList[1].toDbNotification(),
      notification2,
    );
    expect(
      actualList[2].toDbNotification(),
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
      orderingTermData: NotificationRepositoryOrderingTermData.remoteIdDesc,
    );

    var notification2 =
        await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId2'),
    );
    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId1'),
    );
    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = (await query.get());
    expect(actualList.length, 1);

    expect(
      actualList[0].toDbNotification(),
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
        orderingTermData: NotificationRepositoryOrderingTermData.createdAtDesc,
      );

      var notification2 =
          await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed2',
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(2)),
      );
      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed1',
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(1)),
      );
      await NotificationRepositoryMockHelper.insertDbNotification(
        notificationRepository,
        (await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: 'seed3',
          dbAccount: dbAccount,
        ))
            .copyWith(createdAt: DateTime(3)),
      );

      var actualList = (await query.get());
      expect(actualList.length, 1);

      expect(
        actualList[0].toDbNotification(),
        notification2,
      );
    },
  );

  test('countUnread', () async {
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      0,
    );
    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed1',
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: UnifediApiNotificationType.followValue.stringValue,
        unread: true,
      ),
    );

    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.reblog,
          onlyUnread: true,
        ),
      )),
      0,
    );
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.followValue,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      1,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed2',
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: UnifediApiNotificationType.followValue.stringValue,
        unread: false,
      ),
    );

    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.reblogValue,
          onlyUnread: true,
        ),
      )),
      0,
    );
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.followValue,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyUnread: true,
        ),
      )),
      1,
    );

    await NotificationRepositoryMockHelper.insertDbNotification(
      notificationRepository,
      (await NotificationDatabaseMockHelper.createTestDbNotification(
        seed: 'seed3',
        dbAccount: dbAccount,
      ))
          .copyWith(
        type: UnifediApiNotificationType.reblogValue.stringValue,
        unread: true,
      ),
    );

    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.reblogValue,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.calculateCount(
        filters: NotificationRepositoryFilters(
          onlyWithType: UnifediApiNotificationType.followValue,
          onlyUnread: true,
        ),
      )),
      1,
    );
    expect(
      (await notificationRepository.calculateCount(
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
  //   await NotificationRepositoryMockHelper.insertDbNotification(
  //       notificationRepository,
  //       (await NotificationDatabaseMockHelper.createTestDbNotification(seed: 'seed1', dbAccount: dbAccount))
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
  //   await NotificationRepositoryMockHelper.insertDbNotification(
  //       notificationRepository,
  //       (await NotificationDatabaseMockHelper.createTestDbNotification(seed: 'seed2', dbAccount: dbAccount))
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
  //   await NotificationRepositoryMockHelper.insertDbNotification(
  //       notificationRepository,
  //       (await NotificationDatabaseMockHelper.createTestDbNotification(seed: 'seed3', dbAccount: dbAccount))
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
