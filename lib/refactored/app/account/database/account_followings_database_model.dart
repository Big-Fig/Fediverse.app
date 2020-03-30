import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbAccountFollowing")
class DbAccountFollowings extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get accountRemoteId => text()();
  TextColumn get followingAccountRemoteId => text()();


}
