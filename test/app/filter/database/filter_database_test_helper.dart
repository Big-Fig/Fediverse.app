import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class FilterDatabaseMockHelper {
  static Future<DbFilter> createTestDbFilter({
    required String seed,
    String? remoteId,
    String phrase = 'phrase',
    List<String> context = const [
      'home',
      'public',
    ],
    bool irreversible = true,
    bool wholeWord = true,
    DateTime? expiresAt,
  }) async {
    var dbFilter = DbFilter(
      id: null,
      remoteId: remoteId ?? seed + 'remoteId',
      phrase: phrase,
      context: context,
      irreversible: irreversible,
      wholeWord: wholeWord,
      expiresAt: expiresAt,
    );

    return dbFilter;
  }

  static void expectDbFilterPopulated(
    IFilter actual,
    DbFilterPopulated expected,
  ) {
    expect(actual.localId != null, true);
    var dbFilter = expected.dbFilter;
    FilterDatabaseMockHelper.expectDbFilter(actual, dbFilter);
  }

  static void expectDbFilter(IFilter actual, DbFilter dbFilter) {
    expect(
      actual.remoteId,
      dbFilter.remoteId,
    );

    expect(
      actual.phrase,
      dbFilter.phrase,
    );
    expect(
      listEquals(actual.context, dbFilter.context),
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

  static Future<DbFilterPopulated> createTestFilterPopulated(
    DbFilter dbFilter,
  ) async {
    var dbFilterPopulated = DbFilterPopulated(
      dbFilter: dbFilter,
    );

    return dbFilterPopulated;
  }
}
