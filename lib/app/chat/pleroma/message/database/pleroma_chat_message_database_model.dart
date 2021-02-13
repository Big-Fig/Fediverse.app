import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbChatMessage")
class DbChatMessages extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  TextColumn get chatRemoteId => text()();

  TextColumn get accountRemoteId => text()();

  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get emojis =>
      text().map(PleromaEmojiListDatabaseConverter()).nullable()();

  TextColumn get mediaAttachment =>
      text().map(PleromaMediaAttachmentDatabaseConverter()).nullable()();

  TextColumn get card =>
      text().map(PleromaCardDatabaseConverter()).nullable()();

  TextColumn get pendingState =>
      text().nullable().map(PendingStateDatabaseConverter())();

  TextColumn get oldPendingRemoteId => text().nullable()();
}
