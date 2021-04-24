import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import '../../../pleroma/api/media/pleroma_api_media_test_helper.dart';
import '../../../pleroma/api/tag/pleroma_api_tag_test_helper.dart';
import '../../account/database/account_database_test_helper.dart';
import '../../conversation/conversation_test_helper.dart';
import '../database/status_database_test_helper.dart';
import '../status_test_helper.dart';
import 'status_repository_test_helper.dart';

// ignore_for_file: no-magic-number
final String baseUrl = "https://pleroma.com";

void main() {
  late AppDatabase database;
  late AccountRepository accountRepository;
  late StatusRepository statusRepository;

  late DbStatusPopulated dbStatusPopulated;
  late DbStatus dbStatus;

  late DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    dbAccount =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed1");

    var accountId = await accountRepository.insertInDbType(
      dbAccount,
      mode: null,
    );
    // assign local id for further equal with data retrieved from db
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    );

    dbStatusPopulated =
        await StatusDatabaseTestHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );
  });

  tearDown(() async {
    await accountRepository.dispose();
    await statusRepository.dispose();
    await database.close();
  });

  test('insert & findByRemoteIdInAppType', () async {
    var id = await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );
    assert(id > 0, true);
    StatusDatabaseTestHelper.expectDbStatusPopulated(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatusPopulated,
    );
  });
  test('insert & find byRemoteId', () async {
    var id = await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );
    assert(id > 0, true);
    StatusDatabaseTestHelper.expectDbStatusPopulated(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatusPopulated,
    );
  });

  test('reblog join', () async {
    var reblogDbAccount =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed11");
    await accountRepository.insertInDbType(
      reblogDbAccount,
      mode: null,
    );
    var reblogDbStatus = await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed33",
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

    var id = await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );
    assert(id > 0, true);
    StatusDatabaseTestHelper.expectDbStatusPopulated(
      await statusRepository.findByDbIdInAppType(id),
      dbStatusPopulated,
    );
  });

  test('upsertRemoteStatus', () async {
    expect(await statusRepository.countAll(), 0);

    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
          .toPleromaStatus(),
      conversationRemoteId: null,
      listRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    StatusDatabaseTestHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );

    // item with same id updated
    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
          .toPleromaStatus(),
      conversationRemoteId: null,
      listRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );
    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    StatusDatabaseTestHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('upsertRemoteStatuses', () async {
    expect(await statusRepository.countAll(), 0);
    await statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: null,
      listRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    StatusDatabaseTestHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );

    await statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: null,
      listRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );

    // update item with same id
    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    StatusDatabaseTestHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('upsertAll', () async {
    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed6",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "remoteId1");

    await statusRepository.upsertAllInDbType(
      [dbStatus1],
      batchTransaction: null,
    );

    expect((await statusRepository.getAllInAppType()).length, 1);

    await statusRepository.upsertAllInDbType(
      [dbStatus2],
      batchTransaction: null,
    );
    expect((await statusRepository.getAllInAppType()).length, 1);

    StatusDatabaseTestHelper.expectDbStatusPopulated(
      (await statusRepository.getAllInAppType()).first,
      await StatusDatabaseTestHelper.createTestDbStatusPopulated(
        dbStatus2,
        accountRepository,
      ),
    );
  });

  test('updateById', () async {
    var id = await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );
    assert(id > 0, true);

    await statusRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbStatus.copyWith(remoteId: "newRemoteId"),
      batchTransaction: null,
    );

    expect(
      (await statusRepository.findByDbIdInAppType(id))?.remoteId,
      "newRemoteId",
    );
  });

  test('updateLocalStatusByRemoteStatus', () async {
    var id = await statusRepository.insertInDbType(
      dbStatus.copyWith(
        content: "oldContent",
      ),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalStatus = DbStatusPopulatedWrapper(
      dbStatusPopulated: DbStatusPopulated(
        dbStatus: dbStatus.copyWith(id: id),
        dbAccount: dbAccount,
        reblogDbStatus: null,
        reblogDbStatusAccount: null,
        replyReblogDbStatus: null,
        replyDbStatusAccount: null,
        replyReblogDbStatusAccount: null,
        replyDbStatus: null,
      ),
    );
    var newContent = "newContent";
    var newAcct = "newAcct";
    var newRemoteStatus = DbStatusPopulatedWrapper(
      dbStatusPopulated: DbStatusPopulated(
        dbStatus: dbStatus.copyWith(
          id: id,
          content: newContent,
        ),
        dbAccount: dbAccount.copyWith(acct: newAcct),
        reblogDbStatus: null,
        reblogDbStatusAccount: null,
        replyReblogDbStatus: null,
        replyDbStatusAccount: null,
        replyReblogDbStatusAccount: null,
        replyDbStatus: null,
      ),
    ).toPleromaStatus();
    await statusRepository.updateAppTypeByRemoteType(
      appItem: oldLocalStatus,
      remoteItem: newRemoteStatus,
      batchTransaction: null,
    );

    expect(
      (await statusRepository.findByDbIdInAppType(id))?.content,
      newContent,
    );
    expect(
      (await statusRepository.findByDbIdInAppType(id))?.account.acct,
      newAcct,
    );
  });

  test('findByRemoteId', () async {
    await statusRepository.insertInDbType(
      dbStatus,
      mode: null,
    );
    StatusDatabaseTestHelper.expectDbStatusPopulated(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatusPopulated,
    );
  });

  test('createQuery empty', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyLocalCondition', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyLocalCondition: StatusOnlyLocalCondition("pleroma.com"),
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(pleromaLocal: false, url: "https://pleroma.com/one"),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(pleromaLocal: false, url: "https://google.com/one"),
    );

    expect((await query.get()).length, 1);

    // check several with seed
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(pleromaLocal: false, url: "https://pleroma.com/two"),
    );

    // check local flag
    expect((await query.get()).length, 2);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: true,
        url: "https://google.com/one",
      ),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery onlyWithMedia', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyWithMedia: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(mediaAttachments: null),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(mediaAttachments: []),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(
        mediaAttachments: [
          PleromaApiMediaTestHelper.createTestPleromaMediaAttachment(),
        ],
      ),
    );

    expect((await query.get()).length, 1);
  });

  test('createQuery withMuted', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        withMuted: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
        pleromaThreadMuted: null,
      ))
          .copyWith(muted: true),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
        pleromaThreadMuted: false,
      ))
          .copyWith(muted: true),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
        pleromaThreadMuted: true,
      ))
          .copyWith(muted: false),
    );

    expect((await query.get()).length, 3);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
        pleromaThreadMuted: true,
      ))
          .copyWith(muted: true),
    );

    expect((await query.get()).length, 4);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed5",
        dbAccount: dbAccount,
        pleromaThreadMuted: false,
      ))
          .copyWith(muted: false),
    );

    expect((await query.get()).length, 5);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed6",
        dbAccount: dbAccount,
        pleromaThreadMuted: null,
      ))
          .copyWith(muted: false),
    );

    expect((await query.get()).length, 6);
  });

  test('createQuery excludeVisibilities', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        excludeVisibilities: [
          PleromaApiVisibility.direct,
          PleromaApiVisibility.unlisted,
        ],
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(visibility: PleromaApiVisibility.direct),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(visibility: PleromaApiVisibility.unlisted),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(visibility: PleromaApiVisibility.public),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(visibility: PleromaApiVisibility.list),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanStatus', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: await StatusTestHelper.createTestStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: StatusRepositoryOrderingTermData.remoteIdAsc,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 1);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId7"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery olderThanStatus', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: await StatusTestHelper.createTestStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: StatusRepositoryOrderingTermData.remoteIdAsc,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanStatus & newerThanStatus', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: await StatusTestHelper.createTestStatus(
          seed: "remoteId2",
          remoteId: "remoteId2",
        ),
        olderThanItem: await StatusTestHelper.createTestStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: StatusRepositoryOrderingTermData.remoteIdAsc,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );

    expect((await query.get()).length, 0);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed5",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed6",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: StatusRepositoryOrderingTermData(
        orderByType: StatusRepositoryOrderType.remoteId,
        orderingMode: OrderingMode.asc,
      ),
    );

    var status2 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var status1 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var status3 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get());
    expect(actualList.length, 3);

    expect(
      actualList[0].toDbStatus(),
      status1,
    );
    expect(
      actualList[1].toDbStatus(),
      status2,
    );
    expect(
      actualList[2].toDbStatus(),
      status3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: StatusRepositoryOrderingTermData(
        orderByType: StatusRepositoryOrderType.remoteId,
        orderingMode: OrderingMode.desc,
      ),
    );

    var status2 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    var status1 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    var status3 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get());
    expect(actualList.length, 3);

    expect(
      actualList[0].toDbStatus(),
      status3,
    );
    expect(
      actualList[1].toDbStatus(),
      status2,
    );
    expect(
      actualList[2].toDbStatus(),
      status1,
    );
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = statusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination<IStatus>(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: StatusRepositoryOrderingTermData(
        orderByType: StatusRepositoryOrderType.remoteId,
        orderingMode: OrderingMode.desc,
      ),
    );

    var status2 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId2"),
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId1"),
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = (await query.get());
    expect(actualList.length, 1);

    expect(
      actualList[0].toDbStatus(),
      status2,
    );
  });

  test('createQuery onlyNoNsfwSensitive', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyNoNsfwSensitive: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(sensitive: false),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(sensitive: true),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyNoReplies', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyNoReplies: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(inReplyToRemoteId: "inReplyToRemoteId"),
    );

    expect((await query.get()).length, 0);

    var status2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ));

    // because copyWith is not possible to use with null
    var status2Json = status2.toJson();
    status2Json["inReplyToRemoteId"] = null;
    status2 = DbStatus.fromJson(status2Json);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      status2,
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyFromAccountsFollowingByAccount', () async {
    var accountRemoteId = "accountRemoteId";
    var accountInvalidRemoteId = "accountInvalidRemoteId";
    var followingAccountRemoteId = "followingAccountRemoteId";

    await accountRepository.addAccountFollowings(
      accountRemoteId: accountRemoteId,
      followings: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: (await AccountDatabaseTestHelper.createTestDbAccount(
                    seed: followingAccountRemoteId))
                .copyWith(
              remoteId: followingAccountRemoteId,
            ),
          ),
        ).toPleromaApiAccount(),
      ],
      batchTransaction: null,
    );

    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyFromAccountsFollowingByAccount: DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: await AccountDatabaseTestHelper.createTestDbAccount(
              seed: followingAccountRemoteId,
              // ignore: no-equal-arguments
              remoteId: followingAccountRemoteId,
            ),
          ),
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount.copyWith(remoteId: accountInvalidRemoteId),
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount.copyWith(remoteId: accountRemoteId),
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 0);
  });

  test('createQuery withHashtag', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyWithHashtag: "#cats",
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: null);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus1.remoteId,
      tags: dbStatus1.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus1);

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: []);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus2.remoteId,
      tags: dbStatus2.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus2,
    );

    expect((await query.get()).length, 0);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: [
      PleromaApiTagTestHelper.createTestPleromaApiTag(name: "#dogs")
    ]);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus3.remoteId,
      tags: dbStatus3.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus3,
    );

    expect((await query.get()).length, 0);

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: [
      PleromaApiTagTestHelper.createTestPleromaApiTag(name: "#cats"),
    ]);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus4.remoteId,
      tags: dbStatus4.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus4,
    );

    expect((await query.get()).length, 1);

    var dbStatus5 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: [
      PleromaApiTagTestHelper.createTestPleromaApiTag(name: "#dogs"),
      PleromaApiTagTestHelper.createTestPleromaApiTag(name: "#cats"),
    ]);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus5.remoteId,
      tags: dbStatus5.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus5,
    );

    expect((await query.get()).length, 2);

    var dbStatus6 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed6",
      dbAccount: dbAccount,
    ))
        .copyWith(tags: [
      PleromaApiTagTestHelper.createTestPleromaApiTag(name: "#ca"),
    ]);
    await statusRepository.updateStatusTags(
      statusRemoteId: dbStatus6.remoteId,
      tags: dbStatus6.tags,
      batchTransaction: null,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus6,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInListWithRemoteId', () async {
    var listWithRemoteId = "listRemoteId";
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyInListWithRemoteId: listWithRemoteId,
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus2);
    await statusRepository.addStatusesToList(
      statusRemoteIds: [dbStatus2.remoteId],
      listRemoteId: "invalidStatusRemoteId",
      batchTransaction: null,
    );

    expect((await query.get()).length, 0);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus3,
    );
    await statusRepository.addStatusesToList(
      statusRemoteIds: [dbStatus3.remoteId],
      listRemoteId: listWithRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    // duplicate adding. Should be skipped
    await statusRepository.addStatusesToList(
      statusRemoteIds: [dbStatus3.remoteId],
      listRemoteId: listWithRemoteId,
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus4,
    );
    await statusRepository.addStatusesToList(
      statusRemoteIds: [dbStatus4.remoteId],
      listRemoteId: listWithRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyInConversation', () async {
    var conversationRemoteId = "conversationRemoteId";
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyInConversation: DbConversationChatPopulatedWrapper(
          dbConversationPopulated: DbConversationPopulated(
            dbConversation: DbConversation(
              remoteId: conversationRemoteId,
              unread: false,
              id: null,
            ),
          ),
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus1);

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus2);
    await statusRepository.addStatusesToConversation(
      statusRemoteIds: [dbStatus2.remoteId],
      conversationRemoteId: "invalidConversationId",
      batchTransaction: null,
    );

    expect((await query.get()).length, 0);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus3);
    await statusRepository.addStatusesToConversation(
      statusRemoteIds: [dbStatus3.remoteId],
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    // duplicate adding. Should be skipped
    await statusRepository.addStatusesToConversation(
      statusRemoteIds: [dbStatus3.remoteId],
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );
    expect((await query.get()).length, 1);

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith();
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus4);
    await statusRepository.addStatusesToConversation(
      statusRemoteIds: [dbStatus4.remoteId],
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyFromAccount', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyFromAccount: DbAccountPopulatedWrapper(
            dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount,
        )),
      ),
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 1);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount.copyWith(remoteId: "newAccountRemoteId"),
      ))
          .copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('getConversationLastStatus', () async {
    var conversationRemoteId = "conversationRemoteId";

    var conversation = await ConversationTestHelper.createTestConversation(
      seed: conversationRemoteId,
      // ignore: no-equal-arguments
      remoteId: conversationRemoteId,
    );

    // 1 is not related to conversation
    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(
        dbStatusPopulated:
            await StatusDatabaseTestHelper.createTestDbStatusPopulated(
          dbStatus.copyWith(remoteId: "status1"),
          accountRepository,
        ),
      ).toPleromaStatus(),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );

    expect(
      await statusRepository.getConversationLastStatus(
        conversation: conversation,
      ),
      null,
    );

    // 2 is related to conversation
    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(
        dbStatusPopulated:
            await StatusDatabaseTestHelper.createTestDbStatusPopulated(
          dbStatus.copyWith(
            remoteId: "status2",
            createdAt: DateTime(2002),
          ),
          accountRepository,
        ),
      ).toPleromaStatus(),
      listRemoteId: null,
      conversationRemoteId: conversationRemoteId,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );

    expect(
      (await statusRepository.getConversationLastStatus(
        conversation: conversation,
      ))!
          .remoteId,
      "status2",
    );

    // 4 is newer than 2
    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(
        dbStatusPopulated:
            await StatusDatabaseTestHelper.createTestDbStatusPopulated(
          dbStatus.copyWith(
            remoteId: "status4",
            createdAt: DateTime(2004),
          ),
          accountRepository,
        ),
      ).toPleromaStatus(),
      listRemoteId: null,
      conversationRemoteId: conversationRemoteId,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );
    expect(
      (await statusRepository.getConversationLastStatus(
        conversation: conversation,
      ))!
          .remoteId,
      "status4",
    );

    // remain 4
    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(
        dbStatusPopulated:
            await StatusDatabaseTestHelper.createTestDbStatusPopulated(
          dbStatus.copyWith(
            remoteId: "status3",
            createdAt: DateTime(2003),
          ),
          accountRepository,
        ),
      ).toPleromaStatus(),
      listRemoteId: null,
      conversationRemoteId: conversationRemoteId,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    expect(
      (await statusRepository.getConversationLastStatus(
        conversation: conversation,
      ))!
          .remoteId,
      "status4",
    );
  });

  test('addStatusesToConversation', () async {
    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      0,
    );

    await statusRepository.addStatusesToConversation(
      statusRemoteIds: ["statusRemoteId1"],
      conversationRemoteId: "conversationRemoteId1",
      batchTransaction: null,
    );

    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      1,
    );

    await statusRepository.addStatusesToConversation(
      statusRemoteIds: ["statusRemoteId1"],
      conversationRemoteId: "conversationRemoteId1",
      batchTransaction: null,
    );

    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      1,
    );
  });

  test('upsertRemoteStatus duplicated parallel upsert', () async {
    expect(await statusRepository.countAll(), 0);

    var conversationRemoteId = "conversationRemoteId";

    await statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );

    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      1,
    );
    await statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      1,
    );

    var future1 = statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
          .toPleromaStatus(),
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );
    var future2 = statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
          .toPleromaStatus(),
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );

    var future3 = statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      isFromHomeTimeline: null,
      batchTransaction: null,
    );
    var future4 = statusRepository.upsertRemoteStatusesWithAllArguments(
      [
        DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
            .toPleromaStatus(),
      ],
      conversationRemoteId: conversationRemoteId,
      listRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    await future1;
    await future2;
    await future3;
    await future4;

    expect(await statusRepository.countAll(), 1);
    expect(await accountRepository.countAll(), 1);
    expect(
      (await statusRepository.conversationStatusesDao.getAll()).length,
      1,
    );
    expect(
      (await statusRepository.findAllInAppType(
        filters: StatusRepositoryFilters(
          onlyInConversation:
              await ConversationTestHelper.createTestConversation(
            seed: "seed5",
            remoteId: conversationRemoteId,
          ),
        ),
        pagination: null,
        orderingTerms: null,
      ))
          .length,
      1,
    );
    StatusDatabaseTestHelper.expectDbStatus(
      await statusRepository.findByRemoteIdInAppType(dbStatus.remoteId),
      dbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
      await accountRepository.findByRemoteIdInAppType(dbAccount.remoteId),
      dbAccount,
    );
  });

  test('watch new by listRemoteId', () async {
    var listRemoteId = "listRemoteId";

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "1");

    var status1Populated =
        await StatusDatabaseTestHelper.createTestDbStatusPopulated(
      dbStatus1,
      accountRepository,
    );

    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(
        dbStatusPopulated: status1Populated,
      ).toPleromaStatus(),
      listRemoteId: listRemoteId,
      conversationRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    late List<IStatus> watchedStatuses;
    var subscription = statusRepository.watchFindAllInAppType(
      filters: StatusRepositoryFilters(
        onlyInListWithRemoteId: listRemoteId,
      ),
      pagination: RepositoryPagination<IStatus>(
        newerThanItem:
            await statusRepository.findByRemoteIdInAppType(dbStatus1.remoteId),
      ),
      orderingTerms: [
        StatusRepositoryOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusRepositoryOrderType.remoteId,
        ),
      ],
    ).listen((statuses) {
      watchedStatuses = statuses;
    });

    await Future.delayed(Duration(milliseconds: 100));

    expect(watchedStatuses.length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "2");

    var status2Populated =
        await StatusDatabaseTestHelper.createTestDbStatusPopulated(
      dbStatus2,
      accountRepository,
    );

    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: status2Populated)
          .toPleromaStatus(),
      listRemoteId: listRemoteId,
      conversationRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    await Future.delayed(Duration(milliseconds: 100));

    expect(watchedStatuses.length, 1);

    var dbStatus0 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed0",
      dbAccount: dbAccount,
    ))
        .copyWith(remoteId: "0");

    var status0Populated =
        await StatusDatabaseTestHelper.createTestDbStatusPopulated(
      dbStatus0,
      accountRepository,
    );

    await statusRepository.upsertRemoteStatusWithAllArguments(
      DbStatusPopulatedWrapper(dbStatusPopulated: status0Populated)
          .toPleromaStatus(),
      listRemoteId: listRemoteId,
      conversationRemoteId: null,
      batchTransaction: null,
      isFromHomeTimeline: null,
    );

    await Future.delayed(Duration(milliseconds: 100));

    expect(watchedStatuses.length, 1);

    await subscription.cancel();
  });

  test('createQuery excludeTextConditions wholeWord = false', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        excludeTextConditions: [
          StatusTextCondition(phrase: "test", wholeWord: false),
        ],
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "test",
      content: "",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "test",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus2,
    );

    expect((await query.get()).length, 0);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "testing",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus3,
    );

    expect((await query.get()).length, 0);

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "aaaa",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus4);

    expect((await query.get()).length, 1);
  });

  test('createQuery excludeTextConditions wholeWord = true', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        excludeTextConditions: [
          StatusTextCondition(phrase: "test", wholeWord: true),
        ],
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "test",
      content: "",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "test",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus2,
    );

    expect((await query.get()).length, 0);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "testing",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
        statusRepository, dbStatus3);

    expect((await query.get()).length, 1);

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "aaaa",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus4,
    );

    expect((await query.get()).length, 2);

    var dbStatus5 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed5",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "",
      content: "one test one",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus5,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery excludeTextConditions reblog', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        excludeTextConditions: [
          StatusTextCondition(phrase: "test", wholeWord: false),
        ],
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "test",
      content: "",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 0);

    var dbStatus2 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed2",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "aaa",
      content: "bbb",
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus2,
    );

    expect((await query.get()).length, 1);

    var dbStatus3 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed3",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "aaa",
      content: "bbb",
    );

    dbStatus3 = await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus3,
    );

    var dbStatus4 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed4",
      dbAccount: dbAccount,
    ))
        .copyWith(
      spoilerText: "aaa",
      content: "bbb",
      reblogStatusRemoteId: dbStatus3.remoteId,
    );
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus4,
    );

    expect((await query.get()).length, 3);

    dbStatus3 = dbStatus3.copyWith(
      spoilerText: "test",
      content: "",
    );

    await statusRepository.updateByDbIdInDbType(
      dbId: dbStatus3.id!,
      dbItem: dbStatus3,
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);
  });

  test('createQuery isFromHomeTimeline', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        isFromHomeTimeline: true,
        // isFromHomeTimeline: null,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await statusRepository.upsertRemoteStatusWithAllArguments(
      (await StatusDatabaseTestHelper.createTestRemoteStatus(
        seed: "seed1",
        dbAccount: dbAccount,
        accountRepository: accountRepository,
      )),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: false,
      batchTransaction: null,
    );

    expect((await query.get()).length, 0);

    await statusRepository.upsertRemoteStatusWithAllArguments(
      (await StatusDatabaseTestHelper.createTestRemoteStatus(
        seed: "seed2",
        dbAccount: dbAccount,
        accountRepository: accountRepository,
      )),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: true,
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);

    await statusRepository.upsertRemoteStatusWithAllArguments(
      (await StatusDatabaseTestHelper.createTestRemoteStatus(
        seed: "seed3",
        dbAccount: dbAccount,
        accountRepository: accountRepository,
      )),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: true,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);

    await statusRepository.upsertRemoteStatusWithAllArguments(
      (await StatusDatabaseTestHelper.createTestRemoteStatus(
        seed: "seed3",
        dbAccount: dbAccount,
        accountRepository: accountRepository,
      )),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: true,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);

    await statusRepository.upsertRemoteStatusWithAllArguments(
      (await StatusDatabaseTestHelper.createTestRemoteStatus(
        seed: "seed2",
        dbAccount: dbAccount,
        accountRepository: accountRepository,
      )),
      listRemoteId: null,
      conversationRemoteId: null,
      isFromHomeTimeline: true,
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery onlyRemoteCondition', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyRemoteCondition: StatusOnlyRemoteCondition("pleroma.com"),
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://pleroma.com/one",
      ),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://google.com/one",
      ),
    );

    expect((await query.get()).length, 1);

    // check several with seed
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://pleroma.com/two",
      ),
    );

    // check local flag
    expect((await query.get()).length, 1);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: true,
        url: "https://google.com/one",
      ),
    );

    expect((await query.get()).length, 1);
  });

  test('createQuery onlyRemoteCondition', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyRemoteCondition: StatusOnlyRemoteCondition("pleroma.com"),
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://pleroma.com/one",
      ),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://google.com/one",
      ),
    );

    expect((await query.get()).length, 1);

    // check several with seed
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: false,
        url: "https://pleroma.com/two",
      ),
    );

    // check local flag
    expect((await query.get()).length, 1);
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
      ))
          .copyWith(
        pleromaLocal: true,
        url: "https://google.com/one",
      ),
    );

    expect((await query.get()).length, 1);
  });

  test('createQuery onlyRemoteCondition + onlyLocalCondition error', () async {
    expect(
      () {
        statusRepository.createQuery(
          filters: StatusRepositoryFilters(
            onlyRemoteCondition: StatusOnlyRemoteCondition("pleroma.com"),
            onlyLocalCondition: StatusOnlyLocalCondition("pleroma.com"),
          ),
          pagination: null,
          orderingTermData: null,
        );
      },
      throwsA(isA<AssertionError>()),
    );
  });

  test('createQuery onlyFromInstance + no onlyRemoteCondition error', () async {
    expect(
      () {
        statusRepository.createQuery(
          filters: StatusRepositoryFilters(
            onlyFromInstance: "pleroma.com",
          ),
          pagination: null,
          orderingTermData: null,
        );
      },
      throwsA(isA<AssertionError>()),
    );
  });

  test('createQuery onlyFromInstance', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyRemoteCondition: StatusOnlyRemoteCondition("pleroma.com"),
        onlyFromInstance: "google.com",
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(url: "https://pleroma.com/"),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(url: "https://google.com/"),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyFavourited', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyFavourited: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(favourited: false),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(favourited: true),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyBookmarked', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyBookmarked: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(bookmarked: false),
    );

    expect((await query.get()).length, 0);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(bookmarked: true),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery replyVisibilityFilterCondition self', () async {
    var myDbAccount =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "myAccount");
    var dbAccount3 =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed3");

    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        replyVisibilityFilterCondition: PleromaReplyVisibilityFilterCondition(
          replyVisibilityFilter: PleromaApiReplyVisibilityFilter.self,
          myAccountRemoteId: myDbAccount.remoteId,
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
      inReplyToAccountRemoteId: null,
    ));
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: myDbAccount.remoteId,
      )),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: dbAccount3.remoteId,
      )),
    );

    expect((await query.get()).length, 2);

    await accountRepository.addAccountFollowings(
      accountRemoteId: myDbAccount.remoteId,
      followings: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount,
          ),
        ).toPleromaApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: dbAccount3.remoteId,
      )),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery replyVisibilityFilterCondition following', () async {
    var myDbAccount =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "myAccount");
    var dbAccount3 =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed3");
    var dbAccount4 =
        await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed4");

    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        replyVisibilityFilterCondition: PleromaReplyVisibilityFilterCondition(
          replyVisibilityFilter: PleromaApiReplyVisibilityFilter.following,
          myAccountRemoteId: myDbAccount.remoteId,
        ),
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
      inReplyToAccountRemoteId: null,
    ));
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: myDbAccount.remoteId,
      )),
    );

    expect((await query.get()).length, 2);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed3",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: dbAccount3.remoteId,
      )),
    );

    expect((await query.get()).length, 2);

    await accountRepository.addAccountFollowings(
      accountRemoteId: myDbAccount.remoteId,
      followings: [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbAccount3,
          ),
        ).toPleromaApiAccount(),
      ],
      batchTransaction: null,
    );

    expect((await query.get()).length, 3);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed4",
        dbAccount: dbAccount,
        inReplyToAccountRemoteId: dbAccount4.remoteId,
      )),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery onlyNotDeleted', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        onlyNotDeleted: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1",
        dbAccount: dbAccount,
      ))
          .copyWith(deleted: false),
    );

    expect((await query.get()).length, 1);

    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      (await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed2",
        dbAccount: dbAccount,
      ))
          .copyWith(deleted: true),
    );
    expect((await query.get()).length, 1);
  });

  test('createQuery mustBeConversationItem', () async {
    var query = statusRepository.createQuery(
      filters: StatusRepositoryFilters(
        mustBeConversationItem: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    var dbStatus1 = (await StatusDatabaseTestHelper.createTestDbStatus(
      seed: "seed1",
      dbAccount: dbAccount,
    ));
    await StatusRepositoryTestHelper.insertDbStatus(
      statusRepository,
      dbStatus1,
    );

    expect((await query.get()).length, 0);

    await statusRepository.addStatusesToConversation(
      statusRemoteIds: [dbStatus1.remoteId],
      conversationRemoteId: "conversationRemoteId1",
      batchTransaction: null,
    );

    expect((await query.get()).length, 1);
  });

  test('insertInDbTypeBatch duplicated', () async {
    expect(await statusRepository.countAll(), 0);

    var dbItem1 = await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1", dbAccount: dbAccount.copyWith());
    var dbItem1copy = await StatusDatabaseTestHelper.createTestDbStatus(
        seed: "seed1", dbAccount: dbAccount.copyWith());

    await statusRepository.batch((batch) {
      statusRepository.insertInDbTypeBatch(
        dbItem1,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
      statusRepository.insertInDbTypeBatch(
        dbItem1copy,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
    });

    expect(await statusRepository.countAll(), 1);
  });

  test('insertInRemoteTypeBatch duplicated', () async {
    expect(await statusRepository.countAll(), 0);

    var status1 = await StatusTestHelper.createTestStatus(seed: "seed1");
    var status1Copy = await StatusTestHelper.createTestStatus(seed: "seed1");

    var remoteStatus1 = status1.toPleromaStatus();
    var remoteStatus1Copy = status1Copy.toPleromaStatus();

    await statusRepository.batch((batch) {
      statusRepository.insertInRemoteTypeBatch(
        remoteStatus1,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
      statusRepository.insertInRemoteTypeBatch(
        remoteStatus1Copy,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batch,
      );
    });

    expect(await statusRepository.countAll(), 1);
  });
  test('insertInRemoteTypeBatch duplicated', () async {
    expect(await statusRepository.countAll(), 0);

    var status1 = await StatusTestHelper.createTestStatus(seed: "seed1");
    var status1Copy = await StatusTestHelper.createTestStatus(seed: "seed1");

    var remoteStatus1 = status1.toPleromaStatus();
    var remoteStatus1Copy = status1Copy.toPleromaStatus();

    await statusRepository.insertAllInRemoteType(
      [remoteStatus1, remoteStatus1Copy],
      mode: InsertMode.insertOrReplace,
      batchTransaction: null,
    );

    expect(await statusRepository.countAll(), 1);
  });
}
