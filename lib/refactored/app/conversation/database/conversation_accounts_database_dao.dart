import 'package:fedi/refactored/app/conversation/database/conversation_accounts_database_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'conversation_accounts_database_dao.g.dart';

@UseDao(tables: [
  DbConversationAccounts
], queries: {
  "countAll": "SELECT Count(*) FROM db_conversation_accounts;",
  "findById": "SELECT * FROM db_conversation_accounts WHERE id = :id;",
  "findByConversationRemoteId":
      "SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;",
  "findByConversationRemoteIdAndAccountRemoteId":
      "SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = "
          ":conversationRemoteId AND account_remote_id = :accountRemoteId;",
  "countById": "SELECT COUNT(*) FROM db_conversation_accounts WHERE id = :id;",
  "deleteById": "DELETE FROM db_conversation_accounts WHERE id = :id;",
  "deleteByConversationRemoteId": "DELETE FROM db_conversation_accounts WHERE "
      "conversation_remote_id = :conversationRemoteId;",
  "clear": "DELETE FROM db_conversation_accounts",
  "getAll": "SELECT * FROM db_conversation_accounts"
})
class ConversationAccountsDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ConversationAccountsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbConversationAccount> entity,
          {InsertMode mode}) async =>
      into(dbConversationAccounts).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbConversationAccount>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbConversationAccounts, entities);
      });

  Future<bool> replace(Insertable<DbConversationAccount> entity) async =>
      await update(dbConversationAccounts).replace(entity);
}
