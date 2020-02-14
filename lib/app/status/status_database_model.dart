import 'package:moor/moor.dart';

@DataClassName("DbStatus")
class DbStatuses extends Table {
  // integer ids works much better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get inReplyToRemoteId => text()();
  TextColumn get inReplyToAccountRemoteId => text()();
  BoolColumn get sensitive => boolean()();
  TextColumn get spoilerText => text()();
  TextColumn get visibility => text()();
  TextColumn get uri => text()();
  TextColumn get url => text()();
  IntColumn get repliesCount => integer()();
  IntColumn get reblogsCount => integer()();
  IntColumn get favouritesCount => integer()();
  BoolColumn get favourited => boolean()();
  BoolColumn get reblogged => boolean()();
  BoolColumn get muted => boolean()();
  BoolColumn get bookmarked => boolean()();
  BoolColumn get pinned => boolean()();
  TextColumn get content => text()();
  IntColumn get reblogLocalId => integer()();
  TextColumn get application => text()();
  TextColumn get account => text()();
  TextColumn get mediaAttachments => text()();
  TextColumn get mentions => text()();
  TextColumn get tags => text()();
  TextColumn get emojis => text()();
  TextColumn get poll => text()();
}
