import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbConversation")
class DbConversations extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  BoolColumn get unread => boolean()();
}
