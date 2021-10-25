import 'package:fedi_app/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/date_time/date_time_extension.dart';
import 'package:fedi_app/duration/duration_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'post_status_model.freezed.dart';
part 'post_status_model.g.dart';

abstract class IPostStatusData {
  String? get subject;

  String? get text;

  DateTime? get scheduledAt;

  String get visibilityString;

  String? get language;

  int? get expiresInSeconds;

  List<String>? get to;

  List<IUnifediApiMediaAttachment>? get mediaAttachments;

  IPostStatusPoll? get poll;

  IUnifediApiStatus? get inReplyToUnifediApiStatus;

  String? get inReplyToConversationId;

  bool get isNsfwSensitiveEnabled;

  bool get isScheduled;
}

@freezed
class PostStatusData with _$PostStatusData implements IPostStatusData {
  const PostStatusData._();

  const factory PostStatusData({
    required String? subject,
    required String? text,
    @JsonKey(name: 'scheduled_at') required DateTime? scheduledAt,
    @JsonKey(name: 'visibility') required String visibilityString,
    required List<String>? to,
    @JsonKey(name: 'media_attachments')
        required List<UnifediApiMediaAttachment>? mediaAttachments,
    required PostStatusPoll? poll,
    @JsonKey(name: 'in_reply_to_status')
        required UnifediApiStatus? inReplyToUnifediApiStatus,
    @JsonKey(name: 'in_reply_to_conversation_id')
        required String? inReplyToConversationId,
    @JsonKey(name: 'is_nsfw_sensitive_enabled')
        required bool isNsfwSensitiveEnabled,
    required String? language,
    @JsonKey(name: 'expires_in_seconds') required int? expiresInSeconds,
  }) = _PostStatusData;

  // ignore: long-parameter-list
  static PostStatusData only({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    UnifediApiVisibility visibility = UnifediApiVisibility.publicValue,
    List<String>? to,
    List<IUnifediApiMediaAttachment>? mediaAttachments,
    PostStatusPoll? poll,
    IUnifediApiStatus? inReplyToUnifediApiStatus,
    String? inReplyToConversationId,
    bool isNsfwSensitiveEnabled = false,
    String? language,
    Duration? expiresIn,
  }) =>
      PostStatusData(
        subject: subject,
        text: text,
        scheduledAt: scheduledAt,
        visibilityString: visibility.stringValue,
        to: to,
        mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(),
        poll: poll,
        inReplyToUnifediApiStatus:
            inReplyToUnifediApiStatus?.toUnifediApiStatus(),
        inReplyToConversationId: inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: language,
        expiresInSeconds: expiresIn?.totalSeconds,
      );

  @override
  bool get isScheduled => scheduledAt != null;

  UnifediApiVisibility get visibilityUnifedi =>
      visibilityString.toUnifediApiVisibility();

  factory PostStatusData.fromJson(Map<String, dynamic> json) =>
      _$PostStatusDataFromJson(json);
}

extension IPostStatusDataExtension on IPostStatusData {
  UnifediApiSchedulePostStatus toUnifediApiSchedulePostStatus() {
    assert(isScheduled, 'cant convert non-scheduled status');

    return UnifediApiSchedulePostStatus(
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToUnifediApiStatus?.id,
      visibility: visibilityString,
      mediaIds: mediaAttachments?.toUnifediApiMediaAttachmentIdList(),
      sensitive: isNsfwSensitiveEnabled,
      spoilerText: subject,
      status: text,
      to: to,
      scheduledAt: scheduledAt!,
      expiresInSeconds: expiresInSeconds,
      poll: poll?.toUnifediApiPostStatusPoll(),
      language: language,
      contentType: null,
      preview: null,
    );
  }

  PostStatusData toPostStatusData() {
    if (this is PostStatusData) {
      return this as PostStatusData;
    } else {
      return PostStatusData(
        subject: subject,
        text: text,
        scheduledAt: scheduledAt,
        visibilityString: visibilityString,
        to: to,
        mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(),
        poll: poll?.toPostStatusPoll(),
        inReplyToUnifediApiStatus:
            inReplyToUnifediApiStatus?.toUnifediApiStatus(),
        inReplyToConversationId: inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: language,
        expiresInSeconds: expiresInSeconds,
      );
    }
  }

  UnifediApiPostStatus toPostStatus({
    required bool inReplyToConversationIdSupported,
    required bool previewSupported,
    required bool expiresInSupported,
  }) {
    assert(!isScheduled, 'cant convert scheduled status');

    return UnifediApiPostStatus(
      expiresInSeconds: expiresInSupported ? expiresInSeconds : null,
      inReplyToConversationId:
          inReplyToConversationIdSupported ? inReplyToConversationId : null,
      inReplyToId: inReplyToUnifediApiStatus?.id,
      visibility: visibilityString,
      mediaIds: mediaAttachments?.toUnifediApiMediaAttachmentIdList(),
      sensitive: isNsfwSensitiveEnabled,
      language: language,
      spoilerText: subject,
      status: text,
      to: to,
      poll: poll?.toUnifediApiPostStatusPoll(),
      contentType: null,
      preview: null,
    );
  }
}

extension PostStatusDataStatusExtension on IStatus {
  PostStatusData calculatePostStatusData({
    required IUnifediApiInstancePollLimits? limits,
  }) =>
      PostStatusData(
        subject: spoilerText,
        text: content,
        scheduledAt: null,
        visibilityString: visibility.stringValue,
        to: mentions?.toAccts(),
        mediaAttachments: mediaAttachments,
        poll: poll?.toPostStatusPoll(
          limits: limits,
        ),
        inReplyToUnifediApiStatus: inReplyToStatus?.toUnifediApiStatus(),
        inReplyToConversationId: directConversationId?.toString(),
        isNsfwSensitiveEnabled: nsfwSensitive,
        language: language,
        expiresInSeconds:
            expiresAt?.calculateExpiresInDurationOrNull()?.totalSeconds,
      );
}
