import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:moor/moor.dart';

class PendingStateDatabaseConverter
    extends TypeConverter<PendingState, String> {
  const PendingStateDatabaseConverter();

  @override
  PendingState? mapToDart(String? fromDb) => fromDb?.toPendingState();

  @override
  String? mapToSql(PendingState? value) => value?.toJsonValue();
}

class PleromaApplicationDatabaseConverter
    extends JsonDatabaseConverter<PleromaApplication> {
  const PleromaApplicationDatabaseConverter() : super();

  @override
  PleromaApplication fromJson(Map<String, dynamic>? json) =>
      PleromaApplication.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApplication obj) => obj.toJson();
}

class PleromaNotificationPleromaPartDatabaseConverter
    extends JsonDatabaseConverter<PleromaNotificationPleromaPart> {
  const PleromaNotificationPleromaPartDatabaseConverter() : super();

  @override
  PleromaNotificationPleromaPart fromJson(Map<String, dynamic>? json) =>
      PleromaNotificationPleromaPart.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaNotificationPleromaPart obj) =>
      obj.toJson();
}

class PleromaAccountReportDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccountReport> {
  const PleromaAccountReportDatabaseConverter() : super();

  @override
  PleromaAccountReport fromJson(Map<String, dynamic>? json) =>
      PleromaAccountReport.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaAccountReport obj) => obj.toJson();
}

class PleromaChatMessageDatabaseConverter
    extends JsonDatabaseConverter<PleromaChatMessage> {
  const PleromaChatMessageDatabaseConverter() : super();

  @override
  PleromaChatMessage fromJson(Map<String, dynamic>? json) =>
      PleromaChatMessage.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaChatMessage obj) => obj.toJson();
}

class PleromaAccountDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccount> {
  const PleromaAccountDatabaseConverter() : super();

  @override
  PleromaAccount fromJson(Map<String, dynamic>? json) =>
      PleromaAccount.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaAccount obj) => obj.toJson();
}

class PleromaScheduledStatusParamsDatabaseConverter
    extends JsonDatabaseConverter<PleromaScheduledStatusParams> {
  const PleromaScheduledStatusParamsDatabaseConverter() : super();

  @override
  PleromaScheduledStatusParams fromJson(Map<String, dynamic>? json) =>
      PleromaScheduledStatusParams.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaScheduledStatusParams obj) => obj.toJson();
}

class PostStatusDataDatabaseConverter
    extends JsonDatabaseConverter<PostStatusData> {
  const PostStatusDataDatabaseConverter() : super();

  @override
  PostStatusData fromJson(Map<String, dynamic>? json) =>
      PostStatusData.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PostStatusData obj) => obj.toJson();
}

class PleromaMyAccountPleromaPartNotificationsSettingsDatabaseConverter
    extends JsonDatabaseConverter<
        PleromaMyAccountPleromaPartNotificationsSettings> {
  const PleromaMyAccountPleromaPartNotificationsSettingsDatabaseConverter()
      : super();

  @override
  PleromaMyAccountPleromaPartNotificationsSettings fromJson(
    Map<String, dynamic>? json,
  ) =>
      PleromaMyAccountPleromaPartNotificationsSettings.fromJson(json!);

  @override
  Map<String, dynamic> toJson(
    PleromaMyAccountPleromaPartNotificationsSettings obj,
  ) =>
      obj.toJson();
}

class PleromaAccountRelationshipDatabaseConverter
    extends JsonDatabaseConverter<PleromaAccountRelationship> {
  const PleromaAccountRelationshipDatabaseConverter() : super();

  @override
  PleromaAccountRelationship fromJson(Map<String, dynamic>? json) =>
      PleromaAccountRelationship.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaAccountRelationship obj) => obj.toJson();
}

class PleromaMyAccountSourceDatabaseConverter
    extends JsonDatabaseConverter<PleromaMyAccountSource> {
  const PleromaMyAccountSourceDatabaseConverter() : super();

  @override
  PleromaMyAccountSource fromJson(Map<String, dynamic>? json) =>
      PleromaMyAccountSource.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaMyAccountSource obj) => obj.toJson();
}

class PleromaStatusDatabaseConverter
    extends JsonDatabaseConverter<PleromaStatus> {
  const PleromaStatusDatabaseConverter() : super();

  @override
  PleromaStatus fromJson(Map<String, dynamic>? json) =>
      PleromaStatus.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaStatus obj) => obj.toJson();
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

class PleromaMediaAttachmentDatabaseConverter
    extends JsonDatabaseConverter<PleromaMediaAttachment> {
  const PleromaMediaAttachmentDatabaseConverter() : super();

  @override
  PleromaMediaAttachment fromJson(Map<String, dynamic>? json) =>
      PleromaMediaAttachment.fromJson(json!);

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
  PleromaPoll fromJson(Map<String, dynamic>? json) =>
      PleromaPoll.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaPoll obj) => obj.toJson();
}

class PleromaCardDatabaseConverter extends JsonDatabaseConverter<PleromaCard> {
  const PleromaCardDatabaseConverter() : super();

  @override
  PleromaCard fromJson(Map<String, dynamic>? json) =>
      PleromaCard.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaCard obj) => obj.toJson();
}

class PleromaContentDatabaseConverter
    extends JsonDatabaseConverter<PleromaContent> {
  const PleromaContentDatabaseConverter() : super();

  @override
  PleromaContent fromJson(Map<String, dynamic>? json) =>
      PleromaContent.fromJson(json!);

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
