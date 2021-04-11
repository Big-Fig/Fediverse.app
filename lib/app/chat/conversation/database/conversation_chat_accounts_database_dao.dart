import 'package:fedi/app/chat/conversation/database/conversation_chat_accounts_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbConversationAccounts,
  ],
)
class ConversationAccountsDao extends DatabaseDao<
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
