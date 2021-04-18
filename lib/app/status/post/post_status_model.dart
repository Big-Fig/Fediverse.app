import 'dart:convert';

import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/date_time/date_time_extension.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_model.g.dart';

abstract class IPostStatusData {
  String? get subject;

  String? get text;

  DateTime? get scheduledAt;

  String get visibility;

  String? get language;

  int? get expiresInSeconds;

  List<String>? get to;

  List<IPleromaMediaAttachment>? get mediaAttachments;

  IPostStatusPoll? get poll;

  IPleromaStatus? get inReplyToPleromaStatus;

  String? get inReplyToConversationId;

  bool get isNsfwSensitiveEnabled;

  bool get isScheduled;

  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibility,
    String? language,
    List<String>? to,
    List<IPleromaMediaAttachment>? mediaAttachments,
    PleromaPostStatusPoll? poll,
    PleromaStatus? inReplyToPleromaStatus,
    String? inReplyToConversationId,
    bool? isNsfwSensitiveEnabled,
    int? expiresInSeconds,
  });
}

@JsonSerializable(includeIfNull: false)
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
  @JsonKey(name: "scheduled_at")
  final DateTime? scheduledAt;
  @override
  final String visibility;
  @override
  final List<String>? to;
  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment>? mediaAttachments;
  @override
  final PostStatusPoll? poll;
  @override
  @JsonKey(name: "in_reply_to_status")
  final PleromaStatus? inReplyToPleromaStatus;
  @override
  @JsonKey(name: "in_reply_to_conversation_id")
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: "is_nsfw_sensitive_enabled")
  final bool isNsfwSensitiveEnabled;

  @override
  @JsonKey()
  final String? language;

  @override
  @JsonKey(name: "expires_in_seconds")
  final int? expiresInSeconds;

  const PostStatusData({
    required this.subject,
    required this.text,
    required this.scheduledAt,
    required this.visibility,
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
    required this.visibility,
    this.to,
    this.mediaAttachments,
    this.poll,
    this.inReplyToPleromaStatus,
    this.inReplyToConversationId,
    required this.isNsfwSensitiveEnabled,
    this.language,
    this.expiresInSeconds,
  });

  PleromaVisibility get visibilityPleroma => visibility.toPleromaVisibility();


  @override
  // ignore: long-parameter-list
  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibility,
    String? language,
    List<String>? to,
    List<IPleromaMediaAttachment>? mediaAttachments,
    IPleromaPostStatusPoll? poll,
    PleromaStatus? inReplyToPleromaStatus,
    String? inReplyToConversationId,
    bool? isNsfwSensitiveEnabled,
    int? expiresInSeconds,
  }) =>
      PostStatusData(
        subject: subject ?? this.subject,
        text: text ?? this.text,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
        visibility: visibility ?? this.visibility,
        language: language ?? this.language,
        to: to ?? this.to,
        mediaAttachments: mediaAttachments?.toPleromaMediaAttachments(),
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
          visibility == other.visibility &&
          to == other.to &&
          mediaAttachments == other.mediaAttachments &&
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
      visibility.hashCode ^
      to.hashCode ^
      mediaAttachments.hashCode ^
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
      'visibility: $visibility, '
      'attachments: $mediaAttachments, '
      'poll: $poll, '
      'inReplyToStatus: $inReplyToPleromaStatus, '
      'inReplyToConversationId: $inReplyToConversationId, '
      'to: $to, '
      'language: $language, '
      'isNsfwSensitiveEnabled: $isNsfwSensitiveEnabled'
      '}';

  factory PostStatusData.fromJson(Map<String, dynamic> json) =>
      _$PostStatusDataFromJson(json);

  factory PostStatusData.fromJsonString(String jsonString) =>
      _$PostStatusDataFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PostStatusDataToJson(this);

  String toJsonString() => jsonEncode(_$PostStatusDataToJson(this));
}

extension IPostStatusDataExtension on IPostStatusData {
  PleromaScheduleStatus toPleromaScheduleStatus({
    required String? idempotencyKey,
  }) {
    assert(isScheduled);
    return PleromaScheduleStatus(
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToPleromaStatus?.id,
      visibility: visibility,
      mediaIds: mediaAttachments?.toPleromaMediaAttachmentIds(),
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
        visibility: visibility,
        to: to,
        mediaAttachments: mediaAttachments?.toPleromaMediaAttachments(),
        poll: poll?.toPostStatusPoll(),
        inReplyToPleromaStatus: inReplyToPleromaStatus?.toPleromaStatus(),
        inReplyToConversationId: inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: language,
        expiresInSeconds: expiresInSeconds,
      );
    }
  }

  PleromaPostStatus toPleromaPostStatus({
    required String? idempotencyKey,
  }) {
    assert(!isScheduled);

    return PleromaPostStatus(
      idempotencyKey: idempotencyKey,
      expiresInSeconds: expiresInSeconds,
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToPleromaStatus?.id,
      visibility: visibility,
      mediaIds: mediaAttachments?.toPleromaMediaAttachmentIds(),
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
    required PleromaInstancePollLimits limits,
  }) =>
      PostStatusData(
        subject: spoilerText,
        text: content,
        scheduledAt: null,
        visibility: visibility.toJsonValue(),
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
