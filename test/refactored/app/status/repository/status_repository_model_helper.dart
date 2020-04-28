import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbStatus> insertDbStatus(
  StatusRepository statusRepository,
  DbStatus statusData,
) async {
  var id = await statusRepository.insert(statusData);
  assert(id != null, true);
  var dbStatus = statusData.copyWith(id: id);
  return dbStatus;
}
