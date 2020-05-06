import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/scheduled_status_database_model_helper.dart';

Future<DbScheduledStatusWrapper> createTestScheduledStatus(
        {@required String seed, String remoteId}) async =>
    DbScheduledStatusWrapper(
        await createTestDbScheduledStatus(seed: seed, remoteId: remoteId));

expectScheduledStatus(IScheduledStatus actual, IScheduledStatus expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);
  expect(actual.scheduledAt, expected.scheduledAt);
  expect(actual.params, expected.params);
  expect(actual.mediaAttachments, expected.mediaAttachments);
}
