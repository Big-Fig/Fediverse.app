import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

@DataClassName("DbDraftStatus")
class DbDraftStatuses extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().autoIncrement()();

  DateTimeColumn? get updatedAt => dateTime()();

  TextColumn? get data => text().map(PostStatusDataDatabaseConverter())();
}
