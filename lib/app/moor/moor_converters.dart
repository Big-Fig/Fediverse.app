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
import 'package:fedi/Pleroma/source/pleroma_source_model.dart';
import 'package:fedi/Pleroma/field/pleroma_field_model.dart';
import 'package:fedi/Pleroma/relationship/pleroma_relationship_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:moor/moor.dart';

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
class PleromaAccountPleromaPartNotificationsSettingsDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccountPleromaPartNotificationsSettings> {
  const PleromaAccountPleromaPartNotificationsSettingsDatabaseConverter() : super();

  @override
  PleromaAccountPleromaPartNotificationsSettings fromJson(Map<String, dynamic> json) =>
      PleromaAccountPleromaPartNotificationsSettings.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaAccountPleromaPartNotificationsSettings obj) => obj.toJson();
}
class PleromaRelationshipDatabaseConverter
    extends JsonDatabaseConverter<PleromaRelationship> {
  const PleromaRelationshipDatabaseConverter() : super();

  @override
  PleromaRelationship fromJson(Map<String, dynamic> json) =>
      PleromaRelationship.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaRelationship obj) => obj.toJson();
}
class PleromaSourceDatabaseConverter
    extends JsonDatabaseConverter<PleromaSource> {
  const PleromaSourceDatabaseConverter() : super();

  @override
  PleromaSource fromJson(Map<String, dynamic> json) =>
      PleromaSource.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaSource obj) => obj.toJson();
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

class PleromaFieldListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaField> {
  const PleromaFieldListDatabaseConverter() : super();

  @override
  PleromaField fromJson(Map<String, dynamic> json) =>
      PleromaField.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaField obj) => obj.toJson();
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
