import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

class FilterRepositoryTestHelper {
  static Future<DbFilter> insertDbFilter(
    FilterRepository filterRepository,
    DbFilter filterData,
  ) async {
    var id = await filterRepository.insertInDbType(
      filterData,
      mode: null,
    );
    assert(id > 0, true);
    var dbFilter = filterData.copyWith(id: id);
    return dbFilter;
  }
}
