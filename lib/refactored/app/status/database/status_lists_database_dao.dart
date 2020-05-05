import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/database/status_lists_database_model.dart';
import 'package:moor/moor.dart';

part 'status_lists_database_dao.g.dart';

@UseDao(tables: [
  DbStatusLists
], queries: {
  "countAll": "SELECT Count(*) FROM db_status_lists;",
  "findById": "SELECT * FROM db_status_lists WHERE id = :id;",
  "countById": "SELECT COUNT(*) FROM db_status_lists WHERE id = :id;",
  "deleteById": "DELETE FROM db_status_lists WHERE id = :id;",
  "clear": "DELETE FROM db_status_lists",
  "getAll": "SELECT * FROM db_status_lists",
  "findByListRemoteId":
      "SELECT * FROM db_status_lists WHERE list_remote_id = :listRemoteId;",
})
class StatusListsDao extends DatabaseAccessor<AppDatabase>
    with _$StatusListsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusListsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatusList> entity,
          {InsertMode mode}) async =>
      into(dbStatusLists).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbStatusList> entity) async =>
      into(db.dbStatusLists).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          Iterable<Insertable<DbStatusList>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbStatusLists, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbStatusList> entity) async =>
      await update(dbStatusLists).replace(entity);
}
