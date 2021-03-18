import 'package:collection/collection.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:flutter_test/flutter_test.dart';

Function eq = const ListEquality().equals;

Future<DbFilter> createTestDbFilter({
  required String seed,
  String? remoteId,
  String phrase = "phrase",
  List<String> context = const [
    "home",
    "public",
  ],
  bool irreversible = true,
  bool wholeWord = true,
  DateTime? expiresAt,
}) async {
  DbFilter dbFilter = DbFilter(
    id: null,
    remoteId: remoteId ?? seed + "remoteId",
    phrase: phrase,
    context: context,
    irreversible: irreversible,
    wholeWord: wholeWord,
    expiresAt: expiresAt,
  );
  return dbFilter;
}

void expectDbFilterPopulated(IFilter actual, DbFilterPopulated expected) {
  expect(actual.localId != null, true);
  var dbFilter = expected.dbFilter;
  expectDbFilter(actual, dbFilter);
}

void expectDbFilter(IFilter actual, DbFilter dbFilter) {
  expect(
    actual.remoteId,
    dbFilter.remoteId,
  );

  expect(
    actual.phrase,
    dbFilter.phrase,
  );
  expect(
    eq(actual.context, dbFilter.context),
    true,
  );
  expect(
    actual.irreversible,
    dbFilter.irreversible,
  );
  expect(
    actual.wholeWord,
    dbFilter.wholeWord,
  );
  expect(
    actual.expiresAt,
    dbFilter.expiresAt,
  );
}

Future<DbFilterPopulated> createTestFilterPopulated(DbFilter dbFilter) async {
  DbFilterPopulated dbFilterPopulated = DbFilterPopulated(
    dbFilter: dbFilter,
  );
  return dbFilterPopulated;
}
