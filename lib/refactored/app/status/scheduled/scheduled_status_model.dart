import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

abstract class IScheduledStatus {
  int get localId;

  String get remoteId;

  DateTime get scheduledAt;

  IPleromaScheduledStatusParams get params;

  List<PleromaMediaAttachment> get mediaAttachments;

  bool get canceled;

  IScheduledStatus copyWith(
      {int localId,
      String remoteId,
      DateTime scheduledAt,
      IPleromaScheduledStatusParams params,
      bool canceled,
      List<PleromaMediaAttachment> mediaAttachments});
}

class DbScheduledStatusWrapper implements IScheduledStatus {
  final DbScheduledStatus dbScheduledStatus;

  DbScheduledStatusWrapper(this.dbScheduledStatus);

  @override
  IScheduledStatus copyWith(
          {int localId,
          String remoteId,
          DateTime scheduledAt,
          IPleromaScheduledStatusParams params,
          bool canceled,
          List<PleromaMediaAttachment> mediaAttachments}) =>
      DbScheduledStatusWrapper(dbScheduledStatus.copyWith(
          id: localId,
          remoteId: remoteId,
          scheduledAt: scheduledAt,
          params: params,
          canceled: canceled,
          mediaAttachments: mediaAttachments));

  @override
  int get localId => dbScheduledStatus.id;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      dbScheduledStatus.mediaAttachments;

  @override
  IPleromaScheduledStatusParams get params => dbScheduledStatus.params;

  @override
  String get remoteId => dbScheduledStatus.remoteId;

  @override
  DateTime get scheduledAt => dbScheduledStatus.scheduledAt;

  @override
  bool get canceled => dbScheduledStatus.canceled;
}

class ScheduledStatusAdapterToStatus implements IStatus {
  final notSupportedError = Exception("Not supported for scheduled status");
  final IAccount account;
  final IScheduledStatus scheduledStatus;

  ScheduledStatusAdapterToStatus(
      {@required this.account, @required this.scheduledStatus});

  @override
  PleromaApplication get application => null;

  @override
  bool get bookmarked => throw notSupportedError;

  @override
  PleromaCard get card => null;

  @override
  String get content => scheduledStatus.params.text;

  @override
  IStatus copyWith(
      {IAccount account,
      IStatus reblog,
      int id,
      String remoteId,
      DateTime createdAt,
      String inReplyToRemoteId,
      String inReplyToAccountRemoteId,
      bool nsfwSensitive,
      String spoilerText,
      PleromaVisibility visibility,
      String uri,
      String url,
      int repliesCount,
      int reblogsCount,
      int favouritesCount,
      bool favourited,
      bool reblogged,
      bool muted,
      bool bookmarked,
      bool pinned,
      String content,
      String reblogStatusRemoteId,
      PleromaApplication application,
      String accountRemoteId,
      List<PleromaMediaAttachment> mediaAttachments,
      List<PleromaMention> mentions,
      List<PleromaTag> tags,
      List<PleromaEmoji> emojis,
      PleromaPoll poll,
      PleromaCard card,
      String language,
      PleromaContent pleromaContent,
      int pleromaConversationId,
      int pleromaDirectConversationId,
      String pleromaInReplyToAccountAcct,
      bool pleromaLocal,
      PleromaContent pleromaSpoilerText,
      DateTime pleromaExpiresAt,
      bool pleromaThreadMuted,
      List<PleromaStatusEmojiReaction> pleromaEmojiReactions}) {
    throw notSupportedError;
  }

  @override
  DateTime get createdAt => scheduledStatus.scheduledAt;

  @override
  List<PleromaEmoji> get emojis => [];

  @override
  bool get favourited => throw notSupportedError;

  @override
  int get favouritesCount => throw notSupportedError;

  @override
  String get inReplyToAccountRemoteId => null;

  @override
  String get inReplyToRemoteId => scheduledStatus.params.inReplyToId;

  @override
  String get language => null;

  @override
  int get localId => scheduledStatus.localId;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      scheduledStatus.mediaAttachments;

  @override
  List<PleromaMention> get mentions => [];

  @override
  bool get muted => throw notSupportedError;

  @override
  bool get nsfwSensitive => scheduledStatus.params.sensitive;

  @override
  bool get pinned => throw notSupportedError;

  @override
  PleromaContent get pleromaContent => null;

  @override
  int get pleromaConversationId => null;

  @override
  int get pleromaDirectConversationId => null;

  @override
  List<PleromaStatusEmojiReaction> get pleromaEmojiReactions => null;

  @override
  DateTime get pleromaExpiresAt => null;

  @override
  String get pleromaInReplyToAccountAcct => null;

  @override
  bool get pleromaLocal => null;

  @override
  PleromaContent get pleromaSpoilerText => null;

  @override
  bool get pleromaThreadMuted => null;

  @override
  PleromaPoll get poll => null;

  @override
  IStatus get reblog => null;

  @override
  String get reblogStatusRemoteId => null;

  @override
  bool get reblogged => null;

  @override
  int get reblogsCount => null;

  @override
  String get remoteId => scheduledStatus.remoteId;

  @override
  int get repliesCount => null;

  @override
  String get spoilerText => scheduledStatus.params.spoilerText;

  @override
  List<PleromaTag> get tags => [];

  @override
  String get uri => null;

  @override
  String get url => null;

  @override
  PleromaVisibility get visibility => scheduledStatus.params.pleromaVisibility;
}
