import 'package:fedi_app/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName('DbChatMessage')
class DbChatMessages extends Table {
  // integer ids works better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  TextColumn? get chatRemoteId => text()();

  TextColumn? get accountRemoteId => text()();

  TextColumn? get content => text().nullable()();

  DateTimeColumn? get createdAt => dateTime()();

  TextColumn? get emojis =>
      text().map(const UnifediApiEmojiListDatabaseConverter()).nullable()();

  TextColumn? get mediaAttachment => text()
      .map(const UnifediApiMediaAttachmentDatabaseConverter())
      .nullable()();

  TextColumn? get card =>
      text().map(const UnifediCardDatabaseConverter()).nullable()();

  TextColumn? get pendingState =>
      text().nullable().map(const PendingStateDatabaseConverter())();

  BoolColumn? get deleted => boolean().nullable()();

  BoolColumn? get hiddenLocallyOnDevice => boolean().nullable()();

  TextColumn? get oldPendingRemoteId => text().nullable()();

  TextColumn? get wasSentWithIdempotencyKey => text().nullable()();
}
