import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/draft_status_database_test_helper.dart';

class DraftStatusMockHelper {
  static Future<DbDraftStatusPopulatedWrapper> createTestDraftStatus({
    required String seed,
    DateTime? updatedAt,
  }) async =>
      DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus:
              await DraftStatusDatabaseMockHelper.createTestDbDraftStatus(
            seed: seed,
            updatedAt: updatedAt,
          ),
        ),
      );

  static void expectDraftStatus(IDraftStatus? actual, IDraftStatus? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.updatedAt, expected!.updatedAt);
    expect(actual.postStatusData, expected.postStatusData);
  }
}
