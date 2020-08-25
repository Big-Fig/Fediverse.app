import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbStatusHashtag")
class DbStatusHashtags extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get statusRemoteId => text()();
  TextColumn get hashtag => text()();
}
