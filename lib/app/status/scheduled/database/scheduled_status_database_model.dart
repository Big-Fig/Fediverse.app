import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

@DataClassName('DbScheduledStatus')
class DbScheduledStatuses extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  DateTimeColumn? get scheduledAt => dateTime()();

  BoolColumn? get canceled => boolean()();

  TextColumn? get params =>
      text().map(const PleromaScheduledStatusParamsDatabaseConverter())();

  TextColumn? get mediaAttachments => text()
      .map(const UnifediApiMediaAttachmentListDatabaseConverter())
      .nullable()();
}
