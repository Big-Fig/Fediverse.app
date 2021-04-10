import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_model.dart';
import 'package:moor/moor.dart';

part 'home_timeline_statuses_database_dao.g.dart';

@UseDao(
  tables: [
    DbHomeTimelineStatuses,
  ],
)
class HomeTimelineStatusesDao extends AppDatabaseDao<
    DbHomeTimelineStatus,
    int,
    $DbHomeTimelineStatusesTable,
    $DbHomeTimelineStatusesTable> with _$HomeTimelineStatusesDaoMixin {
  final AppDatabase db;

// Called by the AppDatabase class
  HomeTimelineStatusesDao(this.db) : super(db);

  @override
  $DbHomeTimelineStatusesTable get table => dbHomeTimelineStatuses;
}
