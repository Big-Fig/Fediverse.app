import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';
import 'package:unifedi_api/unifedi_api.dart';

// todo: add foreign keys
@DataClassName('DbStatus')
class DbStatuses extends Table {
  // integer ids works much better in SQLite
  IntColumn? get id => integer().nullable().autoIncrement()();

  TextColumn? get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  DateTimeColumn? get createdAt => dateTime()();

  TextColumn? get inReplyToRemoteId => text().nullable()();

  TextColumn? get inReplyToAccountRemoteId => text().nullable()();

  BoolColumn? get sensitive => boolean()();

  TextColumn? get spoilerText => text().nullable()();

  TextColumn? get visibility =>
      text().map(UnifediApiVisibilityMoorTypeConverter())();

  TextColumn? get uri => text()();

  TextColumn? get url => text().nullable()();

  IntColumn? get repliesCount => integer()();

  IntColumn? get reblogsCount => integer()();

  IntColumn? get favouritesCount => integer()();

  BoolColumn? get favourited => boolean().withDefault(const Constant(false))();

  BoolColumn? get reblogged => boolean().withDefault(const Constant(false))();

  BoolColumn? get muted => boolean().withDefault(const Constant(false))();

  BoolColumn? get bookmarked => boolean().nullable()();

  BoolColumn? get pinned => boolean().nullable()();

  TextColumn? get content => text().nullable()();

  TextColumn? get reblogStatusRemoteId => text().nullable()();

  TextColumn? get application =>
      text().map(PleromaApplicationDatabaseConverter()).nullable()();

  TextColumn? get accountRemoteId => text()();

  TextColumn? get mediaAttachments =>
      text().map(unifediApiMediaAttachmentListDatabaseConverter()).nullable()();

  TextColumn? get mentions =>
      text().map(PleromaMentionListDatabaseConverter()).nullable()();

  // TODO: rework with join
  TextColumn? get tags =>
      text().map(UnifediApiTagListDatabaseConverter()).nullable()();

  TextColumn? get emojis =>
      text().map(UnifediApiEmojiListDatabaseConverter()).nullable()();

  TextColumn? get poll =>
      text().map(UnifediApiPollDatabaseConverter()).nullable()();

  TextColumn? get card =>
      text().map(PleromaCardDatabaseConverter()).nullable()();

  TextColumn? get language => text().nullable()();

  //  expanded pleroma object fields
  TextColumn? get contentVariants =>
      text().map(PleromaContentDatabaseConverter()).nullable()();

  IntColumn? get conversationId => integer().nullable()();

  IntColumn? get directConversationId => integer().nullable()();

  TextColumn? get inReplyToAccountAcct => text().nullable()();

  BoolColumn? get local => boolean().nullable()();

  TextColumn? get spoilerTextVariants =>
      text().map(PleromaContentDatabaseConverter()).nullable()();

  DateTimeColumn? get expiresAt => dateTime().nullable()();

  BoolColumn? get threadMuted => boolean().nullable()();

  TextColumn? get emojiReactions =>
      text().map(EmojiReactionsListDatabaseConverter()).nullable()();

  BoolColumn? get deleted => boolean().nullable()();

  BoolColumn? get hiddenLocallyOnDevice => boolean().nullable()();

  TextColumn? get pendingState =>
      text().nullable().map(PendingStateDatabaseConverter())();

  TextColumn? get oldPendingRemoteId => text().nullable()();

  TextColumn? get wasSentWithIdempotencyKey => text().nullable()();
}

class UnifediApiVisibilityMoorTypeConverter
    implements TypeConverter<UnifediApiVisibility, String> {
  const UnifediApiVisibilityMoorTypeConverter();

  UnifediApiVisibility fromJson(String value) =>
      value.toUnifediApiVisibility() ??
      UnifediApiVisibility.unknown(stringValue: value);

  String toJson(UnifediApiVisibility value) =>
      value.stringValue ;

  @override
  UnifediApiVisibility mapToDart(String? fromDb) => fromJson(fromDb!);

  @override
  String mapToSql(UnifediApiVisibility? value) => toJson(value!);
}
