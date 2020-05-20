import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_hashtags_database_model.dart';
import 'package:moor/moor.dart';

part 'status_hashtags_database_dao.g.dart';

@UseDao(tables: [
  DbStatusHashtags
], queries: {
  "countAll": "SELECT Count(*) FROM db_status_hashtags;",
  "findById": "SELECT * FROM db_status_hashtags WHERE id = :id;",
  "countById": "SELECT COUNT(*) FROM db_status_hashtags WHERE id = :id;",
  "deleteById": "DELETE FROM db_status_hashtags WHERE id = :id;",
  "deleteByStatusRemoteId": "DELETE FROM db_status_hashtags WHERE "
      "status_remote_id = :statusRemoteId;",
  "clear": "DELETE FROM db_status_hashtags",
  "getAll": "SELECT * FROM db_status_hashtags"
})
class StatusHashtagsDao extends DatabaseAccessor<AppDatabase>
    with _$StatusHashtagsDaoMixin {
  @override
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusHashtagsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatusHashtag> entity,
          {InsertMode mode}) async =>
      into(dbStatusHashtags).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbStatusHashtag>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbStatusHashtags, entities, mode: mode);
      });
  Future<bool> replace(Insertable<DbStatusHashtag> entity) async =>
      await update(dbStatusHashtags).replace(entity);
}
