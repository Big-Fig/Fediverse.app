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
      text().map(const UnifediApiVisibilityMoorTypeConverter())();

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
      text().map(const UnifediApplicationDatabaseConverter()).nullable()();

  TextColumn? get accountRemoteId => text()();

  TextColumn? get mediaAttachments => text()
      .map(const UnifediApiMediaAttachmentListDatabaseConverter())
      .nullable()();

  TextColumn? get mentions =>
      text().map(const UnifediMentionListDatabaseConverter()).nullable()();

  // TODO: rework with join
  TextColumn? get tags =>
      text().map(const UnifediApiTagListDatabaseConverter()).nullable()();

  TextColumn? get emojis =>
      text().map(const UnifediApiEmojiListDatabaseConverter()).nullable()();

  TextColumn? get poll =>
      text().map(const UnifediApiPollDatabaseConverter()).nullable()();

  TextColumn? get card =>
      text().map(const UnifediCardDatabaseConverter()).nullable()();

  TextColumn? get language => text().nullable()();

  //  expanded unifedi object fields
  TextColumn? get contentVariants => text()
      .named('unifedi_content')
      .map(const UnifediContentDatabaseConverter())
      .nullable()();

  IntColumn? get conversationId =>
      integer().named('unifedi_conversation_id').nullable()();

  IntColumn? get directConversationId =>
      integer().named('unifedi_direct_conversation_id').nullable()();

  TextColumn? get inReplyToAccountAcct =>
      text().named('unifedi_in_reply_to_account_acct').nullable()();

  BoolColumn? get local => boolean().named('unifedi_local').nullable()();

  TextColumn? get spoilerTextVariants => text()
      .named('unifedi_spoiler_text')
      .map(const UnifediContentDatabaseConverter())
      .nullable()();

  DateTimeColumn? get expiresAt =>
      dateTime().named('unifedi_expires_at').nullable()();

  BoolColumn? get threadMuted =>
      boolean().named('unifedi_thread_muted').nullable()();

  TextColumn? get emojiReactions => text()
      .named('unifedi_emoji_reactions')
      .map(const EmojiReactionsListDatabaseConverter())
      .nullable()();

  BoolColumn? get deleted => boolean().nullable()();

  BoolColumn? get hiddenLocallyOnDevice => boolean().nullable()();

  TextColumn? get pendingState =>
      text().nullable().map(const PendingStateDatabaseConverter())();

  TextColumn? get oldPendingRemoteId => text().nullable()();

  TextColumn? get wasSentWithIdempotencyKey => text().nullable()();
}

class UnifediApiVisibilityMoorTypeConverter
    implements TypeConverter<UnifediApiVisibility, String> {
  const UnifediApiVisibilityMoorTypeConverter();

  UnifediApiVisibility fromJson(String value) => value.toUnifediApiVisibility();

  String toJson(UnifediApiVisibility value) => value.stringValue;

  @override
  UnifediApiVisibility mapToDart(String? fromDb) => fromJson(fromDb!);

  @override
  String mapToSql(UnifediApiVisibility? value) => toJson(value!);
}
