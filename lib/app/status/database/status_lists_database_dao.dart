import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_model.dart';
import 'package:moor/moor.dart';

part 'status_lists_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusLists,
  ],
)
class StatusListsDao extends AppDatabaseDao<DbStatusList, int,
    $DbStatusListsTable, $DbStatusListsTable> with _$StatusListsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusListsDao(this.db) : super(db);

  @override
  $DbStatusListsTable get table => dbStatusLists;
}
