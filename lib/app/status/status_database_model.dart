import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/card/pleroma_card_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:moor/moor.dart';

@DataClassName("DbStatus")
class DbStatuses extends Table {
  // integer ids works much better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get inReplyToRemoteId => text().nullable()();
  TextColumn get inReplyToAccountRemoteId => text().nullable()();
  BoolColumn get sensitive => boolean()();
  TextColumn get spoilerText => text()();
  TextColumn get visibility => text()
      .customConstraint("UNIQUE NOT NULL")
      .map(PleromaVisibilityDatabaseConverter())();
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
  TextColumn get reblog => text().map(PleromaStatusDatabaseConverter()).nullable()();
  TextColumn get application =>
      text().map(PleromaApplicationDatabaseConverter())();

  // TODO: rework with join
  TextColumn get account => text().map(PleromaAccountDatabaseConverter())();
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
  TextColumn get language =>
      text().nullable()();

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

class PleromaVisibilityDatabaseConverter
    extends TypeConverter<PleromaVisibility, String> {
  const PleromaVisibilityDatabaseConverter();

  @override
  PleromaVisibility mapToDart(String fromDb) =>
      pleromaVisibilityValues.map[fromDb];

  @override
  String mapToSql(PleromaVisibility value) =>
      pleromaVisibilityValues.reverse[value];
}

class PleromaApplicationDatabaseConverter
    extends JsonDatabaseConverter<PleromaApplication> {
  const PleromaApplicationDatabaseConverter() : super();

  @override
  PleromaApplication fromJson(Map<String, dynamic> json) =>
      PleromaApplication.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApplication obj) => obj.toJson();
}

class PleromaStatusDatabaseConverter
    extends JsonDatabaseConverter<PleromaStatus> {
  const PleromaStatusDatabaseConverter() : super();

  @override
  PleromaStatus fromJson(Map<String, dynamic> json) =>
      PleromaStatus.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaStatus obj) => obj.toJson();
}

class PleromaAccountDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccount> {
  const PleromaAccountDatabaseConverter() : super();

  @override
  PleromaAccount fromJson(Map<String, dynamic> json) =>
      PleromaAccount.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaAccount obj) => obj.toJson();
}

class PleromaMediaAttachmentListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaMediaAttachment> {
  const PleromaMediaAttachmentListDatabaseConverter() : super();

  @override
  PleromaMediaAttachment fromJson(Map<String, dynamic> json) =>
      PleromaMediaAttachment.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaMediaAttachment obj) => obj.toJson();
}

class PleromaMentionListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaMention> {
  const PleromaMentionListDatabaseConverter() : super();

  @override
  PleromaMention fromJson(Map<String, dynamic> json) =>
      PleromaMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaMention obj) => obj.toJson();
}

class PleromaTagListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaTag> {
  const PleromaTagListDatabaseConverter() : super();

  @override
  PleromaTag fromJson(Map<String, dynamic> json) => PleromaTag.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaTag obj) => obj.toJson();
}

class PleromaEmojiListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaEmoji> {
  const PleromaEmojiListDatabaseConverter() : super();

  @override
  PleromaEmoji fromJson(Map<String, dynamic> json) =>
      PleromaEmoji.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaEmoji obj) => obj.toJson();
}

class PleromaPollDatabaseConverter extends JsonDatabaseConverter<PleromaPoll> {
  const PleromaPollDatabaseConverter() : super();

  @override
  PleromaPoll fromJson(Map<String, dynamic> json) => PleromaPoll.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaPoll obj) => obj.toJson();
}

class PleromaCardDatabaseConverter extends JsonDatabaseConverter<PleromaCard> {
  const PleromaCardDatabaseConverter() : super();

  @override
  PleromaCard fromJson(Map<String, dynamic> json) => PleromaCard.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaCard obj) => obj.toJson();
}

class PleromaContentDatabaseConverter
    extends JsonDatabaseConverter<PleromaContent> {
  const PleromaContentDatabaseConverter() : super();

  @override
  PleromaContent fromJson(Map<String, dynamic> json) =>
      PleromaContent.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaContent obj) => obj.toJson();
}

class PleromaEmojiReactionsListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaEmojiReactions> {
  const PleromaEmojiReactionsListDatabaseConverter() : super();

  @override
  PleromaEmojiReactions fromJson(Map<String, dynamic> json) =>
      PleromaEmojiReactions.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaEmojiReactions obj) => obj.toJson();
}
