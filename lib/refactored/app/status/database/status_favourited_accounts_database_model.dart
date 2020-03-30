import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbStatusFavouritedAccount")
class DbStatusFavouritedAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get statusRemoteId => text()();
  TextColumn get accountRemoteId => text()();


}
