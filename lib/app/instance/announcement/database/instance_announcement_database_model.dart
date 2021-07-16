import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

@DataClassName('DbInstanceAnnouncement')
class DbInstanceAnnouncements extends Table {
  // integer ids works much better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  BoolColumn get allDay => boolean()();

  DateTimeColumn? get publishedAt => dateTime()();

  DateTimeColumn? get updatedAt => dateTime()();

  BoolColumn get read => boolean()();

  TextColumn get content => text()();

  TextColumn? get reactions => text()
      .map(PleromaApiAnnouncementReactionListDatabaseConverter())
      .nullable()();

  TextColumn? get mentions =>
      text().map(PleromaApiMentionListDatabaseConverter()).nullable()();

  TextColumn? get tags =>
      text().map(PleromaApiTagListDatabaseConverter()).nullable()();

  TextColumn? get statuses =>
      text().map(PleromaApiStatusListDatabaseConverter()).nullable()();

  DateTimeColumn? get scheduledAt => dateTime().nullable()();

  DateTimeColumn? get startsAt => dateTime().nullable()();

  DateTimeColumn? get endsAt => dateTime().nullable()();
}
