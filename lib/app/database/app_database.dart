import 'package:fedi/app/status/status_database_dao.dart';
import 'package:fedi/app/status/status_database_model.dart';
import 'package:moor/moor.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [
    DbStatuses,
  ],
  daos: [
    StatusDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
