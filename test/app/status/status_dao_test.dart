import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_database_dao.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../account/account_repository_model_helper.dart';
import 'status_repository_model_helper.dart';

void main() {
  AppDatabase database;
  AccountDao accountDao;
  StatusDao statusDao;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
    accountDao = database.accountDao;
    statusDao = database.statusDao;
    dbAccount = createTestAccount("seed1");

    var accountId = await accountDao.insert(dbAccount);
    dbAccount = dbAccount.copyWith(id: accountId);
  });

  tearDown(() async {
    await database.close();
  });

  test('insert & find by id', () async {
    DbStatus dbStatus = await insertDbStatus(
        statusDao, await createTestStatus("seed1", dbAccount));

    var actualStatusPopulated = await statusDao.findById(dbStatus.id);
    expectActualStatus(actualStatusPopulated, dbStatus, dbAccount);
  });

  test('createQuery empty', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao, (await createTestStatus("seed1", dbAccount)).copyWith());

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusDao, (await createTestStatus("seed2", dbAccount)).copyWith());
  });

  test('createQuery containsBaseUrlOrIsPleromaLocal', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: "pleroma.com",
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://pleroma.com/one"));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://google.com/one"));

    expect((await query.get()).length, 1);

    // check several with seed
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://pleroma.com/two"));

    // check local flag
    expect((await query.get()).length, 2);
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(pleromaLocal: true, url: "https://google.com/one"));

    expect((await query.get()).length, 3);
  });

  test('createQuery onlyMedia', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: true,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(mediaAttachments: null));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(mediaAttachments: []));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(mediaAttachments: [PleromaMediaAttachment()]));

    expect((await query.get()).length, 1);
  });

  test('createQuery notMuted', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: true,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: null));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: false));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: true));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: true));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed5", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: false));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed6", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: null));

    expect((await query.get()).length, 2);
  });

  test('createQuery excludeVisibilities', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
          PleromaVisibility.UNLISTED
        ],
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(visibility: PleromaVisibility.DIRECT));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(visibility: PleromaVisibility.UNLISTED));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(visibility: PleromaVisibility.PUBLIC));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(visibility: PleromaVisibility.LIST));

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanStatusRemoteId', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: "remoteId5",
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanStatusRemoteId', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: "remoteId5",
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanStatusRemoteId & newerThanStatusRemoteId',
      () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: "remoteId2",
        notNewerThanStatusRemoteId: "remoteId5",
        limit: null,
        offset: null,
        orderingTermData: null);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed5", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed6", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.asc));

    var status2 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var status1 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var status3 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusDao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectActualStatus(actualList[0], status1, dbAccount);
    expectActualStatus(actualList[1], status2, dbAccount);
    expectActualStatus(actualList[2], status3, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    var status2 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var status1 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var status3 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusDao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectActualStatus(actualList[0], status3, dbAccount);
    expectActualStatus(actualList[1], status2, dbAccount);
    expectActualStatus(actualList[2], status1, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = statusDao.createQuery(
        containsBaseUrlOrIsPleromaLocal: null,
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        notNewerThanStatusRemoteId: null,
        newerThanStatusRemoteId: null,
        limit: 1,
        offset: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc));

    var status2 = await insertDbStatus(
        statusDao,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    await insertDbStatus(
        statusDao,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusDao.typedResultToPopulated).get());
    expect(actualList.length, 1);

    expectActualStatus(actualList[0], status2, dbAccount);
  });
}

void expectActualStatus(DbStatusPopulated actualStatusPopulated,
    DbStatus dbStatus, DbAccount dbAccount) {
  var actualStatus = actualStatusPopulated.status;
  expect(actualStatus, dbStatus);
  expect(actualStatusPopulated.account, dbAccount);
}

Future<DbStatus> insertDbStatus(
  StatusDao statusDao,
  DbStatus statusData,
) async {
  var id = await statusDao.insert(statusData);
  assert(id != null, true);
  var dbStatus = statusData.copyWith(id: id);
  return dbStatus;
}
