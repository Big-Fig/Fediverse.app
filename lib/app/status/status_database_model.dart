import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
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
  TextColumn get visibility => text()
      .customConstraint("UNIQUE NOT NULL")
      .map(PleromaVisibilityDatabaseConverter())();
  TextColumn get uri => text()();
  TextColumn get url => text()();
  IntColumn get repliesCount => integer()();
  IntColumn get reblogsCount => integer()();
  IntColumn get favouritesCount => integer()();
  BoolColumn get favourited => boolean()();
  BoolColumn get reblogged => boolean()();
  BoolColumn get muted => boolean()();
  BoolColumn get bookmarked => boolean()();
  TextColumn get content => text()();
  // TODO: rework with join
  TextColumn get reblog =>
      text().map(PleromaStatusDatabaseConverter())();
  TextColumn get application =>
      text().map(PleromaApplicationDatabaseConverter())();
  // TODO: rework with join
  TextColumn get account => text().map(PleromaAccountDatabaseConverter())();
  TextColumn get mediaAttachments =>
      text().map(PleromaMediaAttachmentDatabaseConverter())();
  TextColumn get mentions => text().map(PleromaMentionDatabaseConverter())();
  // TODO: rework with join
  TextColumn get tags => text().map(PleromaTagDatabaseConverter())();
  TextColumn get emojis => text().map(PleromaEmojiDatabaseConverter())();
  TextColumn get poll => text().map(PleromaPollDatabaseConverter())();

  //  expanded pleroma object fields
  TextColumn get pleromaContent =>
      text().map(PleromaContentDatabaseConverter())();
  IntColumn get pleromaConversationId => integer()();
  IntColumn get pleromaDirectConversationId => integer()();
  TextColumn get pleromaInReplyToAccountAcct => text()();
  BoolColumn get pleromaLocal => boolean()();
  TextColumn get pleromaSpoilerText =>
      text().map(PleromaContentDatabaseConverter())();
  DateTimeColumn get pleromaExpiresAt => dateTime()();
  BoolColumn get pleromaThreadMuted => boolean()();

  TextColumn get pleromaEmojiReactions =>
      text().map(PleromaEmojiReactionsDatabaseConverter())();
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

class PleromaMediaAttachmentDatabaseConverter
    extends JsonListDatabaseConverter<PleromaMediaAttachment> {
  const PleromaMediaAttachmentDatabaseConverter() : super();

  @override
  PleromaMediaAttachment fromJson(Map<String, dynamic> json) =>
      PleromaMediaAttachment.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaMediaAttachment obj) => obj.toJson();
}

class PleromaMentionDatabaseConverter
    extends JsonListDatabaseConverter<PleromaMention> {
  const PleromaMentionDatabaseConverter() : super();

  @override
  PleromaMention fromJson(Map<String, dynamic> json) =>
      PleromaMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaMention obj) => obj.toJson();
}

class PleromaTagDatabaseConverter
    extends JsonListDatabaseConverter<PleromaTag> {
  const PleromaTagDatabaseConverter() : super();

  @override
  PleromaTag fromJson(Map<String, dynamic> json) => PleromaTag.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaTag obj) => obj.toJson();
}

class PleromaEmojiDatabaseConverter
    extends JsonListDatabaseConverter<PleromaEmoji> {
  const PleromaEmojiDatabaseConverter() : super();

  @override
  PleromaEmoji fromJson(Map<String, dynamic> json) =>
      PleromaEmoji.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaEmoji obj) => obj.toJson();
}

class PleromaPollDatabaseConverter
    extends JsonListDatabaseConverter<PleromaPoll> {
  const PleromaPollDatabaseConverter() : super();

  @override
  PleromaPoll fromJson(Map<String, dynamic> json) => PleromaPoll.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaPoll obj) => obj.toJson();
}

class PleromaContentDatabaseConverter
    extends JsonListDatabaseConverter<PleromaContent> {
  const PleromaContentDatabaseConverter() : super();

  @override
  PleromaContent fromJson(Map<String, dynamic> json) =>
      PleromaContent.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaContent obj) => obj.toJson();
}

class PleromaEmojiReactionsDatabaseConverter
    extends JsonListDatabaseConverter<PleromaEmojiReactions> {
  const PleromaEmojiReactionsDatabaseConverter() : super();

  @override
  PleromaEmojiReactions fromJson(Map<String, dynamic> json) =>
      PleromaEmojiReactions.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaEmojiReactions obj) => obj.toJson();
}
