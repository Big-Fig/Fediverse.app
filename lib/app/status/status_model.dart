import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/card/pleroma_card_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
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

  PleromaVisibility get visibility;

  String get language;


  // expanded pleroma object fields

  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  PleromaContent get pleromaContent;

  // the ID of the AP context the status is associated with (if any)

  int get pleromaConversationId;

  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)

  int get pleromaDirectConversationId;

  // the acct property of User entity for replied user (if any)

  String get pleromaInReplyToAccountAcct;

  bool get pleromaLocal;

  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  PleromaContent get pleromaSpoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  DateTime get pleromaExpiresAt;

  bool get pleromaThreadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  List<PleromaEmojiReactions> get pleromaEmojiReactions;
}

class DbStatusWrapper implements IStatus {
  final DbStatus dbStatus;

  DbStatusWrapper(this.dbStatus);

  @override
  PleromaAccount get account => dbStatus.account;

  @override
  PleromaApplication get application => dbStatus.application;

  @override
  bool get bookmarked => dbStatus.bookmarked;

  @override
  PleromaCard get card => dbStatus.card;

  @override
  String get content => dbStatus.content;

  @override
  DateTime get createdAt => dbStatus.createdAt;

  @override
  List<PleromaEmoji> get emojis => dbStatus.emojis;

  @override
  bool get favourited => dbStatus.favourited;

  @override
  int get favouritesCount => dbStatus.favouritesCount;

  @override
  String get inReplyToAccountRemoteId => dbStatus.inReplyToAccountRemoteId;

  @override
  String get inReplyToRemoteId => dbStatus.inReplyToRemoteId;

  @override
  int get localId => dbStatus.id;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      dbStatus.mediaAttachments;

  @override
  List<PleromaMention> get mentions => dbStatus.mentions;

  @override
  bool get muted => dbStatus.muted;

  @override
  PleromaContent get pleromaContent => dbStatus.pleromaContent;

  @override
  int get pleromaConversationId => dbStatus.pleromaConversationId;

  @override
  int get pleromaDirectConversationId => dbStatus.pleromaDirectConversationId;

  @override
  List<PleromaEmojiReactions> get pleromaEmojiReactions =>
      dbStatus.pleromaEmojiReactions;

  @override
  DateTime get pleromaExpiresAt => dbStatus.pleromaExpiresAt;

  @override
  String get pleromaInReplyToAccountAcct =>
      dbStatus.pleromaInReplyToAccountAcct;

  @override
  bool get pleromaLocal => dbStatus.pleromaLocal;

  @override
  PleromaContent get pleromaSpoilerText => dbStatus.pleromaSpoilerText;

  @override
  bool get pleromaThreadMuted => dbStatus.pleromaThreadMuted;

  @override
  PleromaPoll get poll => dbStatus.poll;

  @override
  PleromaStatus get reblog => dbStatus.reblog;

  @override
  bool get reblogged => dbStatus.reblogged;

  @override
  int get reblogsCount => dbStatus.reblogsCount;

  @override
  String get remoteId => dbStatus.remoteId;

  @override
  int get repliesCount => dbStatus.repliesCount;

  @override
  bool get sensitive => dbStatus.sensitive;

  @override
  String get spoilerText => dbStatus.spoilerText;

  @override
  List<PleromaTag> get tags => dbStatus.tags;

  @override
  String get uri => dbStatus.uri;

  @override
  String get url => dbStatus.url;

  @override
  PleromaVisibility get visibility => dbStatus.visibility;

  @override
  String get language => dbStatus.language;
}
