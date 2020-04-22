import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/moor/moor_json_type_converter.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
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

class MastodonNotificationTypeDatabaseConverter
    extends TypeConverter<MastodonNotificationType, String> {
  const MastodonNotificationTypeDatabaseConverter();

  @override
  MastodonNotificationType mapToDart(String fromDb) =>
      mastodonNotificationTypeValues.map[fromDb];

  @override
  String mapToSql(MastodonNotificationType value) =>
      mastodonNotificationTypeValues.reverse[value];
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

class PleromaMyAccountPleromaPartNotificationsSettingsDatabaseConverter
    extends JsonDatabaseConverter<
        PleromaMyAccountPleromaPartNotificationsSettings> {
  const PleromaMyAccountPleromaPartNotificationsSettingsDatabaseConverter()
      : super();

  @override
  PleromaMyAccountPleromaPartNotificationsSettings fromJson(
          Map<String, dynamic> json) =>
      PleromaMyAccountPleromaPartNotificationsSettings.fromJson(json);

  @override
  Map<String, dynamic> toJson(
          PleromaMyAccountPleromaPartNotificationsSettings obj) =>
      obj.toJson();
}

class PleromaAccountRelationshipDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccountRelationship> {
  const PleromaAccountRelationshipDatabaseConverter() : super();

  @override
  PleromaAccountRelationship fromJson(Map<String, dynamic> json) =>
      PleromaAccountRelationship.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaAccountRelationship obj) => obj.toJson();
}

class PleromaMyAccountSourceDatabaseConverter
    extends JsonDatabaseConverter<PleromaMyAccountSource> {
  const PleromaMyAccountSourceDatabaseConverter() : super();

  @override
  PleromaMyAccountSource fromJson(Map<String, dynamic> json) =>
      PleromaMyAccountSource.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaMyAccountSource obj) => obj.toJson();
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
    extends JsonListDatabaseConverter<PleromaStatusEmojiReaction> {
  const PleromaEmojiReactionsListDatabaseConverter() : super();

  @override
  PleromaStatusEmojiReaction fromJson(Map<String, dynamic> json) =>
      PleromaStatusEmojiReaction.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaStatusEmojiReaction obj) => obj.toJson();
}
