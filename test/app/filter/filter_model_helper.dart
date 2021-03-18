import 'package:fedi/app/filter/filter_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/filter_database_model_helper.dart';

Future<DbFilterPopulatedWrapper> createTestFilter({
  required String seed,
  String? remoteId,
}) async {
  return DbFilterPopulatedWrapper(
    dbFilterPopulated: DbFilterPopulated(
      dbFilter: await createTestDbFilter(
        seed: seed,
        remoteId: remoteId,
      ),
    ),
  );
}

void expectFilter(IFilter? actual, IFilter? expected) {
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
