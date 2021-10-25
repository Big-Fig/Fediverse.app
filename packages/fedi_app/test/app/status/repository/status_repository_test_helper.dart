import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/repository/status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

class StatusRepositoryMockHelper {
  static Future<DbStatus> insertDbStatus(
    StatusRepository statusRepository,
    DbStatus statusData,
  ) async {
    var id = await statusRepository.insertInDbType(
      statusData,
      mode: null,
    );
    assert(id > 0, true);
    var dbStatus = statusData.copyWith(id: id);

    return dbStatus;
  }
}
