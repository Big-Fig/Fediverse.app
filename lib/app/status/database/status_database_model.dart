import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

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
  BoolColumn get favourited => boolean()();
  BoolColumn get reblogged => boolean()();
  BoolColumn get muted => boolean()();
  BoolColumn get bookmarked => boolean()();
  TextColumn get content => text().nullable()();

  // TODO: rework with join
  TextColumn get reblog =>
      text().map(PleromaStatusDatabaseConverter()).nullable()();
  TextColumn get application =>
      text().map(PleromaApplicationDatabaseConverter())();

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
}
