import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:unifedi_api/unifedi_api.dart';
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
    extends JsonDatabaseConverter<UnifediApiApplication> {
  const PleromaApplicationDatabaseConverter() : super();

  @override
  UnifediApiApplication fromJson(Map<String, dynamic>? json) =>
      UnifediApiApplication.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiApplication obj) => obj.toJson();
}

class UnifediApiAccountReportDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiAccountReport> {
  const UnifediApiAccountReportDatabaseConverter() : super();

  @override
  UnifediApiAccountReport fromJson(Map<String, dynamic>? json) =>
      UnifediApiAccountReport.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiAccountReport obj) => obj.toJson();
}

class PleromaChatMessageDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiChatMessage> {
  const PleromaChatMessageDatabaseConverter() : super();

  @override
  UnifediApiChatMessage fromJson(Map<String, dynamic>? json) =>
      UnifediApiChatMessage.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiChatMessage obj) => obj.toJson();
}

class UnifediApiAccountDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiAccount> {
  const UnifediApiAccountDatabaseConverter() : super();

  @override
  UnifediApiAccount fromJson(Map<String, dynamic>? json) =>
      UnifediApiAccount.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiAccount obj) => obj.toJson();
}

class PleromaScheduledStatusParamsDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiScheduledStatusParams> {
  const PleromaScheduledStatusParamsDatabaseConverter() : super();

  @override
  UnifediApiScheduledStatusParams fromJson(Map<String, dynamic>? json) =>
      UnifediApiScheduledStatusParams.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiScheduledStatusParams obj) =>
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

class UnifediApiMyAccountNotificationsSettingsDatabaseConverter
    extends JsonDatabaseConverter<
        UnifediApiMyAccountNotificationsSettings> {
  const UnifediApiMyAccountNotificationsSettingsDatabaseConverter()
      : super();

  @override
  UnifediApiMyAccountNotificationsSettings fromJson(
    Map<String, dynamic>? json,
  ) =>
      UnifediApiMyAccountNotificationsSettings.fromJson(json!);

  @override
  Map<String, dynamic> toJson(
    UnifediApiMyAccountNotificationsSettings obj,
  ) =>
      obj.toJson();
}

class UnifediApiAccountRelationshipDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiAccountRelationship> {
  const UnifediApiAccountRelationshipDatabaseConverter() : super();

  @override
  UnifediApiAccountRelationship fromJson(Map<String, dynamic>? json) =>
      UnifediApiAccountRelationship.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiAccountRelationship obj) =>
      obj.toJson();
}

class UnifediApiMyAccountSourceDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiMyAccountSource> {
  const UnifediApiMyAccountSourceDatabaseConverter() : super();

  @override
  UnifediApiMyAccountSource fromJson(Map<String, dynamic>? json) =>
      UnifediApiMyAccountSource.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiMyAccountSource obj) => obj.toJson();
}

class UnifediApiStatusDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiStatus> {
  const UnifediApiStatusDatabaseConverter() : super();

  @override
  UnifediApiStatus fromJson(Map<String, dynamic>? json) =>
      UnifediApiStatus.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiStatus obj) => obj.toJson();
}

class unifediApiMediaAttachmentListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiMediaAttachment> {
  const unifediApiMediaAttachmentListDatabaseConverter() : super();

  @override
  UnifediApiMediaAttachment fromJson(Map<String, dynamic> json) =>
      UnifediApiMediaAttachment.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiMediaAttachment obj) => obj.toJson();
}

class UnifediApiEmojiReactionListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiEmojiReaction> {
  const UnifediApiEmojiReactionListDatabaseConverter() : super();

  @override
  UnifediApiEmojiReaction fromJson(Map<String, dynamic> json) =>
      UnifediApiEmojiReaction.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiEmojiReaction obj) =>
      obj.toJson();
}

class unifediApiMediaAttachmentDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiMediaAttachment> {
  const unifediApiMediaAttachmentDatabaseConverter() : super();

  @override
  UnifediApiMediaAttachment fromJson(Map<String, dynamic>? json) =>
      UnifediApiMediaAttachment.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiMediaAttachment obj) => obj.toJson();
}

class PleromaMentionListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiMention> {
  const PleromaMentionListDatabaseConverter() : super();

  @override
  UnifediApiMention fromJson(Map<String, dynamic> json) =>
      UnifediApiMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiMention obj) => obj.toJson();
}

class UnifediApiFieldListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiField> {
  const UnifediApiFieldListDatabaseConverter() : super();

  @override
  UnifediApiField fromJson(Map<String, dynamic> json) =>
      UnifediApiField.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiField obj) => obj.toJson();
}

class UnifediApiTagListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiTag> {
  const UnifediApiTagListDatabaseConverter() : super();

  @override
  UnifediApiTag fromJson(Map<String, dynamic> json) =>
      UnifediApiTag.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiTag obj) => obj.toJson();
}

class UnifediApiStatusListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiStatus> {
  const UnifediApiStatusListDatabaseConverter() : super();

  @override
  UnifediApiStatus fromJson(Map<String, dynamic> json) =>
      UnifediApiStatus.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiStatus obj) => obj.toJson();
}

class UnifediApiMentionListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiMention> {
  const UnifediApiMentionListDatabaseConverter() : super();

  @override
  UnifediApiMention fromJson(Map<String, dynamic> json) =>
      UnifediApiMention.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiMention obj) => obj.toJson();
}

class UnifediApiEmojiListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiEmoji> {
  const UnifediApiEmojiListDatabaseConverter() : super();

  @override
  UnifediApiEmoji fromJson(Map<String, dynamic> json) =>
      UnifediApiEmoji.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiEmoji obj) => obj.toJson();
}

class UnifediApiPollDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiPoll> {
  const UnifediApiPollDatabaseConverter() : super();

  @override
  UnifediApiPoll fromJson(Map<String, dynamic>? json) =>
      UnifediApiPoll.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiPoll obj) => obj.toJson();
}

class PleromaCardDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiCard> {
  const PleromaCardDatabaseConverter() : super();

  @override
  UnifediApiCard fromJson(Map<String, dynamic>? json) =>
      UnifediApiCard.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiCard obj) => obj.toJson();
}

class PleromaContentDatabaseConverter
    extends JsonDatabaseConverter<UnifediApiContentVariants> {
  const PleromaContentDatabaseConverter() : super();

  @override
  UnifediApiContentVariants fromJson(Map<String, dynamic>? json) =>
      UnifediApiContentVariants.fromJson(json!);

  @override
  Map<String, dynamic> toJson(UnifediApiContentVariants obj) => obj.toJson();
}

class EmojiReactionsListDatabaseConverter
    extends JsonListDatabaseConverter<UnifediApiEmojiReaction> {
  const EmojiReactionsListDatabaseConverter() : super();

  @override
  UnifediApiEmojiReaction fromJson(Map<String, dynamic> json) =>
      UnifediApiEmojiReaction.fromJson(json);

  @override
  Map<String, dynamic> toJson(UnifediApiEmojiReaction obj) =>
      obj.toJson();
}
