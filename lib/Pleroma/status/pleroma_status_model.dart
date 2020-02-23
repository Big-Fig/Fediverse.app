import 'dart:convert';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/card/pleroma_card_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/mastodon/status/mastodon_status_model.dart';
import 'package:fedi/mastodon/visibility/mastodon_visibility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_status_model.g.dart';

abstract class IPleromaStatus implements IMastodonStatus {
  // TODO: should be remove after refactoring
  set favourited(bool value);

  // TODO: should be remove after refactoring
  set favouritesCount(int value);

  // TODO: should be remove after refactoring
  set reblogged(bool value);

  // TODO: should be remove after refactoring
  set reblogsCount(int value);

  @override
  IPleromaApplication get application;

  @override
  IPleromaAccount get account;

  @override
  List<IPleromaMediaAttachment> get mediaAttachments;

  @override
  List<IPleromaMention> get mentions;

  @override
  List<IPleromaTag> get tags;

  @override
  List<IPleromaEmoji> get emojis;

  @override
  IPleromaPoll get poll;

  @override
  IPleromaCard get card;

  PleromaStatusPleromaPart get pleroma;

  PleromaVisibility get visibilityPleroma;
}

@JsonSerializable()
class PleromaStatus extends IPleromaStatus {
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "in_reply_to_id")
  final String inReplyToId;
  @JsonKey(name: "in_reply_to_account_id")
  String inReplyToAccountId;
  final bool sensitive;
  @JsonKey(name: "spoiler_text")
  final String spoilerText;

  final String uri;
  final String url;
  @JsonKey(name: "replies_count")
  final int repliesCount;
  @JsonKey(name: "reblogs_count")
  int reblogsCount;
  @JsonKey(name: "favourites_count")
  int favouritesCount;
  bool favourited;
  bool reblogged;
  final bool muted;
  final bool bookmarked;
  final String content;
  final PleromaStatus reblog;
  final PleromaApplication application;
  final PleromaAccount account;
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment> mediaAttachments;
  final List<PleromaMention> mentions;
  final List<PleromaTag> tags;
  final List<PleromaEmoji> emojis;
  final PleromaPoll poll;
  final PleromaCard card;
  final PleromaStatusPleromaPart pleroma;

  final String language;

  @override
  @JsonKey(name: "visibility")
  String visibilityRaw;
  @override
  MastodonVisibility get visibilityMastodon =>
      const MastodonVisibilityTypeConverter().fromJson(visibilityRaw);

  PleromaVisibility get visibilityPleroma =>
      const PleromaVisibilityTypeConverter().fromJson(visibilityRaw);

  PleromaStatus(
      {this.id,
      this.createdAt,
      this.inReplyToId,
      this.inReplyToAccountId,
      this.sensitive,
      this.spoilerText,
      this.uri,
      this.url,
      this.repliesCount,
      this.reblogsCount,
      this.favouritesCount,
      this.favourited,
      this.reblogged,
      this.muted,
      this.bookmarked,
      this.content,
      this.reblog,
      this.application,
      this.account,
      this.mediaAttachments,
      this.mentions,
      this.tags,
      this.emojis,
      this.poll,
      this.card,
      this.pleroma,
      this.visibilityRaw,
      this.language,
      });

  factory PleromaStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusFromJson(json);

  factory PleromaStatus.fromJsonString(String jsonString) =>
      _$PleromaStatusFromJson(jsonDecode(jsonString));

  static List<PleromaStatus> listFromJsonString(String str) =>
      new List<PleromaStatus>.from(
          json.decode(str).map((x) => PleromaStatus.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaStatusToJson(this));
}

@JsonSerializable()
class PleromaStatusPleromaPart {
  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  PleromaContent content;

  // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: "conversation_id")
  int conversationId;

  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)
  @JsonKey(name: "direct_conversation_id")
  int directConversationId;

  // the acct property of User entity for replied user (if any)
  @JsonKey(name: "in_reply_to_account_acct")
  String inReplyToAccountAcct;
  bool local;
  @JsonKey(name: "spoiler_text")
  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  PleromaContent spoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  @JsonKey(name: "expires_at")
  // TODO: fix when https://git.pleroma.social/pleroma/pleroma/issues/1573
  //  will be resolved
//  DateTime expiresAt;
  dynamic expiresAt;
  @JsonKey(name: "thread_muted")
  bool threadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  @JsonKey(name: "emoji_reactions")
  List<PleromaEmojiReactions> emojiReactions;


  PleromaStatusPleromaPart({this.content, this.conversationId,
    this.directConversationId, this.inReplyToAccountAcct, this.local,
    this.spoilerText, this.expiresAt, this.threadMuted, this.emojiReactions});

  factory PleromaStatusPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusPleromaPartFromJson(json);

  factory PleromaStatusPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaStatusPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaStatusPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaStatusPleromaPartToJson(this));
}
