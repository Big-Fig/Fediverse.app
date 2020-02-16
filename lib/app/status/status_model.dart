import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/card/pleroma_card_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';



abstract class IStatus {
  int get localId;
  String get remoteId;

  DateTime get createdAt;

  String get inReplyToRemoteId;

  String get inReplyToAccountRemoteId;
  bool get sensitive;

  String get spoilerText;

  String get uri;
  String get url;

  int get repliesCount;

  int get reblogsCount;

  int get favouritesCount;
  bool get favourited;
  bool get reblogged;
  bool get muted;
  bool get bookmarked;
  String get content;
  PleromaStatus get reblog;
  PleromaApplication get application;
  PleromaAccount get account;

  List<PleromaMediaAttachment> get mediaAttachments;
  List<PleromaMention> get mentions;
  List<PleromaTag> get tags;
  List<PleromaEmoji> get emojis;
  PleromaPoll get poll;
  PleromaCard get card;
  PleromaStatusPleromaPart get pleroma;

  PleromaVisibility get visibility;

  // expanded pleroma object fields

  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  PleromaContent pleromaContent;

  // the ID of the AP context the status is associated with (if any)

  int pleromaConversationId;

  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)

  int pleromaDirectConversationId;

  // the acct property of User entity for replied user (if any)

  String pleromaInReplyToAccountAcct;
  bool pleromaLocal;

  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  PleromaContent pleromaSpoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  DateTime pleromaExpiresAt;

  bool pleromaThreadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  List<PleromaEmojiReactions> pleromaEmojiReactions;
}

abstract class DbStatusWrapper implements IStatus {
  DbStatus dbStatus;

  DbStatusWrapper(this.dbStatus);

  factory DbStatusWrapper.fromJson(Map<String, dynamic> json) {
//    return DbStatusWrapper(DbStatus.fromJson(json));
    return null;
  }
}
