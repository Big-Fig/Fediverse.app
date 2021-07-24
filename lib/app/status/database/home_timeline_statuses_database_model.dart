import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName('DbHomeTimelineStatus')
class DbHomeTimelineStatuses extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get accountRemoteId => text().customConstraint('NOT NULL')();
  TextColumn? get statusRemoteId =>
      text().customConstraint('UNIQUE NOT NULL')();
}
