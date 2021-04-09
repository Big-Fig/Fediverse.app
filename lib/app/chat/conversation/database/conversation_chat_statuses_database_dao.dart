import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_statuses_database_dao.g.dart';

@UseDao(
  tables: [DbConversationStatuses],
  queries: {
    "countAll": "SELECT Count(*) FROM db_conversation_statuses;",
    "findById": "SELECT * FROM db_conversation_statuses WHERE id = :id;",
    "getAll": "SELECT * FROM db_conversation_statuses",
    "findByConversationRemoteId":
        "SELECT * FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;",
    "countById":
        "SELECT COUNT(*) FROM db_conversation_statuses WHERE id = :id;",
    "deleteById": "DELETE FROM db_conversation_statuses WHERE id = :id;",
    "deleteByConversationRemoteId":
        "DELETE FROM db_conversation_statuses WHERE "
            "conversation_remote_id = :conversationRemoteId;",
    "deleteByConversationRemoteIdAndStatusRemoteId":
        "DELETE FROM db_conversation_statuses WHERE "
            "conversation_remote_id = :conversationRemoteId "
            "AND "
            "status_remote_id = :statusRemoteId;",
    "clear": "DELETE FROM db_conversation_statuses",
  },
)
class ConversationStatusesDao extends AppDatabaseDao<
    DbConversationStatus,
    int,
    $DbConversationStatusesTable,
    $DbConversationStatusesTable> with _$ConversationStatusesDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ConversationStatusesDao(this.db) : super(db);

  @override
  $DbConversationStatusesTable get table => dbConversationStatuses;
}
