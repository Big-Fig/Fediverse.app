import 'dart:convert';

import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:flutter/widgets.dart';

import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_status_model.g.dart';

@JsonSerializable()
@VisibilityTypeConverter()
class MastodonStatus {
  String id;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "in_reply_to_id")
  String inReplyToId;
  @JsonKey(name: "in_reply_to_account_id")
  String inReplyToAccountId;
  bool sensitive;
  @JsonKey(name: "spoiler_text")
  String spoilerText;
  @JsonKey(name: "visibility")
  String visibilityRaw;
  String uri;
  String url;
  @JsonKey(name: "replies_count")
  int repliesCount;
  @JsonKey(name: "reblogs_count")
  int reblogsCount;
  @JsonKey(name: "favourites_count")
  int favouritesCount;
  bool favourited;
  bool reblogged;
  bool muted;
  bool bookmarked;
  bool pinned;
  String content;
  MastodonStatus reblog;
  Application application;
  MastodonAccount account;
  @JsonKey(name: "media_attachments")
  List<MastodonMediaAttachment> mediaAttachments;
  List<Mention> mentions;
  List<Tag> tags;
  List<Emoji> emojis;
  dynamic poll;

  VisibilityMastodon get visibilityMastodon => const VisibilityMastodonTypeConverter().fromJson
    (visibilityRaw);


  MastodonStatus({
    @required this.id,
    @required this.createdAt,
    @required this.inReplyToId,
    @required this.inReplyToAccountId,
    @required this.sensitive,
    @required this.spoilerText,
    @required this.visibilityRaw,
    @required this.uri,
    @required this.url,
    @required this.repliesCount,
    @required this.reblogsCount,
    @required this.favouritesCount,
    @required this.favourited,
    @required this.reblogged,
    @required this.muted,
    @required this.bookmarked,
    @required this.pinned,
    @required this.content,
    @required this.reblog,
    @required this.application,
    @required this.account,
    @required this.mediaAttachments,
    @required this.mentions,
    @required this.tags,
    @required this.emojis,
    @required this.poll,
  });

  factory MastodonStatus.fromJson(Map<String, dynamic> json) => _$MastodonStatusFromJson(json);

  factory MastodonStatus.fromJsonString(String jsonString) =>
      _$MastodonStatusFromJson(jsonDecode(jsonString));

  static List<MastodonStatus> listFromJsonString(String str) =>
      new List<MastodonStatus>.from(json.decode(str).map((x) => MastodonStatus.fromJson(x)));

  Map<String, dynamic> toJson() => _$MastodonStatusToJson(this);

  String toJsonString() => jsonEncode(_$MastodonStatusToJson(this));
}