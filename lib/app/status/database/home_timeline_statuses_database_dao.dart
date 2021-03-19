import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_model.dart';
import 'package:moor/moor.dart';

part 'home_timeline_statuses_database_dao.g.dart';

@UseDao(
  tables: [
    DbHomeTimelineStatuses,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_home_timeline_statuses;",
    "findById": "SELECT * FROM db_home_timeline_statuses WHERE id = :id;",
    "countById":
        "SELECT COUNT(*) FROM db_home_timeline_statuses WHERE id = :id;",
    "deleteById": "DELETE FROM db_home_timeline_statuses WHERE id = :id;",
    "deleteByAccountRemoteId": "DELETE FROM db_home_timeline_statuses WHERE "
        "account_remote_id = :accountRemoteId;",
    "clear": "DELETE FROM db_home_timeline_statuses",
    "getAll": "SELECT * FROM db_home_timeline_statuses",
  },
)
class HomeTimelineStatusesDao extends DatabaseAccessor<AppDatabase>
    with _$HomeTimelineStatusesDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  HomeTimelineStatusesDao(this.db) : super(db);

  Future<int> insert(
    Insertable<DbHomeTimelineStatus> entity, {
    InsertMode? mode,
  }) async =>
      into(dbHomeTimelineStatuses).insert(entity, mode: mode);

  Future insertAll(
    List<Insertable<DbHomeTimelineStatus>> entities,
    InsertMode mode,
  ) async {
    await batch(
      (batch) {
        batch.insertAll(
          dbHomeTimelineStatuses,
          entities,
          mode: mode,
        );
      },
    );
  }

  Future<bool> replace(Insertable<DbHomeTimelineStatus> entity) async =>
      await update(dbHomeTimelineStatuses).replace(entity);
}
