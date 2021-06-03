import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
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
    extends JsonDatabaseConverter<PleromaApiApplication> {
  const PleromaApplicationDatabaseConverter() : super();

  @override
  PleromaApiApplication fromJson(Map<String, dynamic>? json) =>
      PleromaApiApplication.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiApplication obj) => obj.toJson();
}

class PleromaNotificationPleromaPartDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiNotificationPleromaPart> {
  const PleromaNotificationPleromaPartDatabaseConverter() : super();

  @override
  PleromaApiNotificationPleromaPart fromJson(Map<String, dynamic>? json) =>
      PleromaApiNotificationPleromaPart.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiNotificationPleromaPart obj) =>
      obj.toJson();
}

class PleromaAccountReportDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiAccountReport> {
  const PleromaAccountReportDatabaseConverter() : super();

  @override
  PleromaApiAccountReport fromJson(Map<String, dynamic>? json) =>
      PleromaApiAccountReport.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiAccountReport obj) => obj.toJson();
}

class PleromaChatMessageDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiChatMessage> {
  const PleromaChatMessageDatabaseConverter() : super();

  @override
  PleromaApiChatMessage fromJson(Map<String, dynamic>? json) =>
      PleromaApiChatMessage.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiChatMessage obj) => obj.toJson();
}

class PleromaAccountDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiAccount> {
  const PleromaAccountDatabaseConverter() : super();

  @override
  PleromaApiAccount fromJson(Map<String, dynamic>? json) =>
      PleromaApiAccount.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiAccount obj) => obj.toJson();
}

class PleromaScheduledStatusParamsDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiScheduledStatusParams> {
  const PleromaScheduledStatusParamsDatabaseConverter() : super();

  @override
  PleromaApiScheduledStatusParams fromJson(Map<String, dynamic>? json) =>
      PleromaApiScheduledStatusParams.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiScheduledStatusParams obj) =>
      obj.toJson();
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

class PleromaApiMyAccountPleromaPartNotificationsSettingsDatabaseConverter
    extends JsonDatabaseConverter<
        PleromaApiMyAccountPleromaPartNotificationsSettings> {
  const PleromaApiMyAccountPleromaPartNotificationsSettingsDatabaseConverter()
      : super();

  @override
  PleromaApiMyAccountPleromaPartNotificationsSettings fromJson(
    Map<String, dynamic>? json,
  ) =>
      PleromaApiMyAccountPleromaPartNotificationsSettings.fromJson(json!);

  @override
  Map<String, dynamic> toJson(
    PleromaApiMyAccountPleromaPartNotificationsSettings obj,
  ) =>
      obj.toJson();
}

class PleromaApiAccountRelationshipDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiAccountRelationship> {
  const PleromaApiAccountRelationshipDatabaseConverter() : super();

  @override
  PleromaApiAccountRelationship fromJson(Map<String, dynamic>? json) =>
      PleromaApiAccountRelationship.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiAccountRelationship obj) =>
      obj.toJson();
}

class PleromaMyAccountSourceDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiMyAccountSource> {
  const PleromaMyAccountSourceDatabaseConverter() : super();

  @override
  PleromaApiMyAccountSource fromJson(Map<String, dynamic>? json) =>
      PleromaApiMyAccountSource.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiMyAccountSource obj) => obj.toJson();
}

class PleromaStatusDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiStatus> {
  const PleromaStatusDatabaseConverter() : super();

  @override
  PleromaApiStatus fromJson(Map<String, dynamic>? json) =>
      PleromaApiStatus.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiStatus obj) => obj.toJson();
}

class PleromaMediaAttachmentListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiMediaAttachment> {
  const PleromaMediaAttachmentListDatabaseConverter() : super();

  @override
  PleromaApiMediaAttachment fromJson(Map<String, dynamic> json) =>
      PleromaApiMediaAttachment.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiMediaAttachment obj) => obj.toJson();
}

class PleromaApiAnnouncementReactionListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiAnnouncementReaction> {
  const PleromaApiAnnouncementReactionListDatabaseConverter() : super();

  @override
  PleromaApiAnnouncementReaction fromJson(Map<String, dynamic> json) =>
      PleromaApiAnnouncementReaction.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiAnnouncementReaction obj) =>
      obj.toJson();
}

class PleromaMediaAttachmentDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiMediaAttachment> {
  const PleromaMediaAttachmentDatabaseConverter() : super();

  @override
  PleromaApiMediaAttachment fromJson(Map<String, dynamic>? json) =>
      PleromaApiMediaAttachment.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiMediaAttachment obj) => obj.toJson();
}

class PleromaMentionListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiMention> {
  const PleromaMentionListDatabaseConverter() : super();

  @override
  PleromaApiMention fromJson(Map<String, dynamic> json) =>
      PleromaApiMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiMention obj) => obj.toJson();
}

class PleromaApiFieldListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiField> {
  const PleromaApiFieldListDatabaseConverter() : super();

  @override
  PleromaApiField fromJson(Map<String, dynamic> json) =>
      PleromaApiField.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiField obj) => obj.toJson();
}

class PleromaApiTagListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiTag> {
  const PleromaApiTagListDatabaseConverter() : super();

  @override
  PleromaApiTag fromJson(Map<String, dynamic> json) =>
      PleromaApiTag.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiTag obj) => obj.toJson();
}

class PleromaApiStatusListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiStatus> {
  const PleromaApiStatusListDatabaseConverter() : super();

  @override
  PleromaApiStatus fromJson(Map<String, dynamic> json) =>
      PleromaApiStatus.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiStatus obj) => obj.toJson();
}

class PleromaApiMentionListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiMention> {
  const PleromaApiMentionListDatabaseConverter() : super();

  @override
  PleromaApiMention fromJson(Map<String, dynamic> json) =>
      PleromaApiMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiMention obj) => obj.toJson();
}

class PleromaApiEmojiListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiEmoji> {
  const PleromaApiEmojiListDatabaseConverter() : super();

  @override
  PleromaApiEmoji fromJson(Map<String, dynamic> json) =>
      PleromaApiEmoji.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiEmoji obj) => obj.toJson();
}

class PleromaPollDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiPoll> {
  const PleromaPollDatabaseConverter() : super();

  @override
  PleromaApiPoll fromJson(Map<String, dynamic>? json) =>
      PleromaApiPoll.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiPoll obj) => obj.toJson();
}

class PleromaCardDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiCard> {
  const PleromaCardDatabaseConverter() : super();

  @override
  PleromaApiCard fromJson(Map<String, dynamic>? json) =>
      PleromaApiCard.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiCard obj) => obj.toJson();
}

class PleromaContentDatabaseConverter
    extends JsonDatabaseConverter<PleromaApiContent> {
  const PleromaContentDatabaseConverter() : super();

  @override
  PleromaApiContent fromJson(Map<String, dynamic>? json) =>
      PleromaApiContent.fromJson(json!);

  @override
  Map<String, dynamic> toJson(PleromaApiContent obj) => obj.toJson();
}

class PleromaEmojiReactionsListDatabaseConverter
    extends JsonListDatabaseConverter<PleromaApiStatusEmojiReaction> {
  const PleromaEmojiReactionsListDatabaseConverter() : super();

  @override
  PleromaApiStatusEmojiReaction fromJson(Map<String, dynamic> json) =>
      PleromaApiStatusEmojiReaction.fromJson(json);

  @override
  Map<String, dynamic> toJson(PleromaApiStatusEmojiReaction obj) =>
      obj.toJson();
}
