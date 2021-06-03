import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbConversation")
class DbConversations extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  BoolColumn? get unread => boolean()();

  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
