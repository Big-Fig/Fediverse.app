import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbAccountFollower")
class DbAccountFollowers extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get accountRemoteId => text()();
  TextColumn get followerAccountRemoteId => text()();
}
