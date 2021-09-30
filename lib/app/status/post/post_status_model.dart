import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/date_time/date_time_extension.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

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

  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibilityString,
    String? language,
    List<String>? to,
    List<IUnifediApiMediaAttachment>? mediaAttachments,
    UnifediApiPostStatusPoll? poll,
    UnifediApiStatus? inReplyToUnifediApiStatus,
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
  final List<UnifediApiMediaAttachment>? mediaAttachments;
  @override
  final PostStatusPoll? poll;
  @override
  @JsonKey(name: 'in_reply_to_status')
  final UnifediApiStatus? inReplyToUnifediApiStatus;
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
    required this.inReplyToUnifediApiStatus,
    required this.inReplyToConversationId,
    required this.isNsfwSensitiveEnabled,
    required this.language,
    required this.expiresInSeconds,
  });

  PostStatusData.only({
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
  }) : this(
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

  UnifediApiVisibility get visibilityPleroma =>
      visibilityString.toUnifediApiVisibility();

  @override
  // ignore: long-parameter-list
  PostStatusData copyWith({
    String? subject,
    String? text,
    DateTime? scheduledAt,
    String? visibilityString,
    String? language,
    List<String>? to,
    List<IUnifediApiMediaAttachment>? mediaAttachments,
    IUnifediApiPostStatusPoll? poll,
    UnifediApiStatus? inReplyToUnifediApiStatus,
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
        mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(),
        poll: poll?.toPostStatusPoll() ?? this.poll,
        inReplyToUnifediApiStatus:
            inReplyToUnifediApiStatus ?? this.inReplyToUnifediApiStatus,
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
          inReplyToUnifediApiStatus == other.inReplyToUnifediApiStatus &&
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
      inReplyToUnifediApiStatus.hashCode ^
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
      'inReplyToStatus: $inReplyToUnifediApiStatus, '
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
  UnifediApiSchedulePostStatus toUnifediApiSchedulePostStatus() {
    assert(isScheduled);

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
      poll: poll?.topostStatusPoll(),
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
    assert(!isScheduled);

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
      poll: poll?.topostStatusPoll(),
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
