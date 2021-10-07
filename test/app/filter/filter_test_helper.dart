import 'package:fedi/app/filter/filter_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/filter_database_test_helper.dart';

class FilterMockHelper {
  static Future<DbFilterPopulatedWrapper> createTestFilter({
    required String seed,
    String? remoteId,
  }) async {
    return DbFilterPopulatedWrapper(
      dbFilterPopulated: DbFilterPopulated(
        dbFilter: await FilterDatabaseMockHelper.createTestDbFilter(
          seed: seed,
          remoteId: remoteId,
        ),
      ),
    );
  }

  static void expectFilter(IFilter? actual, IFilter? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);

    expect(actual.phrase, expected.phrase);
    expect(actual.context, expected.context);
    expect(actual.irreversible, expected.irreversible);
    expect(actual.wholeWord, expected.wholeWord);
    expect(actual.expiresAt, expected.expiresAt);
  }
}
