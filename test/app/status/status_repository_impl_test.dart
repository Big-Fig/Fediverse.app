import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../account/account_repository_model_helper.dart';
import 'status_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

void main() {
  AppDatabase database;
  AccountRepository accountRepository;
  StatusRepository statusRepository;

  DbStatusPopulated dbStatusPopulated;
  DbStatus dbStatus;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(
        appDatabase:  database);
    statusRepository = StatusRepository(
        appDatabase: database,
        accountRepository: accountRepository);

    dbAccount = createTestAccount("seed1");

    var accountId = await accountRepository.insert(dbAccount);
    dbAccount = dbAccount.copyWith(id: accountId);

    dbStatus = await createTestStatus("seed3", dbAccount);

    dbStatusPopulated =
        await createTestStatusPopulated(dbStatus, accountRepository);
  });

  tearDown(() async {
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await statusRepository.insert(dbStatus);
    assert(id != null, true);
    expectDbStatusPopulated(
        await statusRepository.findById(id), dbStatusPopulated);
  });

  test('upsertAll', () async {
    var dbStatus1 = (await createTestStatus("seed5", dbAccount))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbStatus2 = (await createTestStatus("seed6", dbAccount))
        .copyWith(remoteId: "remoteId1");

    await statusRepository.upsertAll([dbStatus1]);

    expect((await statusRepository.getAll()).length, 1);

    await statusRepository.upsertAll([dbStatus2]);
    expect((await statusRepository.getAll()).length, 1);

    expectDbStatusPopulated((await statusRepository.getAll()).first,
        await createTestStatusPopulated(dbStatus2, accountRepository));
  });

  test('updateById', () async {
    var id = await statusRepository.insert(dbStatus);
    assert(id != null, true);

    await statusRepository.updateById(
        id, dbStatus.copyWith(remoteId: "newRemoteId"));

    expect((await statusRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('findByRemoteId', () async {
    await statusRepository.insert(dbStatus);
    expectDbStatusPopulated(
        await statusRepository.findByRemoteId(dbStatus.remoteId),
        dbStatusPopulated);
  });

  test('createQuery empty', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(statusRepository,
        (await createTestStatus("seed1", dbAccount)).copyWith());

    expect((await query.get()).length, 1);

    await insertDbStatus(statusRepository,
        (await createTestStatus("seed2", dbAccount)).copyWith());
    expect((await query.get()).length, 2);
  });

  test('createQuery containsBaseUrlOrIsPleromaLocal', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: true,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: "pleroma.com",
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://pleroma.com/one"));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://google.com/one"));

    expect((await query.get()).length, 1);

    // check several with seed
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(pleromaLocal: false, url: "https://pleroma.com/two"));

    // check local flag
    expect((await query.get()).length, 2);
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(pleromaLocal: true, url: "https://google.com/one"));

    expect((await query.get()).length, 3);
  });

  test('createQuery onlyMedia', () async {
    var query = statusRepository.createQuery(
        onlyMedia: true,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(mediaAttachments: null));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(mediaAttachments: []));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(mediaAttachments: [PleromaMediaAttachment()]));

    expect((await query.get()).length, 1);
  });

  test('createQuery notMuted', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: true,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: null));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: false));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: true));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(muted: true, pleromaThreadMuted: true));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed5", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: false));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed6", dbAccount))
            .copyWith(muted: false, pleromaThreadMuted: null));

    expect((await query.get()).length, 2);
  });

  test('createQuery excludeVisibilities', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
          PleromaVisibility.UNLISTED
        ],
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(visibility: PleromaVisibility.DIRECT));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(visibility: PleromaVisibility.UNLISTED));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(visibility: PleromaVisibility.PUBLIC));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(visibility: PleromaVisibility.LIST));

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanStatusRemoteId', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: "remoteId5",
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanStatusRemoteId', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: "remoteId5",
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanStatusRemoteId & newerThanStatusRemoteId',
      () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: "remoteId2",
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: "remoteId5",
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed4", dbAccount))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed5", dbAccount))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed6", dbAccount))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    var status2 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var status1 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var status3 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectActualStatus(actualList[0], status1, dbAccount);
    expectActualStatus(actualList[1], status2, dbAccount);
    expectActualStatus(actualList[2], status3, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    var status2 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    var status1 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    var status3 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectActualStatus(actualList[0], status3, dbAccount);
    expectActualStatus(actualList[1], status2, dbAccount);
    expectActualStatus(actualList[2], status1, dbAccount);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: 1,
        offset: 1,
        orderingTermData: StatusOrderingTermData(
            orderByType: StatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    var status2 = await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed2", dbAccount))
            .copyWith(remoteId: "remoteId2"));
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(remoteId: "remoteId1"));
    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed3", dbAccount))
            .copyWith(remoteId: "remoteId3"));

    List<DbStatusPopulated> actualList =
        (await query.map(statusRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 1);

    expectActualStatus(actualList[0], status2, dbAccount);
  });

  test('createQuery noNsfwSensitive', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: true,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(sensitive: false));

    expect((await query.get()).length, 1);

    await insertDbStatus(statusRepository,
        (await createTestStatus("seed2", dbAccount)).copyWith(sensitive: true));
    expect((await query.get()).length, 1);
  });

  test('createQuery noReplies', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: true,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus("seed1", dbAccount))
            .copyWith(inReplyToRemoteId: "inReplyToRemoteId"));

    expect((await query.get()).length, 0);

    var status2 = (await createTestStatus("seed2", dbAccount));

    // because copyWith is not possible to use with null
    var status2Json = status2.toJson();
    status2Json["inReplyToRemoteId"] = null;
    status2 = DbStatus.fromJson(status2Json);

    await insertDbStatus(statusRepository, status2);
    expect((await query.get()).length, 1);
  });

  test('createQuery onlyFollowingByAccount', () async {
    var accountRemoteId = "accountRemoteId";
    var accountInvalidRemoteId = "accountInvalidRemoteId";
    var followingAccountRemoteId = "followingAccountRemoteId";

    await accountRepository.updateAccountFollowings(
        accountRemoteId, [PleromaAccount(id: "followingAccountRemoteId")]);

    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: DbAccountWrapper(DbAccount(
            id: null,
            remoteId: followingAccountRemoteId,
            username: null,
            url: null,
            note: null,
            locked: null,
            headerStatic: null,
            header: null,
            followingCount: null,
            followersCount: null,
            statusesCount: null,
            displayName: null,
            createdAt: null,
            avatarStatic: null,
            avatar: null,
            acct: null,
            lastStatusAt: null)),
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus(
                "seed1", dbAccount.copyWith(remoteId: accountInvalidRemoteId)))
            .copyWith());

    expect((await query.get()).length, 0);

    await insertDbStatus(
        statusRepository,
        (await createTestStatus(
                "seed2", dbAccount.copyWith(remoteId: accountRemoteId)))
            .copyWith());

    expect((await query.get()).length, 0);
  });

  test('createQuery withHashtag', () async {
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: "#cats",
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: null);

    var dbStatus1 = (await createTestStatus("seed1", dbAccount)).copyWith(tags: null);
    await statusRepository.updateStatusTags(dbStatus1.remoteId, dbStatus1.tags);
    await insertDbStatus(statusRepository,
        dbStatus1);

    expect((await query.get()).length, 0);

    var dbStatus2 = (await createTestStatus("seed2", dbAccount)).copyWith(tags: []);
    await statusRepository.updateStatusTags(dbStatus2.remoteId, dbStatus2.tags);
    await insertDbStatus(statusRepository,
        dbStatus2);

    expect((await query.get()).length, 0);
    
    var dbStatus3 = (await createTestStatus("seed3", dbAccount))
            .copyWith(tags: [PleromaTag(name: "#dogs")]);
    await statusRepository.updateStatusTags(dbStatus3.remoteId, dbStatus3.tags);
    await insertDbStatus(
        statusRepository,
        dbStatus3);

    expect((await query.get()).length, 0);
    
    var dbStatus4 = (await createTestStatus("seed4", dbAccount)).copyWith(tags: [
          PleromaTag(name: "#cats"),
        ]);
    await statusRepository.updateStatusTags(dbStatus4.remoteId, dbStatus4.tags);
    await insertDbStatus(
        statusRepository,
        dbStatus4);

    expect((await query.get()).length, 1);

    var dbStatus5 = (await createTestStatus("seed5", dbAccount)).copyWith(tags: [
          PleromaTag(name: "#dogs"),
          PleromaTag(name: "#cats"),
        ]);
    await statusRepository.updateStatusTags(dbStatus5.remoteId, dbStatus5.tags);
    await insertDbStatus(
        statusRepository,
        dbStatus5);

    expect((await query.get()).length, 2);

    var dbStatus6 = (await createTestStatus("seed6", dbAccount)).copyWith(tags: [
          PleromaTag(name: "#ca"),
        ]);
    await statusRepository.updateStatusTags(dbStatus6.remoteId, dbStatus6.tags);
    await insertDbStatus(
        statusRepository,
        dbStatus6);

    expect((await query.get()).length, 2);
  });


  test('createQuery inListWithRemoteId', () async {
    var listWithRemoteId = "listRemoteId";
    var query = statusRepository.createQuery(
        onlyMedia: null,
        notMuted: null,
        excludeVisibilities: null,
        newerThanStatusRemoteId: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        noNsfwSensitive: null,
        onlyLocal: null,
        noReplies: null,
        withHashtag: null,
        onlyFollowingByAccount: null,
        localUrlHost: null,
        olderThanStatusRemoteId: null,
        inListWithRemoteId: listWithRemoteId);

    var dbStatus1 = (await createTestStatus("seed1", dbAccount)).copyWith();
    await insertDbStatus(statusRepository,
        dbStatus1);
    statusRepository.addStatusesToList([dbStatus1.remoteId], null);

    expect((await query.get()).length, 0);
    
    var dbStatus2 = (await createTestStatus("seed2", dbAccount)).copyWith();
    await insertDbStatus(statusRepository,
        dbStatus2);
    statusRepository.addStatusesToList([dbStatus2.remoteId], "");

    expect((await query.get()).length, 0);
    
    var dbStatus3 = (await createTestStatus("seed3", dbAccount)).copyWith();
    await insertDbStatus(statusRepository,
        dbStatus3);
    statusRepository.addStatusesToList([dbStatus2.remoteId], listWithRemoteId);

    expect((await query.get()).length, 1);    
    
    var dbStatus4 = (await createTestStatus("seed4", dbAccount)).copyWith();
    await insertDbStatus(statusRepository,
        dbStatus4);
    statusRepository.addStatusesToList([dbStatus2.remoteId], listWithRemoteId);

    expect((await query.get()).length, 2);

  });
}

Future<DbStatusPopulated> createTestStatusPopulated(
    DbStatus dbStatus, AccountRepository accountRepository) async {
  DbStatusPopulated dbStatusPopulated = DbStatusPopulated(
    status: dbStatus,
    account: (await accountRepository.findByRemoteId(dbStatus.accountRemoteId))
        .dbAccount,
  );
  return dbStatusPopulated;
}

void expectActualStatus(DbStatusPopulated actualStatusPopulated,
    DbStatus dbStatus, DbAccount dbAccount) {
  var actualStatus = actualStatusPopulated.status;
  expect(actualStatus, dbStatus);
  expect(actualStatusPopulated.account, dbAccount);
}

Future<DbStatus> insertDbStatus(
  StatusRepository statusRepository,
  DbStatus statusData,
) async {

  var id = await statusRepository.insert(statusData);
  assert(id != null, true);
  var dbStatus = statusData.copyWith(id: id);
  return dbStatus;
}
