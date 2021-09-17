import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/scheduled_status_database_test_helper.dart';

class ScheduledStatusMockHelper {
  static Future<DbScheduledStatusPopulatedWrapper> createTestScheduledStatus({
    required String seed,
    String? remoteId,
  }) async =>
      DbScheduledStatusPopulatedWrapper(
        dbScheduledStatusPopulated: DbScheduledStatusPopulated(
          dbScheduledStatus: await ScheduledStatusDatabaseMockHelper
              .createTestDbScheduledStatus(
            seed: seed,
            remoteId: remoteId,
          ),
        ),
      );

  static void expectScheduledStatus(
    IScheduledStatus? actual,
    IScheduledStatus? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);
    expect(actual.scheduledAt, expected.scheduledAt);
    expect(actual.params, expected.params);
    expect(actual.mediaAttachments, expected.mediaAttachments);
  }
}
