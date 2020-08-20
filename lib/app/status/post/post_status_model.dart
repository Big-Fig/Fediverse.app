import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPostStatusData {
  String get subject;

  String get text;

  DateTime get scheduled;

  PleromaVisibility get pleromaVisibility;

  List<IPleromaMediaAttachment> get attachments;

  PleromaPostStatusPoll get poll;

  String get inReplyToId;

  String get inReplyToConversationId;

  bool get nsfwSensitive;
}

class PostStatusData implements IPostStatusData {
  @override
  final String subject;
  @override
  final String text;
  @override
  final DateTime scheduled;
  @override
  final PleromaVisibility pleromaVisibility;
  @override
  final List<IPleromaMediaAttachment> attachments;
  @override
  final PleromaPostStatusPoll poll;
  @override
  final String inReplyToId;
  @override
  final String inReplyToConversationId;
  @override
  final bool nsfwSensitive;

  const PostStatusData({
    @required this.subject,
    @required this.text,
    @required this.scheduled,
    @required this.pleromaVisibility,
    @required this.attachments,
    @required this.poll,
    @required this.inReplyToId,
    @required this.inReplyToConversationId,
    @required this.nsfwSensitive,
  });

  PostStatusData copyWith({
    String subject,
    String text,
    DateTime scheduled,
    PleromaVisibility pleromaVisibility,
    IPleromaMediaAttachment attachments,
    PleromaPostStatusPoll poll,
    String inReplyToId,
    String inReplyToConversationId,
    bool nsfwSensitive,
  }) {
    return PostStatusData(
        subject: subject ?? this.subject,
        text: null,
        scheduled: null,
        pleromaVisibility: null,
        attachments: null,
        poll: null,
        inReplyToId: null,
        inReplyToConversationId: null,
        nsfwSensitive: null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusData &&
          runtimeType == other.runtimeType &&
          subject == other.subject &&
          text == other.text &&
          scheduled == other.scheduled &&
          pleromaVisibility == other.pleromaVisibility &&
          attachments == other.attachments &&
          poll == other.poll &&
          inReplyToId == other.inReplyToId &&
          inReplyToConversationId == other.inReplyToConversationId &&
          nsfwSensitive == other.nsfwSensitive;

  @override
  int get hashCode =>
      subject.hashCode ^
      text.hashCode ^
      scheduled.hashCode ^
      pleromaVisibility.hashCode ^
      attachments.hashCode ^
      poll.hashCode ^
      inReplyToId.hashCode ^
      inReplyToConversationId.hashCode ^
      nsfwSensitive.hashCode;

  @override
  String toString() {
    return 'PostStatusData{'
        ' subject: $subject,'
        ' text: $text, scheduled: $scheduled,'
        ' pleromaVisibility: $pleromaVisibility,'
        ' attachments: $attachments, poll: $poll,'
        ' inReplyToId: $inReplyToId,'
        ' inReplyToConversationId: $inReplyToConversationId,'
        ' nsfwSensitive: $nsfwSensitive}';
  }
}
