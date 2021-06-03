import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbConversationAccount")
class DbConversationAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get conversationRemoteId => text()();
  TextColumn? get accountRemoteId => text()();
}
