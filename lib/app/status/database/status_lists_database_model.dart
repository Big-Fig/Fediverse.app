import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName('DbStatusList')
class DbStatusLists extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get statusRemoteId => text()();
  TextColumn? get listRemoteId => text()();
}
