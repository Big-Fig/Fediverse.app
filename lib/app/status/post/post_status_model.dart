import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/date_time/date_time_extension.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_model.g.dart';

abstract class IPostStatusData {
  String? get subject;

  String? get text;

  DateTime? get scheduledAt;

  String get visibilityString;

  String? get language;

  int? get expiresInSeconds;

  List<String>? get to;

  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  IPostStatusPoll? get poll;

  IPleromaApiStatus? get inReplyToPleromaStatus;

  String? get inReplyToConversationId;

  bool get isNsfwSensitiveEnabled;

  bool get isScheduled;

  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibilityString,
    String? language,
    List<String>? to,
    List<IPleromaApiMediaAttachment>? mediaAttachments,
    PleromaApiPostStatusPoll? poll,
    PleromaApiStatus? inReplyToPleromaStatus,
    String? inReplyToConversationId,
    bool? isNsfwSensitiveEnabled,
    int? expiresInSeconds,
  });
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class PostStatusData implements IPostStatusData {
  @override
  bool get isScheduled => scheduledAt != null;

  @override
  @JsonKey()
  final String? subject;
  @override
  @JsonKey()
  final String? text;
  @override
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;
  @override
  @JsonKey(name: 'visibility')
  final String visibilityString;
  @override
  final List<String>? to;
  @override
  @JsonKey(name: 'media_attachments')
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  @override
  final PostStatusPoll? poll;
  @override
  @JsonKey(name: 'in_reply_to_status')
  final PleromaApiStatus? inReplyToPleromaStatus;
  @override
  @JsonKey(name: 'in_reply_to_conversation_id')
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: 'is_nsfw_sensitive_enabled')
  final bool isNsfwSensitiveEnabled;

  @override
  @JsonKey()
  final String? language;

  @override
  @JsonKey(name: 'expires_in_seconds')
  final int? expiresInSeconds;

  const PostStatusData({
    required this.subject,
    required this.text,
    required this.scheduledAt,
    required this.visibilityString,
    required this.to,
    required this.mediaAttachments,
    required this.poll,
    required this.inReplyToPleromaStatus,
    required this.inReplyToConversationId,
    required this.isNsfwSensitiveEnabled,
    required this.language,
    required this.expiresInSeconds,
  });

  const PostStatusData.only({
    this.subject,
    this.text,
    this.scheduledAt,
    required this.visibilityString,
    this.to,
    this.mediaAttachments,
    this.poll,
    this.inReplyToPleromaStatus,
    this.inReplyToConversationId,
    required this.isNsfwSensitiveEnabled,
    this.language,
    this.expiresInSeconds,
  });

  PleromaApiVisibility get visibilityPleroma =>
      visibilityString.toPleromaApiVisibility();

  @override
  // ignore: long-parameter-list
  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibilityString,
    String? language,
    List<String>? to,
    List<IPleromaApiMediaAttachment>? mediaAttachments,
    IPleromaApiPostStatusPoll? poll,
    PleromaApiStatus? inReplyToPleromaStatus,
    String? inReplyToConversationId,
    bool? isNsfwSensitiveEnabled,
    int? expiresInSeconds,
  }) =>
      PostStatusData(
        subject: subject ?? this.subject,
        text: text ?? this.text,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
        visibilityString: visibilityString ?? this.visibilityString,
        language: language ?? this.language,
        to: to ?? this.to,
        mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
        poll: poll?.toPostStatusPoll() ?? this.poll,
        inReplyToPleromaStatus:
            inReplyToPleromaStatus ?? this.inReplyToPleromaStatus,
        inReplyToConversationId:
            inReplyToConversationId ?? this.inReplyToConversationId,
        isNsfwSensitiveEnabled:
            isNsfwSensitiveEnabled ?? this.isNsfwSensitiveEnabled,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusData &&
          runtimeType == other.runtimeType &&
          subject == other.subject &&
          text == other.text &&
          scheduledAt == other.scheduledAt &&
          visibilityString == other.visibilityString &&
          listEquals(to, other.to) &&
          listEquals(mediaAttachments, other.mediaAttachments) &&
          poll == other.poll &&
          inReplyToPleromaStatus == other.inReplyToPleromaStatus &&
          inReplyToConversationId == other.inReplyToConversationId &&
          isNsfwSensitiveEnabled == other.isNsfwSensitiveEnabled &&
          language == other.language;

  @override
  int get hashCode =>
      subject.hashCode ^
      text.hashCode ^
      scheduledAt.hashCode ^
      visibilityString.hashCode ^
      listHash(to) ^
      listHash(mediaAttachments) ^
      poll.hashCode ^
      inReplyToPleromaStatus.hashCode ^
      inReplyToConversationId.hashCode ^
      isNsfwSensitiveEnabled.hashCode ^
      language.hashCode;

  @override
  String toString() => 'PostStatusData{'
      'subject: $subject, '
      'text: $text, '
      'scheduledAt: $scheduledAt, '
      'visibility: $visibilityString, '
      'attachments: $mediaAttachments, '
      'poll: $poll, '
      'inReplyToStatus: $inReplyToPleromaStatus, '
      'inReplyToConversationId: $inReplyToConversationId, '
      'to: $to, '
      'language: $language, '
      'isNsfwSensitiveEnabled: $isNsfwSensitiveEnabled'
      '}';

  static PostStatusData fromJson(Map<String, dynamic> json) =>
      _$PostStatusDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostStatusDataToJson(this);
}

extension IPostStatusDataExtension on IPostStatusData {
  PleromaApiScheduleStatus toPleromaScheduleStatus({
    required String? idempotencyKey,
  }) {
    assert(isScheduled);

    return PleromaApiScheduleStatus(
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToPleromaStatus?.id,
      visibility: visibilityString,
      mediaIds: mediaAttachments?.toPleromaApiMediaAttachmentIds(),
      sensitive: isNsfwSensitiveEnabled,
      spoilerText: subject,
      status: text,
      to: to,
      scheduledAt: scheduledAt!,
      expiresInSeconds: expiresInSeconds,
      poll: poll?.toPleromaPostStatusPoll(),
      language: language,
      idempotencyKey: idempotencyKey,
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
        mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
        poll: poll?.toPostStatusPoll(),
        inReplyToPleromaStatus: inReplyToPleromaStatus?.toPleromaApiStatus(),
        inReplyToConversationId: inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: language,
        expiresInSeconds: expiresInSeconds,
      );
    }
  }

  PleromaApiPostStatus toPleromaPostStatus({
    required String? idempotencyKey,
  }) {
    assert(!isScheduled);

    return PleromaApiPostStatus(
      idempotencyKey: idempotencyKey,
      expiresInSeconds: expiresInSeconds,
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToPleromaStatus?.id,
      visibility: visibilityString,
      mediaIds: mediaAttachments?.toPleromaApiMediaAttachmentIds(),
      sensitive: isNsfwSensitiveEnabled,
      language: language,
      spoilerText: subject,
      status: text,
      to: to,
      poll: poll?.toPleromaPostStatusPoll(),
      contentType: null,
      preview: null,
    );
  }
}

extension PostStatusDataStatusExtension on IStatus {
  PostStatusData calculatePostStatusData({
    required PleromaApiInstancePollLimits limits,
  }) =>
      PostStatusData(
        subject: spoilerText,
        text: content,
        scheduledAt: null,
        visibilityString: visibility.toJsonValue(),
        to: mentions?.toAccts(),
        mediaAttachments: mediaAttachments,
        poll: poll?.toPostStatusPoll(
          limits: limits,
        ),
        inReplyToPleromaStatus: inReplyToStatus?.toPleromaStatus(),
        inReplyToConversationId: pleromaDirectConversationId?.toString(),
        isNsfwSensitiveEnabled: nsfwSensitive,
        language: language,
        expiresInSeconds:
            pleromaExpiresAt?.calculateExpiresInDurationOrNull()?.totalSeconds,
      );
}
