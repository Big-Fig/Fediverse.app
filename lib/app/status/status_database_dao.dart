import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_database_model.dart';
import 'package:moor/moor.dart';

part 'status_database_dao.g.dart';

@UseDao(tables: [
  DbStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_statuses;",
  "findById": "SELECT * FROM db_statuses WHERE id = :id;",
  "findByRemoteId": "SELECT * FROM db_statuses WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_statuses WHERE id = :id;",
  "clear": "DELETE FROM db_statuses",
  "getAll": "SELECT * FROM db_statuses",
  "findLocalIdByRemoteId": "SELECT id FROM db_statuses WHERE remote_id = "
      ":remoteId;",
})
class StatusDao extends DatabaseAccessor<AppDatabase> with _$StatusDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatus> entity) async =>
      into(dbStatuses).insert(entity);


  Future insertAll(Iterable<Insertable<DbStatus>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbStatuses, entities);
      });
  Future<bool> replace(Insertable<DbStatus> entity) async =>
      await update(dbStatuses).replace(entity);


  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbStatus> entity) async {

    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if(localId != null && localId >= 0) {
      await (update(dbStatuses)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

}
