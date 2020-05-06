import 'package:fedi/refactored/app/conversation/database/conversation_statuses_database_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'conversation_statuses_database_dao.g.dart';

@UseDao(tables: [
  DbConversationStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_conversation_statuses;",
  "findById": "SELECT * FROM db_conversation_statuses WHERE id = :id;",
  "findByConversationRemoteId":
      "SELECT * FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;",
  "countById": "SELECT COUNT(*) FROM db_conversation_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_conversation_statuses WHERE id = :id;",
  "deleteByConversationRemoteId": "DELETE FROM db_conversation_statuses WHERE "
      "conversation_remote_id = :conversationRemoteId;",
  "clear": "DELETE FROM db_conversation_statuses",
  "getAll": "SELECT * FROM db_conversation_statuses"
})
class ConversationStatusesDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationStatusesDaoMixin {
  @override
  final AppDatabase db;

  // Called by the AppDatabase class
  ConversationStatusesDao(this.db) : super(db);

  Future<int> insert(Insertable<DbConversationStatus> entity, { InsertMode mode}) async =>
      into(dbConversationStatuses).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbConversationStatus>> entities,
          InsertMode mode) async {
    await batch((batch) {
        batch.insertAll(dbConversationStatuses, entities, mode: mode);
      });
  }

  Future<bool> replace(Insertable<DbConversationStatus> entity) async =>
      await update(dbConversationStatuses).replace(entity);
}
