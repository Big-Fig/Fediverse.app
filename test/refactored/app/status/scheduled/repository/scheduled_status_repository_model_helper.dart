import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbScheduledStatus> insertDbScheduledStatus(
  ScheduledStatusRepository scheduledStatusRepository,
  DbScheduledStatus scheduledStatusData,
) async {
  var id = await scheduledStatusRepository.insert(scheduledStatusData);
  assert(id != null, true);
  var dbScheduledStatus = scheduledStatusData.copyWith(id: id);
  return dbScheduledStatus;
}
