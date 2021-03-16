import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbChatAccount")
class DbChatAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().autoIncrement()();

  TextColumn? get chatRemoteId => text()();
  TextColumn? get accountRemoteId => text()();
}
