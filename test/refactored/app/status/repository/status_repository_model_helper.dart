import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../pleroma/application/pleroma_application_model_helper.dart';
import '../../account/database/account_database_model_helper.dart';
import '../../account/repository/account_repository_model_helper.dart';


DbStatusPopulatedWrapper createFakePopulatedStatusWithRemoteId(
    String remoteId, DbAccount account) {
  return DbStatusPopulatedWrapper(DbStatusPopulated(
      dbStatus: DbStatus(
          remoteId: remoteId,
          accountRemoteId: null,
          favourited: null,
          repliesCount: null,
          spoilerText: null,
          reblogged: null,
          bookmarked: null,
          id: null,
          muted: null,
          reblogsCount: null,
          favouritesCount: null,
          sensitive: null,
          application: null,
          createdAt: null,
          uri: null),
      dbAccount: account,
      reblogDbStatusAccount: null,
      reblogDbStatus: null));
}

Future<DbStatusPopulated> createTestStatusPopulated(
    DbStatus dbStatus, AccountRepository accountRepository) async {
  DbStatusPopulated dbStatusPopulated = DbStatusPopulated(
    dbStatus: dbStatus,
    dbAccount: (await accountRepository.findByRemoteId(dbStatus.accountRemoteId))
        .dbAccount,
    reblogDbStatus: null,
    reblogDbStatusAccount: null,
  );
  return dbStatusPopulated;
}

void expectActualStatus(DbStatusPopulated actualStatusPopulated,
    DbStatus dbStatus, DbAccount dbAccount) {
  var actualStatus = actualStatusPopulated.dbStatus;
  expect(actualStatus, dbStatus);
  expect(actualStatusPopulated.dbAccount, dbAccount);
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
