import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';

class ScheduledStatusRepositoryMockHelper {
  static Future<DbScheduledStatus> insertDbScheduledStatus(
    ScheduledStatusRepository scheduledStatusRepository,
    DbScheduledStatus scheduledStatusData, {
    Batch? batchTransaction,
  }) async {
    var id = await scheduledStatusRepository.insertInDbType(
      scheduledStatusData,
      mode: null,
    );
    assert(id > 0, true);
    var dbScheduledStatus = scheduledStatusData.copyWith(id: id);

    return dbScheduledStatus;
  }
}
