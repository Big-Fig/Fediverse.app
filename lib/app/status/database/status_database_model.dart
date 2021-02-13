import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbStatus")
class DbStatuses extends Table {
  // integer ids works much better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get inReplyToRemoteId => text().nullable()();

  TextColumn get inReplyToAccountRemoteId => text().nullable()();

  BoolColumn get sensitive => boolean()();

  TextColumn get spoilerText => text()();

  TextColumn get visibility =>
      text().nullable().map(PleromaVisibilityDatabaseConverter())();

  TextColumn get uri => text()();

  TextColumn get url => text().nullable()();

  IntColumn get repliesCount => integer()();

  IntColumn get reblogsCount => integer()();

  IntColumn get favouritesCount => integer()();

  BoolColumn get favourited => boolean().withDefault(const Constant(false))();

  BoolColumn get reblogged => boolean().withDefault(const Constant(false))();

  BoolColumn get muted => boolean().withDefault(const Constant(false))();

  BoolColumn get bookmarked => boolean().nullable()();

  BoolColumn get pinned => boolean().nullable()();

  TextColumn get content => text().nullable()();

  TextColumn get reblogStatusRemoteId => text().nullable()();

  TextColumn get application =>
      text().map(PleromaApplicationDatabaseConverter()).nullable()();

  TextColumn get accountRemoteId => text()();

  TextColumn get mediaAttachments =>
      text().map(PleromaMediaAttachmentListDatabaseConverter()).nullable()();

  TextColumn get mentions =>
      text().map(PleromaMentionListDatabaseConverter()).nullable()();

  // TODO: rework with join
  TextColumn get tags =>
      text().map(PleromaTagListDatabaseConverter()).nullable()();

  TextColumn get emojis =>
      text().map(PleromaEmojiListDatabaseConverter()).nullable()();

  TextColumn get poll =>
      text().map(PleromaPollDatabaseConverter()).nullable()();

  TextColumn get card =>
      text().map(PleromaCardDatabaseConverter()).nullable()();

  TextColumn get language => text().nullable()();

  //  expanded pleroma object fields
  TextColumn get pleromaContent =>
      text().map(PleromaContentDatabaseConverter()).nullable()();

  IntColumn get pleromaConversationId => integer().nullable()();

  IntColumn get pleromaDirectConversationId => integer().nullable()();

  TextColumn get pleromaInReplyToAccountAcct => text().nullable()();

  BoolColumn get pleromaLocal => boolean().nullable()();

  TextColumn get pleromaSpoilerText =>
      text().map(PleromaContentDatabaseConverter()).nullable()();

  DateTimeColumn get pleromaExpiresAt => dateTime().nullable()();

  BoolColumn get pleromaThreadMuted => boolean().nullable()();

  TextColumn get pleromaEmojiReactions =>
      text().map(PleromaEmojiReactionsListDatabaseConverter()).nullable()();

  BoolColumn get deleted => boolean().nullable()();

  TextColumn get pendingState =>
      text().nullable().map(PendingStateDatabaseConverter())();

  TextColumn get oldPendingRemoteId => text().nullable()();
}
