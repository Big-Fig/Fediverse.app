import 'dart:convert';

import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_model.g.dart';

abstract class IPostStatusData {
  String get subject;

  String get text;

  DateTime get scheduledAt;

  PleromaVisibility get visibility;

  List<IPleromaMediaAttachment> get attachments;

  IPostStatusPoll get poll;

  IPleromaStatus get inReplyToPleromaStatus;

  String get inReplyToConversationId;

  bool get isNsfwSensitiveEnabled;

  PostStatusData copyWith({
    String subject,
    String text,
    DateTime scheduledAt,
    PleromaVisibility visibility,
    IPleromaMediaAttachment attachments,
    PleromaPostStatusPoll poll,
    PleromaStatus inReplyToPleromaStatus,
    String inReplyToConversationId,
    bool isNsfwSensitiveEnabled,
  });
}

@JsonSerializable()
class PostStatusData implements IPostStatusData {
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey(name: "scheduled_at")
  final DateTime scheduledAt;
  @override
  @JsonKey(name: "visibility")
  final PleromaVisibility visibility;
  @override
  @JsonKey(name: "attachments")
  final List<PleromaMediaAttachment> attachments;
  @override
  @JsonKey(name: "poll")
  final PostStatusPoll poll;
  @override
  @JsonKey(name: "in_reply_to_status")
  final PleromaStatus inReplyToPleromaStatus;
  @override
  @JsonKey(name: "in_reply_to_conversation_id")
  final String inReplyToConversationId;
  @override
  @JsonKey(name: "is_nsfw_sensitive_enabled")
  final bool isNsfwSensitiveEnabled;

  const PostStatusData({
    @required this.subject,
    @required this.text,
    @required this.scheduledAt,
    @required this.visibility,
    @required this.attachments,
    @required this.poll,
    @required this.inReplyToPleromaStatus,
    @required this.inReplyToConversationId,
    @required this.isNsfwSensitiveEnabled,
  });

  PleromaVisibility get visibilityPleroma =>
      pleromaVisibilityValues.map[visibility];

  @override
  PostStatusData copyWith({
    String subject,
    String text,
    DateTime scheduledAt,
    PleromaVisibility visibility,
    IPleromaMediaAttachment attachments,
    IPleromaPostStatusPoll poll,
    PleromaStatus inReplyToPleromaStatus,
    String inReplyToConversationId,
    bool isNsfwSensitiveEnabled,
  }) =>
      PostStatusData(
        subject: subject ?? this.subject,
        text: text ?? this.text,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        visibility: visibility ?? this.visibility,
        attachments: attachments ?? this.attachments,
        poll: poll ?? this.poll,
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
          attachments == other.attachments &&
          poll == other.poll &&
          inReplyToPleromaStatus == other.inReplyToPleromaStatus &&
          inReplyToConversationId == other.inReplyToConversationId &&
          isNsfwSensitiveEnabled == other.isNsfwSensitiveEnabled;

  @override
  int get hashCode =>
      subject.hashCode ^
      text.hashCode ^
      scheduledAt.hashCode ^
      visibility.hashCode ^
      attachments.hashCode ^
      poll.hashCode ^
      inReplyToPleromaStatus.hashCode ^
      inReplyToConversationId.hashCode ^
      isNsfwSensitiveEnabled.hashCode;

  @override
  String toString() => 'PostStatusData{subject: $subject, text: $text,'
      ' scheduledAt: $scheduledAt, visibility: $visibility,'
      ' attachments: $attachments, poll: $poll,'
      ' inReplyToStatus: $inReplyToPleromaStatus,'
      ' inReplyToConversationId: $inReplyToConversationId,'
      ' isNsfwSensitiveEnabled: $isNsfwSensitiveEnabled}';

  factory PostStatusData.fromJson(Map<String, dynamic> json) =>
      _$PostStatusDataFromJson(json);

  factory PostStatusData.fromJsonString(String jsonString) =>
      _$PostStatusDataFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PostStatusDataToJson(this);

  String toJsonString() => jsonEncode(_$PostStatusDataToJson(this));
}
