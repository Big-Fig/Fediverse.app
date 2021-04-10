import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_statuses_database_dao.g.dart';

@UseDao(
  tables: [DbConversationStatuses],
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
