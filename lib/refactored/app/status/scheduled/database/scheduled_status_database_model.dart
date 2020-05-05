import 'package:fedi/refactored/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

@DataClassName("DbScheduledStatus")
class DbScheduledStatuses extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  DateTimeColumn get scheduledAt => dateTime()();

  BoolColumn get canceled => boolean()();

  TextColumn get params =>
      text().map(PleromaScheduledStatusParamsDatabaseConverter()).nullable()();

  TextColumn get mediaAttachments =>
      text().map(PleromaMediaAttachmentListDatabaseConverter()).nullable()();
}
