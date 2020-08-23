import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

abstract class IDraftStatus {
  int get localId;

  DateTime get updatedAt;

  PostStatusData get data;
}

class DbDraftStatusWrapper implements IDraftStatus {
  final DbDraftStatus dbDraftStatus;

  DbDraftStatusWrapper(this.dbDraftStatus);

  @override
  int get localId => dbDraftStatus.id;

  @override
  PostStatusData get data => dbDraftStatus.data;

  @override
  DateTime get updatedAt => dbDraftStatus.updatedAt;
}

class DraftStatusAdapterToStatus implements IStatus {
  final notSupportedError = Exception("Not supported for draft status");
  @override
  final IAccount account;
  final IDraftStatus draftStatus;

  DraftStatusAdapterToStatus(
      {@required this.account, @required this.draftStatus});

  @override
  PleromaApplication get application => null;

  @override
  bool get bookmarked => throw notSupportedError;

  @override
  PleromaCard get card => null;

  @override
  String get content => draftStatus.data.text;

  @override
  IStatus copyWith(
      {IAccount account,
      IStatus reblog,
      int id,
      String remoteId,
      DateTime createdAt,
      IStatus inReplyToStatus,
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
  DateTime get createdAt => draftStatus.updatedAt;

  @override
  List<PleromaEmoji> get emojis => [];

  @override
  bool get favourited => throw notSupportedError;

  @override
  int get favouritesCount => throw notSupportedError;

  @override
  String get inReplyToAccountRemoteId => null;

  @override
  String get inReplyToRemoteId => draftStatus.data.inReplyToPleromaStatus.id;

  @override
  String get language => null;

  @override
  int get localId => draftStatus.localId;

  @override
  List<PleromaMention> get mentions => [];

  @override
  bool get muted => throw notSupportedError;

  @override
  bool get nsfwSensitive => draftStatus.data.isNsfwSensitiveEnabled;

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
  String get remoteId => null;

  @override
  int get repliesCount => null;

  @override
  String get spoilerText => draftStatus.data.subject;

  @override
  List<PleromaTag> get tags => [];

  @override
  String get uri => null;

  @override
  String get url => null;

  @override
  PleromaVisibility get visibility => draftStatus.data.visibilityPleroma;

  // todo: fix this, sometimes it may be reblog
  @override
  bool get isHaveReblog => false;

  // todo: fix this, sometimes it may be reply
  @override
  bool get isReply => false;

  @override
  // todo: fix this, sometimes it may be reply
  IStatus get inReplyToStatus => null;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      draftStatus.data.mediaAttachments;
}

int adjacentElementsProduct(List<int> inputArray) {
  int previousSum;
  int resultIndex;
  for (var i = 0; i < inputArray.length - 1; i++) {
    var currentSum = inputArray[i] + inputArray[i + 1];
    if (previousSum == null || currentSum > previousSum) {
      resultIndex = i;
      previousSum = currentSum;
    }
  }

  return inputArray[resultIndex] + inputArray[resultIndex + 1];
}


enum DraftStatusState { draft, canceled, alreadyPosted }
