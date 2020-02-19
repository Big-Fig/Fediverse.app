import 'package:fedi/Pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/app/account/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/rest/pleroma_rest_service_mock.dart';
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
    accountRepository = AccountRepository(dao: database.accountDao);
    statusRepository = StatusRepository(
        dao: database.statusDao,
        accountRepository: accountRepository,
        pleromaTimelineService: PleromaTimelineService(
            restService: PleromaRestServiceMock(baseUrl: baseUrl)));

    dbAccount = createTestAccount("seed1");

    accountRepository.insert(dbAccount);

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
    expectDbStatusPopulated(await statusRepository.findById(id), dbStatusPopulated);
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
    expectDbStatusPopulated(await statusRepository.findByRemoteId(dbStatus.remoteId),
        dbStatusPopulated);
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
