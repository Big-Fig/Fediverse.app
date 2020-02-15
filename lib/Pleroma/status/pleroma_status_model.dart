import 'dart:convert';

import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/mastodon/status/mastodon_status_model.dart';
import 'package:flutter/widgets.dart';

import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_status_model.g.dart';


@JsonSerializable()
class Status extends MastodonStatus {

  final StatusPleroma pleroma;

  Status({
    String id,
    DateTime createdAt,
    String inReplyToId,
    String inReplyToAccountId,
    bool sensitive,
    String spoilerText,
    String visibilityRaw,
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
    Status reblog,
    Application application,
    Account account,
    List<MediaAttachment> mediaAttachments,
    List<Mention> mentions,
    List<Tag> tags,
    List<Emoji> emojis,
    dynamic poll,
    this.pleroma,
  }) :super(
      id: id,
      createdAt: createdAt,
      inReplyToId: inReplyToId,
      inReplyToAccountId: inReplyToAccountId,
      sensitive: sensitive,
      spoilerText: spoilerText,
      visibilityRaw: visibilityRaw,
      uri: uri,
      url: url,
      repliesCount: repliesCount,
      reblogsCount: reblogsCount,
      favouritesCount: favouritesCount,
      favourited: favourited,
      reblogged: reblogged,
      muted: muted,
      pinned: pinned,
      bookmarked: bookmarked,
      content: content,
      reblog: reblog,
      application: application,
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: mentions,
      tags: tags,
      emojis: emojis,
      poll: poll
  );


  Visibility get visibility => const VisibilityTypeConverter().fromJson(visibilityRaw);

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  factory Status.fromJsonString(String jsonString) =>
      _$StatusFromJson(jsonDecode(jsonString));

  static List<Status> listFromJsonString(String str) =>
      new List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  String toJsonString() => jsonEncode(_$StatusToJson(this));
}
