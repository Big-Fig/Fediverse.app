import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbNotification")
class DbNotifications extends Table {
  // integer ids works much better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();
  TextColumn get accountRemoteId => text()();
  TextColumn get statusRemoteId => text().nullable()();
  TextColumn get chatRemoteId => text().nullable()();

  TextColumn get chatMessageRemoteId => text().nullable()();
  TextColumn get emoji => text().nullable()();
  TextColumn get pleroma => text()
      .nullable()
      .map(PleromaNotificationPleromaPartDatabaseConverter())();
  BoolColumn get unread => boolean().nullable()();
  TextColumn get type => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  BoolColumn get dismissed => boolean().nullable()();
}
