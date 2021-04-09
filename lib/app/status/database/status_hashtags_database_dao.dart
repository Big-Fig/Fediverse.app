import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_model.dart';
import 'package:moor/moor.dart';

part 'status_hashtags_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusHashtags,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_status_hashtags;",
    "findById": "SELECT * FROM db_status_hashtags WHERE id = :id;",
    "countById": "SELECT COUNT(*) FROM db_status_hashtags WHERE id = :id;",
    "deleteById": "DELETE FROM db_status_hashtags WHERE id = :id;",
    "deleteByStatusRemoteId": "DELETE FROM db_status_hashtags WHERE "
        "status_remote_id = :statusRemoteId;",
    "clear": "DELETE FROM db_status_hashtags",
    "getAll": "SELECT * FROM db_status_hashtags",
  },
)
class StatusHashtagsDao extends AppDatabaseDao<
    DbStatusHashtag,
    int,
    $DbStatusHashtagsTable,
    $DbStatusHashtagsTable> with _$StatusHashtagsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusHashtagsDao(this.db) : super(db);

  @override
  $DbStatusHashtagsTable get table => dbStatusHashtags;
}
