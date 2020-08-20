import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPostStatusData {
  String get subject;

  String get text;

  DateTime get scheduledAt;

  PleromaVisibility get visibility;

  List<IPleromaMediaAttachment> get attachments;

  IPostStatusPoll get poll;

  IStatus get inReplyToStatus;

  String get inReplyToConversationId;

  bool get isNsfwSensitiveEnabled;

  PostStatusData copyWith({
    String subject,
    String text,
    DateTime scheduledAt,
    PleromaVisibility visibility,
    IPleromaMediaAttachment attachments,
    PleromaPostStatusPoll poll,
    IStatus inReplyToStatus,
    String inReplyToConversationId,
    bool isNsfwSensitiveEnabled,
  });
}

class PostStatusData implements IPostStatusData {
  @override
  final String subject;
  @override
  final String text;
  @override
  final DateTime scheduledAt;
  @override
  final PleromaVisibility visibility;
  @override
  final List<IPleromaMediaAttachment> attachments;
  @override
  final IPostStatusPoll poll;
  @override
  final IStatus inReplyToStatus;
  @override
  final String inReplyToConversationId;
  @override
  final bool isNsfwSensitiveEnabled;

  const PostStatusData({
    @required this.subject,
    @required this.text,
    @required this.scheduledAt,
    @required this.visibility,
    @required this.attachments,
    @required this.poll,
    @required this.inReplyToStatus,
    @required this.inReplyToConversationId,
    @required this.isNsfwSensitiveEnabled,
  });

  @override
  PostStatusData copyWith({
    String subject,
    String text,
    DateTime scheduledAt,
    PleromaVisibility visibility,
    IPleromaMediaAttachment attachments,
    PleromaPostStatusPoll poll,
    IStatus inReplyToStatus,
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
        inReplyToStatus: inReplyToStatus ?? this.inReplyToStatus,
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
          inReplyToStatus == other.inReplyToStatus &&
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
      inReplyToStatus.hashCode ^
      inReplyToConversationId.hashCode ^
      isNsfwSensitiveEnabled.hashCode;
  @override
  String toString() => 'PostStatusData{subject: $subject, text: $text,'
      ' scheduledAt: $scheduledAt, visibility: $visibility,'
      ' attachments: $attachments, poll: $poll,'
      ' inReplyToStatus: $inReplyToStatus,'
      ' inReplyToConversationId: $inReplyToConversationId,'
      ' isNsfwSensitiveEnabled: $isNsfwSensitiveEnabled}';
}
