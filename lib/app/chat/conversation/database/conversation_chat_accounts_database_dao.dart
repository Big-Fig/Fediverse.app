import 'package:fedi/app/chat/conversation/database/conversation_chat_accounts_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbConversationAccounts,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_conversation_accounts;",
    "findById": "SELECT * FROM db_conversation_accounts WHERE id = :id;",
    "findByConversationRemoteId":
        "SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;",
    "findByConversationRemoteIdAndAccountRemoteId":
        "SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = "
            ":conversationRemoteId AND account_remote_id = :accountRemoteId;",
    "countById":
        "SELECT COUNT(*) FROM db_conversation_accounts WHERE id = :id;",
    "deleteById": "DELETE FROM db_conversation_accounts WHERE id = :id;",
    "deleteByConversationRemoteId":
        "DELETE FROM db_conversation_accounts WHERE "
            "conversation_remote_id = :conversationRemoteId;",
    "clear": "DELETE FROM db_conversation_accounts",
    "getAll": "SELECT * FROM db_conversation_accounts",
  },
)
class ConversationAccountsDao extends AppDatabaseDao<
    DbConversationAccount,
    int,
    $DbConversationAccountsTable,
    $DbConversationAccountsTable> with _$ConversationAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ConversationAccountsDao(this.db) : super(db);

  @override
  $DbConversationAccountsTable get table => dbConversationAccounts;
}
