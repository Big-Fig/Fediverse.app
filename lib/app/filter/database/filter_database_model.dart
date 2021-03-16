import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:moor/moor.dart';

@DataClassName("DbFilter")
class DbFilters extends Table {
  // integer ids works much better in SQLite
  IntColumn? get id => integer().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  TextColumn? get phrase => text()();

  TextColumn? get context => text().nullable().map(StringListDatabaseConverter())();

  BoolColumn? get irreversible => boolean().nullable()();

  BoolColumn? get wholeWord => boolean().nullable()();

  DateTimeColumn? get expiresAt => dateTime().nullable()();
}
