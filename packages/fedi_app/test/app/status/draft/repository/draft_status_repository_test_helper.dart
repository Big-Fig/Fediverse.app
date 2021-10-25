import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/draft/repository/draft_status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';

class DraftStatusRepositoryMockHelper {
  static Future<DbDraftStatus> insertDbDraftStatus(
    DraftStatusRepository draftStatusRepository,
    DbDraftStatus draftStatusData, {
    Batch? batchTransaction,
  }) async {
    var id = await draftStatusRepository.insertInDbType(
      draftStatusData,
      mode: null,
    );
    assert(id > 0, true);
    var dbDraftStatus = draftStatusData.copyWith(id: id);

    return dbDraftStatus;
  }
}
