import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbHomeTimelineStatus")
class DbHomeTimelineStatuses extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get statusRemoteId => text().customConstraint("UNIQUE NOT NULL")();
}
